package com.Controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Model.Address;
import com.Model.Customer;
import com.Service.AddressService;
import com.Service.CustomerService;
import com.Util.Constants;
import com.Util.StringUtil;




@Controller
@RequestMapping("/customer")
public class CustomerCotroller {
	@Resource
	private CustomerService custService;
	@Resource
	private AddressService addressService;
	
	/**
	 * @description:用户注册
	 * @author liling
	 * @date 2017-04-14
	 * 
	 * */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request,Model model){
		//int custId;
		Customer customer = new Customer();
		
		String custName = request.getParameter("custName");
		customer.setCustName(custName);
		String phoneNumber = request.getParameter("phoneNumber");
		customer.setPhoneNumber(phoneNumber);
		String email = request.getParameter("email");
		customer.setEmail(email);
		String birthdate = request.getParameter("birthdate");
			customer.setBirthdate(birthdate);
		
		String gender = request.getParameter("gender");
		customer.setGender(gender);
		String custPassword = request.getParameter("custPassword");
		customer.setCustPassword(custPassword);
		customer.setCustCashes(Constants.INIT_CASH);
		Customer cust = custService.getByCustName(custName);
		if(cust != null){
			model.addAttribute("register","exist");
			
			return "redirect:../jsp/front/register.jsp";
		}
		else{
			
			int custId = custService.register(customer);
			if (custId != Constants.NO_CUSTID) {
				customer.setCustId(custId);
				model.addAttribute("register","success");
				customer.setCustAddress(Constants.NO_ADDRESS);
				request.getSession().setAttribute("customer", customer);
				request.getSession().setAttribute("address", null);
				return "redirect:../jsp/front/address.jsp";

			}
			else{
				model.addAttribute("register","fail");
				return "redirect:../jsp/front/register.jsp";
			}
			
		}
		
	}


	/**
	 * @description:用户登录
	 * @author liling
	 * @date 2017-04-14
	 * 
	 * */
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, Model model) {
		String custName = request.getParameter("custName");
		String custPassword = request.getParameter("custPassword");
		Customer cust = custService.getByCustName(custName);
		if(cust == null){
			model.addAttribute("login", "notexist");
			return "redirect:../jsp/front/login.jsp";
		}
		else{
			cust = custService.login(custName, custPassword);
			if (cust != null) {
				if(cust.getCustAddress()==Constants.NO_ADDRESS){
					request.getSession().setAttribute("address", null);
				}
				else{
					Address address = addressService.getAddressById(cust.getCustAddress());
					request.getSession().setAttribute("address", address);
				}
				request.getSession().setAttribute("login", "success");
				request.getSession().setAttribute("customer", cust);
				model.addAttribute("custName",cust.getCustName());
				model.addAttribute("custID",cust.getCustId());
				return "redirect:../jsp/front/welcome.jsp";
			}
			else{
				model.addAttribute("login", "wrongpwd");
				return "redirect:../jsp/front/login.jsp";
			}
		}
		
	}
	
	/**
	 * @description:用户信息修改
	 * @author liling
	 * @date 2017-04-14
	 * 
	 * */
	@RequestMapping("/update.do")
	public String update(HttpServletRequest request, Model model) {
		Customer customer = new Customer();
		int custId = StringUtil.StringToInt(request.getParameter("custId"));
		
		customer.setCustId(custId);
		String custName = request.getParameter("custName");
		customer.setCustName(custName);
		String phoneNumber = request.getParameter("phoneNumber");
		customer.setPhoneNumber(phoneNumber);
		String email = request.getParameter("email");
		customer.setEmail(email);
		String birthdate = request.getParameter("birthdate");
			customer.setBirthdate(birthdate);
		
		String gender = request.getParameter("gender");
		customer.setGender(gender);
		String custPassword = request.getParameter("custPassword");
		customer.setCustPassword(custPassword);
		float precash = StringUtil.strToFloat(request.getParameter("precustCashes"));
		float charge;
		if(request.getParameter("custCashes")==null){
			charge = 0;
		}
		else{
			charge = StringUtil.strToFloat(request.getParameter("custCashes"));//充值
		}
		
		customer.setCustCashes(charge+precash);
		Boolean result = custService.update(customer);
		if(result){
			customer = custService.getByCustId(custId);
			model.addAttribute("update","success");
			request.getSession().setAttribute("customer", customer);
			return "redirect:../jsp/front/personal-info.jsp";
		}
		else{
			model.addAttribute("update","fail");
			return "redirect:../jsp/front/personal-info.jsp";
		}
	}
	
	/**
	 * @description:用户添加地址
	 * @author liling
	 * @date 2017-04-16
	 * 
	 * */
	@RequestMapping("/dealAddress.do")
	public String dealAddress(HttpServletRequest request, Model model){
		Address address = new Address();
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String area = request.getParameter("area");
		int custId = StringUtil.StringToInt(request.getParameter("custId"));
		address.setProvince(province);
		address.setCity(city);
		address.setDistrict(district);
		address.setArea(area);
		
		int custAddress = StringUtil.StringToInt(request.getParameter("custAddress"));
		if(custAddress == -1){//新增地址

			int addressId = addressService.addAddress(address);
			if(addressId != Constants.NO_ADDRESS){
				address.setAddressId(addressId);
				//int custId = StringUtil.StringToInt(request.getParameter("custId"));
				Customer cust= custService.getByCustId(custId);
				cust.setCustAddress(addressId);
				Boolean result = custService.update(cust);
				if(result == true){
					cust= custService.getByCustId(custId);
					request.getSession().setAttribute("customer", cust);
					request.getSession().setAttribute("customer", cust);
					request.getSession().setAttribute("address", address);
					model.addAttribute("addAddress", "success");
					return "redirect:../jsp/front/address.jsp";
				}
				else{
					Boolean deleteAddress = addressService.deleteAddressById(addressId);
					model.addAttribute("addAddress", "bindfail");
					return "redirect:../jsp/front/address.jsp";
				}
			}
			else{
				model.addAttribute("addAddress", "fail");
				return "redirect:../jsp/front/address.jsp";
			}
		}
		else{//更新地址
			address.setAddressId(custAddress);
			Boolean updateResult = addressService.updateAddress(address);
			if(updateResult == true){
				//Customer cust= custService.getByCustId(custId);
				//request.getSession().setAttribute("customer", cust);
				request.getSession().setAttribute("address", address);
				model.addAttribute("modifyAddress", "success");
				return "redirect:../jsp/front/address.jsp";
			}
			else{
				model.addAttribute("modifyAddress", "fail");
				return "redirect:../jsp/front/address.jsp";
			}
		}
		
		
		
	}


}
