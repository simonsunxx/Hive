package com.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Model.Cart;
import com.Model.Order;
import com.Model.OrderItem;
import com.Model.Product;
import com.Service.CartService;
import com.Service.CategoryService;
import com.Service.OrderService;
import com.Service.ProductService;
import com.Util.Constants;
import com.Util.StringUtil;

@Controller
@RequestMapping("/product")
public class ProductCotroller {
	@Resource
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Resource
	private OrderService orderService;
	@Resource
	private CartService cartService;
	/**
	 * @description 获取所有商品种类
	 * @author liling
	 * @date 2017-04-17
	 * */
	@RequestMapping("/getAllCategories.do")
	public String getAllCategories(HttpServletRequest request,Model model){
		
		model.addAttribute("moreCategories","true");
		return "redirect:../jsp/front/welcome.jsp";
	}
	/**
	 * @description 通过种类ID获取其下的所有商品
	 * @author liling
	 * @date 2017-04-17
	 * */
	@RequestMapping("/getProductsByCategory/{categoryId}.do")
	public ModelAndView getProductsByCategory(@PathVariable int categoryId,HttpServletRequest request){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Product> products = productService.getProductsByCategory(categoryId);
		if(products == null){
			model.put("queryProduct","false");
		}
		else{
			model.put("queryProduct","true");
		}
		
		model.put("products",products);
		return new ModelAndView("/jsp/front/welcome", model);  
		//return "redirect:/jsp/front/welcome.jsp";
	}
	
	/**
	 * @description 通过商品ID获取商品信息
	 * @author liling
	 * @date 2017-04-18
	 * */
	@RequestMapping("/getProductById/{productId}.do")
	public ModelAndView getProductById(@PathVariable int productId){
		Product product = productService.getProductById(productId);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("product", product);//投放商品
		List<Product> assoProducts = productService.getAssoProducts(productId);
		model.put("assoProducts", assoProducts);//投放关联商品
		return new ModelAndView("/jsp/front/introduction",model);
	}
	
	/**
	 * @description 购买商品行为
	 * @author liling
	 * @date 2017-04-19
	 * */
	@RequestMapping("/purchase.do")
	public ModelAndView purchase(HttpServletRequest request){
		Map<String, Object> model = new HashMap<String, Object>();
		String cust = request.getParameter("custId");
		if(cust == ""){
			model.put("addOrder", "NotLogin");
			return new ModelAndView("/jsp/front/introduction",model);
		}
		else{
			Order order = new Order();
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String orderDate = formatter.format(currentTime);
			int productId = StringUtil.StringToInt(request.getParameter("productId"));
			int customerId = StringUtil.StringToInt(request.getParameter("custId"));
			String p = request.getParameter("unitPrice");
			float unitPrice = StringUtil.strToFloat(request.getParameter("unitPrice"));
			int quantity = StringUtil.StringToInt(request.getParameter("quantity"));
			float totalPrice = unitPrice * quantity;
			order.setCustomerId(customerId);
			order.setOrderDate(orderDate);
			order.setOrderStatus(Constants.STATUS_UNPAY);
			order.setOrderTotal(totalPrice);
			int orderId = orderService.addOrder(order);
			
			Product product = productService.getProductById(productId);//更新商品数量
			product.setQuantity(product.getQuantity()-quantity);
			boolean updateProduct =productService.updateProduct(product);
			if(updateProduct == true){
				if(orderId != Constants.NO_ORDERID){
					order.setOrderId(orderId);
					OrderItem orderItem = new OrderItem();
					orderItem.setorderId(orderId);
					orderItem.setProductId(productId);
					orderItem.setQuantity(quantity);
					orderItem.setUnitPrice(unitPrice);
					int itemId = orderService.addOrderItem(orderItem);
					if(itemId != Constants.NO_ORDERITEMID){
						
						orderItem.setLineItemId(itemId);
						model.put("addOrder", "success");
						model.put("order", order);
						model.put("orderItem", orderItem);
						
						return new ModelAndView("/jsp/front/pay",model);
						
					}
					else{
						model.put("addOrder", "fail");
						return new ModelAndView("/jsp/front/introduction",model);
					}
					
				}
				else{
					model.put("addOrder", "fail");
					return new ModelAndView("/jsp/front/introduction",model);
				}
			}
			else{
				model.put("addOrder", "fail");
				return new ModelAndView("/jsp/front/introduction",model);
			}
				
	}	
		
		
	}
	
	/**
	 * @description 加入购物车行为
	 * @author liling
	 * @date 2017-04-19
	 * */
	@RequestMapping("/addToCart.do")
	@ResponseBody
	public Map<String, Object> addToCart(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = new HashMap<String, Object>();
		String custId = request.getParameter("custId");
		if(custId == ""){
			model.put("addToCart", "NotLogin");
			return model;
		}
		else{
			//Order order = new Order();
			Cart cart = new Cart();
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String addDate = formatter.format(currentTime);
			int productId = StringUtil.StringToInt(request.getParameter("productId"));
			int customerId = StringUtil.StringToInt(request.getParameter("custId"));
			float unitPrice = StringUtil.strToFloat(request.getParameter("unitPrice"));
			int quantity = StringUtil.StringToInt(request.getParameter("quantity"));
			float totalExpense = unitPrice * quantity;
			cart.setCustomerId(customerId);
			cart.setAddDate(addDate);
			cart.setProductId(productId);
			cart.setQuantity(quantity);;
			cart.setTotalExpense(totalExpense);
			cart.setUnitPrice(unitPrice);
			int cartId = cartService.addCart(cart);
			
			if(cartId != Constants.NO_CARTID){
				cart.setCartId(cartId);
				model.put("addToCart", "success");
				return model;
				
			}
			else{
				model.put("addToCart", "fail");
				return model;
			}
		}
	}
	
	@RequestMapping("/searchProduct.do")
	public ModelAndView searchProduct(HttpServletRequest request){
		Map<String, Object> model = new HashMap<String, Object>();
		String searchInput =  request.getParameter("searchInput");
		List<Product> products = productService.searchProducts(searchInput);
		if(products == null){
			model.put("queryProduct","false");
		}
		else{
			model.put("queryProduct","true");
		}
		
		model.put("products",products);
		return new ModelAndView("/jsp/front/welcome", model);  

	}
	
}
