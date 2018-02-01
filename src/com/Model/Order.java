package com.Model;


public class Order {
	private int orderId;
	private String orderDate;
	private int customerId;
	private String orderStatus;
	private float orderTotal;
	
	public Order(){
		super();
	}
	
	public Order(int orderId,String orderDate,int customerId,String orderStatus,float orderTotal){
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.customerId = customerId;
		this.orderStatus = orderStatus;
		this.orderTotal = orderTotal;
	}
	
	public void setOrderId(int orderId){
		this.orderId = orderId;
	}
	
	public int getOrderId(){
		return orderId;
	}
	
	public void setOrderDate(String orderDate){
		this.orderDate = orderDate;
	}
	
	public String getOrderDate(){
		return orderDate;
	}
	
	public void setCustomerId(int customerId){
		this.customerId = customerId;
	}
	public int getCustomerId(){
		return customerId;
	}
	
	public void setOrderStatus(String orderStatus){
		this.orderStatus = orderStatus;
	}
	
	public String getOrderStatus(){
		return orderStatus;
	}
	
	public void setOrderTotal(float orderTotal){
		this.orderTotal = orderTotal;
	}
	
	public float getOrderTotal(){
		return orderTotal;
	}
	
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderDate=" + orderDate + ", orderStatus="
				+ orderStatus + ", orderTotal=" + orderTotal +  "]";
	}
}
