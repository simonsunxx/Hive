package com.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.springframework.cglib.core.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Model.Cart;
import com.Model.Order;
import com.Model.OrderItem;
import com.Model.Product;
import com.Service.CartService;
import com.Service.OrderService;
import com.Service.ProductService;
import com.Util.StringUtil;
import com.Util.Constants;
@Controller
@RequestMapping("/cart")
public class CartController {
	@Resource
	private CartService cartService;
	@Resource
	private ProductService productService;
	@Resource
	private OrderService orderService;

	@RequestMapping("/getCartBycustId/{custId}.do")
	public ModelAndView getCartBycustId(@PathVariable int custId){
		Map<String,Object> model = getCart(custId);
		return new ModelAndView("/jsp/front/shopcart",model);
	}
	
	@RequestMapping("/removeCart/{cartId}.do")
	public ModelAndView removeCart(@PathVariable int cartId){
		
		Cart cart = cartService.getCartById(cartId);
		boolean result =cartService.deleteCart(cart);
		Map<String,Object> model = getCart(cart.getCustomerId());
		if(result == true){
			
			return new ModelAndView("/jsp/front/shopcart",model);
		}
		else{
			model.put("removeCart", "fail");
			return new ModelAndView("/jsp/front/shopcart",model);
		}
		
	}
	@RequestMapping("/removeCarts.do")
	@ResponseBody
	public Map<String,Object> removeCarts(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> model = new HashMap<String, Object>();
		String[] cartIds = request.getParameterValues("cartIds");
		//int custId = StringUtil.StringToInt(request.getParameter("custId"));
		if(cartIds != null){
			int length = cartIds.length;
			int cartId;
			int flag = 1;
			for(int i=0; i<length; i++){
				cartId = StringUtil.StringToInt(cartIds[i]);
				Cart cart = cartService.getCartById(cartId);
				Boolean result =cartService.deleteCart(cart);
				if(result == false){
					flag = 0;
				}
			}
			if(flag == 0){
				model.put("deleteCarts","fail");
			}
			else{
				
				model.put("deleteCarts","success");
			}
		}
		else{
			model.put("deleteCarts","fail");
		}
		return model;
		
	}
	
	@RequestMapping("/cartPay.do")
	public ModelAndView cartPay(HttpServletRequest request){
		Map<String,Object> model = new HashMap<String, Object>();
		String[] cartIds = request.getParameterValues("cartIds");
		int custId = StringUtil.StringToInt(request.getParameter("custId"));
		if(cartIds != null){
			int length = cartIds.length;
			int cartId;
			int flag = 1;
			//订单order
			Order order = new Order();
			order.setCustomerId(custId);
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String orderDate = formatter.format(currentTime);
			order.setOrderDate(orderDate);
			order.setOrderStatus(Constants.STATUS_UNPAY);
			float totalPrice = 0;
			order.setOrderTotal(totalPrice);
			int orderId = orderService.addOrder(order);
			if(orderId != Constants.NO_ORDERID){
				order.setOrderId(orderId);
				for(int i=0; i<length; i++){
					cartId = StringUtil.StringToInt(cartIds[i]);
					Cart cart = cartService.getCartById(cartId);
					totalPrice += cart.getTotalExpense();
					
					//order_item
					OrderItem orderItem = new OrderItem();
					orderItem.setorderId(orderId);
					orderItem.setProductId(cart.getProductId());
					orderItem.setQuantity(cart.getQuantity());
					orderItem.setUnitPrice(cart.getUnitPrice());
					int itemId = orderService.addOrderItem(orderItem);//添加订单明细
					if(itemId != Constants.NO_ORDERITEMID){
						
						//更新商品库存
						Product product = productService.getProductById(cart.getProductId());
						product.setQuantity(product.getQuantity()-cart.getQuantity());
						boolean updateProduct = productService.updateProduct(product);
						if(updateProduct == false){
							model.put("cartPay", "fail");
							return new ModelAndView("/jsp/front/cart",model);
						}
						//更新购物车
						Boolean deleteCart =cartService.deleteCart(cart);
						if(deleteCart == false){
							model.put("cartPay", "fail");
							return new ModelAndView("/jsp/front/cart",model);
						}
					}
				}
			}
			order.setOrderTotal(totalPrice);
			boolean  updateOrder = orderService.updateOrder(order);
			model.put("addOrder", "success");
			model.put("order", order);
			return new ModelAndView("/jsp/front/pay",model);
		}
		else{
			model.put("cartPay", "fail");
			return new ModelAndView("/jsp/front/cart",model);
		}
		
	}
	
//	@RequestMapping("/searchCart.do")
//	public ModelAndView searchProduct(HttpServletRequest request){
//		String searchInput = request.getParameter("searchInput");
//		Map<String,Object> model = new HashMap<String,Object>();
//		List<Cart> cartlist = cartService.searchCart(searchInput);
//
//		if(cartlist==null){
//			model.put("emptyCart", "true");
//			//model.put("carts", null);
//		}
//		else{
//			Iterator iterator = cartlist.iterator();
//			List carts = new ArrayList();
//			Map<String,Object> cart = new HashMap<String,Object>();
//			while(iterator.hasNext()){
//				//cart = new Cart();
//				Cart ct = (Cart)iterator.next();
//				int productId = ct.getProductId();
//				Product product = productService.getProductById(productId);
//				cart.put("productId", product.getProductId());
//				cart.put("productName", product.getProductName());
//				cart.put("picSmall", product.getPicSmall());
//				cart.put("productDescription", product.getProductDescription());
//				cart.put("orginalPrice", product.getOriginalPrice());
//				cart.put("cartId",ct.getCartId());
//				cart.put("unitPrice", ct.getUnitPrice());
//				cart.put("quantity", ct.getQuantity());
//				cart.put("totalExpense",ct.getTotalExpense());
//				cart.put("addDate", ct.getAddDate());
//				carts.add(cart);
//			}
//			model.put("emptyCart", "false");
//			model.put("carts", carts);
//		}
//			return new ModelAndView("/jsp/front/shopcart",model);
//	}
//	
	/**
	 * @description 获取购物车的商品
	 * @param int custId
	 * @return model
	 * */
	public Map<String,Object> getCart(int custId){
		Map<String,Object> model = new HashMap<String,Object>();
		List<Cart> cartlist = cartService.getCartsByCustId(custId);
		if(cartlist==null){
			model.put("emptyCart", "true");
			//model.put("carts", null);
		}
		else{
			Iterator iterator = cartlist.iterator();
			List carts = new ArrayList();
			
			while(iterator.hasNext()){
				Map<String,Object> cart = new HashMap<String,Object>();
				Cart ct = (Cart)iterator.next();
				int productId = ct.getProductId();
				Product product = productService.getProductById(productId);
				cart.put("productId", product.getProductId());
				cart.put("productName", product.getProductName());
				cart.put("picSmall", product.getPicSmall());
				cart.put("productDescription", product.getProductDescription());
				cart.put("orginalPrice", product.getOriginalPrice());
				cart.put("cartId",ct.getCartId());
				cart.put("unitPrice", ct.getUnitPrice());
				cart.put("quantity", ct.getQuantity());
				cart.put("totalExpense",ct.getTotalExpense());
				cart.put("addDate", ct.getAddDate());
				carts.add(cart);
			}
			model.put("emptyCart", "false");
			model.put("carts", carts);
		}
		return model;
	}
	
	
}
