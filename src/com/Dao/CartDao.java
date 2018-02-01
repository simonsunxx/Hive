package com.Dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.Model.Cart;
import com.Service.CartService;
import com.Util.Constants;
import com.Util.StringUtil;

public class CartDao implements CartService{
	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public int addCart(Cart cart) {
		int cartId;
		String sqlID = "SELECT MAX(CART_ID) AS MAXID FROM CART";
		Map IDmap = this.getJdbcTemplate().queryForMap(sqlID);
		Boolean re = IDmap.get("MAXID")==null;
		if(IDmap.get("MAXID")==null){
			cartId = Constants.CART_BEGINID;
		}
		else{
			int orderMaxID = StringUtil.StringToInt(IDmap.get("MAXID").toString());
			cartId = orderMaxID + 1;
		}
		String sql = "INSERT INTO CART (CART_ID,PRODUCT_ID,CUSTOMER_ID,UNIT_PRICE,QUANTITY,TOTAL_EXPENSE,ADD_DATE) VALUES (?,?,?,?,?,?,?)";
		int result = jdbcTemplate.update(
					sql,
					new Object[]{cartId,cart.getProductId(),cart.getCustomerId(),cart.getUnitPrice(),
							cart.getQuantity(),cart.getTotalExpense(),cart.getAddDate()}
					);
		if(result > 0){
				return cartId;
		}
			
		return Constants.NO_CARTID;
	}

	@Override
	public boolean deleteCart(Cart cart) {
		String sql = "DELETE FROM CART WHERE CART_ID = " + cart.getCartId();
		int result = jdbcTemplate.update(sql);
		if(result > 0){
			return true;
		}
		else
		return false;
	}

	@Override
	public List<Cart> getCartsByCustId(int custId) {
		String sql = "SELECT CART_ID,PRODUCT_ID,CUSTOMER_ID,UNIT_PRICE,QUANTITY,TOTAL_EXPENSE,ADD_DATE FROM CART WHERE CUSTOMER_ID = ?";
		List ctlist = jdbcTemplate.queryForList(sql,custId);
		if(ctlist.isEmpty()){
			return null;
		}
		else{
			List<Cart> cartlist = new ArrayList<Cart>();
			Iterator iterator = ctlist.iterator();
			Cart cart = null;
			while(iterator.hasNext()){
				cart = new Cart();
				Map cartMap = (Map)iterator.next();
				cart.setCartId(StringUtil.StringToInt(cartMap.get("CART_ID").toString()));
				cart.setCustomerId(StringUtil.StringToInt(cartMap.get("CUSTOMER_ID").toString()));
				cart.setProductId(StringUtil.StringToInt(cartMap.get("PRODUCT_ID").toString()));
				cart.setUnitPrice(StringUtil.strToFloat(cartMap.get("UNIT_PRICE").toString()));
				cart.setQuantity(StringUtil.StringToInt(cartMap.get("QUANTITY").toString()));
				cart.setTotalExpense(StringUtil.strToFloat(cartMap.get("TOTAL_EXPENSE").toString()));
				cart.setAddDate(cartMap.get("ADD_DATE").toString());
				cartlist.add(cart);
			}
			return cartlist;
		}
	}
	/**
	 * @description 根据用户输入查询购物车中商品信息
	 * @param String searchInput
	 * @return List<Cart>
	 * @date 2017-05-03
	 * @author liling
	 * */
	@Override
	public List<Cart> searchCart(String searchInput) {
		String sql = " SELECT C.CART_ID,C.PRODUCT_ID,C.CUSTOMER_ID,C.UNIT_PRICE,C.QUANTITY,C.TOTAL_EXPENSE,C.ADD_DATE,P.PRODUCT_NAME,P.PRODUCT_DESCRIPTION "
				+ " FROM CART LEFT JOIN PRODUCTS ON C.PRODUCT_ID = P.PRODUCT_ID AND P.PRODUCT_NAME LIKE '%" +searchInput +"%' AND P.PRODUCT_DESCRIPTION LIKE  '%" +searchInput +"%'";
		List ctlist = jdbcTemplate.queryForList(sql);
		if(ctlist.isEmpty()){
			return null;
		}
		else{
			List<Cart> cartlist = new ArrayList<Cart>();
			Iterator iterator = ctlist.iterator();
			Cart cart = null;
			while(iterator.hasNext()){
				cart = new Cart();
				Map cartMap = (Map)iterator.next();
				cart.setCartId(StringUtil.StringToInt(cartMap.get("CART_ID").toString()));
				cart.setCustomerId(StringUtil.StringToInt(cartMap.get("CUSTOMER_ID").toString()));
				cart.setProductId(StringUtil.StringToInt(cartMap.get("PRODUCT_ID").toString()));
				cart.setUnitPrice(StringUtil.strToFloat(cartMap.get("UNIT_PRICE").toString()));
				cart.setQuantity(StringUtil.StringToInt(cartMap.get("QUANTITY").toString()));
				cart.setTotalExpense(StringUtil.strToFloat(cartMap.get("TOTAL_EXPENSE").toString()));
				cart.setAddDate(cartMap.get("ADD_DATE").toString());
				cartlist.add(cart);
			}
			return cartlist;
		}
	}
	
	/**
	 * @description 根据购物车ID 获取购物车中的商品信息
	 * @param int cartId
	 * @return Cart
	 * @date 2017-04-29
	 * @author liling
	 * */
	@Override
	public Cart getCartById(int cartId) {
		String sql = "SELECT CART_ID,PRODUCT_ID,CUSTOMER_ID,UNIT_PRICE,QUANTITY,TOTAL_EXPENSE,ADD_DATE FROM CART WHERE CART_ID = ?";
		Map cartmap = this.getJdbcTemplate().queryForMap(sql,cartId);
		if(cartmap.isEmpty()){
			return null;
		}
		else{
			Cart cart = new Cart();
			cart.setCartId(StringUtil.StringToInt(cartmap.get("CART_ID").toString()));
			cart.setProductId(StringUtil.StringToInt(cartmap.get("PRODUCT_ID").toString()));
			cart.setCustomerId(StringUtil.StringToInt(cartmap.get("CUSTOMER_ID").toString()));
			cart.setUnitPrice(StringUtil.strToFloat(cartmap.get("UNIT_PRICE").toString()));
			cart.setQuantity(StringUtil.StringToInt(cartmap.get("QUANTITY").toString()));
			cart.setTotalExpense(StringUtil.strToFloat(cartmap.get("TOTAL_EXPENSE").toString()));
			cart.setAddDate(cartmap.get("ADD_DATE").toString());
			return cart;
		}
		
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	

}
