package com.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Model.Customer;
import com.Model.Order;
import com.Model.OrderItem;
import com.Model.Product;
import com.Service.CustomerService;
import com.Service.OrderService;
import com.Service.ProductService;
import com.Util.Constants;
import com.Util.StringUtil;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private ProductService productService;
	@Resource
	private OrderService orderService;
	@Resource
	private CustomerService customerService;
	
	@RequestMapping("/pay.do")
	public ModelAndView pay(HttpServletRequest request){
		Map<String,Object> model = new HashMap<String,Object>();
		int orderId = StringUtil.StringToInt(request.getParameter("orderId").toString());
		String password = request.getParameter("payPassword").toString();
		int custId = StringUtil.StringToInt(request.getParameter("custId").toString());
		float expense = StringUtil.strToFloat(request.getParameter("expense").toString());
		
		
		Customer customer = customerService.getByCustId(custId);
		if(customer.getCustPassword().equals(password)){ //验证支付密码是否正确，与登录密码一致
			//更改用户金额
			float custCashes = customer.getCustCashes();
			if(custCashes - expense >= 0){
				customer.setCustCashes(custCashes - expense);
				Boolean updateCust = customerService.update(customer);
				if(updateCust == true){
					//更改订单状态
					Order order = orderService.getOrderByOrderId(orderId);
					order.setOrderStatus(Constants.STATUS_FORDELIVERY);//由未支付到待发货状态
					Boolean updateOrder = orderService.updateOrder(order);
					if(updateOrder == true){
						model.put("pay", "success");
						model.put("cash", customer.getCustCashes());
						model.put("order", order);
						return new ModelAndView("/jsp/front/success",model);
					}
					else{
						model.put("pay", "fail");
					}
				}
				else{
					model.put("pay", "fail");
				}
			}
			else{
				model.put("pay", "nocashes");//可用金额不够
			}	
		}else{
			model.put("pay","wrongpwd");//密码错误
		}
		return new ModelAndView();
	}
	
	/**
	 * @description 获取用户订单
	 * */
	@RequestMapping("/getOrderBycustId/{custId}.do")
	public ModelAndView getOrderBycustId(@PathVariable int custId){
		Map<String,Object> model = new HashMap<String,Object>();
		List<Order> orders = orderService.getOrderByCustId(custId);
		List totalOrders = new ArrayList();
		
		if(orders==null){
			model.put("totalOrders", null);
		}
		else{
			Iterator iterator = orders.iterator();
			List<OrderItem> orderItems = null;
			while(iterator.hasNext()){
				orderItems = new ArrayList<OrderItem>();
				Order order = (Order) iterator.next();
				//Map orderMap =(Map) iterator.next();
				int orderId = order.getOrderId();
				List<OrderItem> orderItemList = orderService.getItemByOrderId(orderId);
				if(orderItemList==null){
					totalOrders.add(null);
				}
				else{
					Iterator iterator2 = orderItemList.iterator();
					while(iterator2.hasNext()){
						//Map itemMap = (Map)iterator2.next();
						Map<String,Object> totalOrder = new HashMap<String,Object>();
						OrderItem item = (OrderItem) iterator2.next();
						Product product = productService.getProductById(item.getProductId());
						totalOrder.put("orderId", order.getOrderId());
						totalOrder.put("orderDate",order.getOrderDate());
						totalOrder.put("customerId",order.getCustomerId());
						String orderStatus = order.getOrderStatus();
						if(orderStatus.equals(Constants.STATUS_UNPAY)){
							totalOrder.put("orderStatus", "未支付");
						}
						else if(orderStatus.equals(Constants.STATUS_FORDELIVERY)){
							totalOrder.put("orderStatus", "待发货");
						}
						else if(orderStatus.equals(Constants.STATUS_FORRECIEVE)){
							totalOrder.put("orderStatus", "待收货");
						}
						else if(orderStatus.equals(Constants.STATUS_RECEIVED)){
							totalOrder.put("orderStatus", "已交易");
						}
						totalOrder.put("orderTotal", order.getOrderTotal());
						totalOrder.put("lineItemId", item.getLineItemId());
						//totalOrder.put("orderId", itemMap.get("orderId").toString());
						totalOrder.put("productId", item.getProductId());
						totalOrder.put("unitPrice", item.getUnitPrice());
						totalOrder.put("quantity", item.getQuantity());
						totalOrder.put("productName", product.getProductName());
						totalOrder.put("productDescription", product.getProductDescription());
						totalOrder.put("orginalPrice", product.getOriginalPrice());
						totalOrder.put("picSmall", product.getPicSmall());
						totalOrders.add(totalOrder);
					}
				}
				//orderItems.addAll(orderItemList);		
			}
			model.put("totalOrders", totalOrders);
		}
		
		//model.put("orders", orders);
		return new ModelAndView("/jsp/front/order",model);
		
	}
	
	@RequestMapping("/payOrder/{orderId}.do")
	public ModelAndView payOrder(@PathVariable int orderId){
		Map<String, Object> model = new HashMap<String, Object>();
		Order order = orderService.getOrderByOrderId(orderId);
		order.setOrderStatus(Constants.STATUS_FORDELIVERY);
		model.put("order", order);
		return new ModelAndView("/jsp/front/pay",model);
	}
	
}
