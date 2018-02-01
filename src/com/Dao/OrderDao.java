package com.Dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.Model.Order;
import com.Model.OrderItem;
import com.Service.OrderService;
import com.Util.Constants;
import com.Util.StringUtil;

public class OrderDao implements OrderService{
	@Resource
	private JdbcTemplate jdbcTemplate;
	@SuppressWarnings("all")

	/**
	 * @description 新增订单信息Order
	 * @param Order order
	 * @return int orderId
	 * @author liling
	 * @date 2017-04-18
	 * */
	@Override
	public int addOrder(Order order) {
		int orderId;
		String sqlID = "SELECT MAX(ORDER_ID) AS MAXID FROM ORDERS";
		Map IDmap = this.getJdbcTemplate().queryForMap(sqlID);
		if(IDmap.isEmpty()){
			orderId = Constants.ORDER_BEGINID;
		}
		else{
			int orderMaxID = StringUtil.StringToInt(IDmap.get("MAXID").toString());
			orderId = orderMaxID + 1;
		}
		String sql = "INSERT INTO ORDERS (ORDER_ID,ORDER_DATE,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL) VALUES (?,?,?,?,?)";
		int result = jdbcTemplate.update(
					sql,
					new Object[]{orderId,order.getOrderDate(),order.getCustomerId(),order.getOrderStatus(),order.getOrderTotal()}
					);
		if(result > 0){
				return orderId;
		}
			
		return Constants.NO_ORDERID;

	}
	
	/**
	 * @description 新增订单项信息OrderItem
	 * @author liling
	 * @date 2017-04-18
	 * */
	@Override
	public int addOrderItem(OrderItem orderItem) {
		int orderItemId;
		String sqlID = "SELECT MAX(LINE_ITEM_ID) AS MAXID FROM ORDER_ITEMS";
		Map IDmap = this.getJdbcTemplate().queryForMap(sqlID);
		if(IDmap.isEmpty()){
			orderItemId = Constants.ORDERITEM_BEGINID;
		}
		else{
			orderItemId = StringUtil.StringToInt(IDmap.get("MAXID").toString())+1;
		}
		String sql = "INSERT INTO ORDER_ITEMS(ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) VALUES (?,?,?,?,?)";
		int result = jdbcTemplate.update(
					sql,
					new Object[]{
							orderItem.getOrderId(),orderItemId,orderItem.getProductId(),
							orderItem.getUnitPrice(),orderItem.getQuantity()
					});
		
		if(result > 0){
			return orderItemId;
		}
		return Constants.NO_ORDERITEMID;
	}


	/**
	 * @description 根据用户信息获取相关订单
	 * @param int custId
	 * @return List<Order>
	 * @author liling
	 * @date 2017-04-18
	 * */
	@Override
	public List<Order> getOrderByCustId(int custId) {	
		String sql = "SELECT ORDER_ID,ORDER_DATE,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL "
				+ "FROM ORDERS WHERE CUSTOMER_ID = "+custId ;
		List odlist = jdbcTemplate.queryForList(sql);
		if(odlist.isEmpty()){
			return null;
		}
		else{
			List<Order> orderlist = new ArrayList<Order>();
			Iterator iterator = odlist.iterator();
			Order order = null;
			while(iterator.hasNext()){
				order = new Order();
				Map orderMap = (Map)iterator.next();
				order.setOrderId(StringUtil.StringToInt(orderMap.get("ORDER_ID").toString()));
				order.setOrderDate(orderMap.get("ORDER_DATE").toString());
				order.setCustomerId(StringUtil.StringToInt(orderMap.get("CUSTOMER_ID").toString()));
				order.setOrderStatus(orderMap.get("ORDER_STATUS").toString());
				order.setOrderTotal(StringUtil.strToFloat(orderMap.get("ORDER_TOTAL").toString()));
				orderlist.add(order);
			}
			return orderlist;
		}
	}

	/**
	 * @description 根据订单ID获取相关订单详细信息
	 * @param int orderId
	 * @return OrderItem
	 * @author liling
	 * @date 2017-04-18
	 * */
	@Override
	public List<OrderItem> getItemByOrderId(int orderId) {
		String sql = "SELECT ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY "
				+ "FROM order_items WHERE ORDER_ID = ?";
		List itemlist = jdbcTemplate.queryForList(sql,orderId);
		if(itemlist.isEmpty()){
			return null;
		}
		else{
			List<OrderItem> orderItemlist = new ArrayList<OrderItem>();
			Iterator iterator = itemlist.iterator();
			OrderItem orderItem = null;
			while(iterator.hasNext()){
				orderItem = new OrderItem();
				Map itemMap = (Map)iterator.next();
				orderItem.setLineItemId(StringUtil.StringToInt(itemMap.get("LINE_ITEM_ID").toString()));
				orderItem.setorderId(StringUtil.StringToInt(itemMap.get("ORDER_ID").toString()));
				orderItem.setProductId(StringUtil.StringToInt(itemMap.get("PRODUCT_ID").toString()));
				orderItem.setQuantity(StringUtil.StringToInt(itemMap.get("QUANTITY").toString()));
				orderItem.setUnitPrice(StringUtil.strToFloat(itemMap.get("UNIT_PRICE").toString()));
				orderItemlist.add(orderItem);
			}
			return orderItemlist;
		}
	}
	
	/**
	 * @description 根据OrderId获取Order信息
	 * @return Order
	 * @param int orderId
	 * @author liling
	 * @date 2017-04-19
	 * */
	@Override
	public Order getOrderByOrderId(int orderId) {
		String sql = "SELECT ORDER_ID,ORDER_DATE,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL "
				+ "FROM ORDERS WHERE ORDER_ID= ?";
		Map orderMap = jdbcTemplate.queryForMap(sql,orderId);
		if(orderMap.isEmpty()){
			return null;
		}
		else{
			Order order = new Order();
			order.setOrderId(StringUtil.StringToInt(orderMap.get("ORDER_ID").toString()));
			order.setCustomerId(StringUtil.StringToInt(orderMap.get("CUSTOMER_ID").toString()));
			order.setOrderDate(orderMap.get("ORDER_DATE").toString());
			order.setOrderStatus(orderMap.get("ORDER_STATUS").toString());
			order.setOrderTotal(StringUtil.strToFloat(orderMap.get("ORDER_TOTAL").toString()));
			return order;
		}
	}
	

	/**
	 * @description 更新order
	 * @return Boolean 
	 * @param Order order
	 * @author liling
	 * @date 2017-04-19
	 * */
	@Override
	public boolean updateOrder(Order order) {
		String sql = "UPDATE ORDERS SET ORDER_ID = " + order.getOrderId()
				        + ",ORDER_DATE = '" + order.getOrderDate() +"',"
						+ " CUSTOMER_ID = " + order.getCustomerId() 
						+ ", ORDER_STATUS = '" + order.getOrderStatus() +"',"
						+ " ORDER_TOTAL = " + order.getOrderTotal() 
						+ " WHERE ORDER_ID = " + order.getOrderId();
		int result = jdbcTemplate.update(sql);
		if(result > 0){
			return true;
		}
		return false;
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}



}
