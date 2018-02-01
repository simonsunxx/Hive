package com.Service;

import java.util.List;

import com.Model.Order;
import com.Model.OrderItem;

public interface OrderService {
	public int addOrder(Order order);
	public int addOrderItem(OrderItem orderItem);
	public Order getOrderByOrderId(int orderId);
	public boolean updateOrder(Order order);
	public  List<Order>  getOrderByCustId(int custId);
	public List<OrderItem>  getItemByOrderId(int orderId);
}
