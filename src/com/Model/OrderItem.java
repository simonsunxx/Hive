package com.Model;

public class OrderItem {
	private int lineItemId;
	private int orderId;
	private int productId;
	private float unitPrice;
	private int quantity;
	
	public OrderItem(){
		super();
	}
	
	public OrderItem(int lineItemId,int orderId,int productId,float unitPrice,int quantity){
		this.lineItemId = lineItemId;
		this.orderId = orderId;
		this.productId = productId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
	}
	
	public void setLineItemId(int lineItemId){
		this.lineItemId = lineItemId;
	}
	
	public int getLineItemId(){
		return lineItemId;
	}
	
	public void setorderId(int orderId){
		this.orderId = orderId;
	}
	
	public int getOrderId(){
		return orderId;
	}
	
	public void setProductId(int productId){
		this.productId = productId;
	}
	
	public int getProductId(){
		return productId;
	}

	public void setUnitPrice(float unitPrice){
		this.unitPrice = unitPrice;
	}
	
	public float getUnitPrice(){
		return unitPrice;
	}
	
	public void setQuantity(int quantity){
		this.quantity = quantity;
	}
	
	public int getQuantity(){
		return quantity;
	}
	
	@Override
	public String toString() {
		return "OrderItem [lineItemId=" + lineItemId + ", orderId=" + orderId + ", productId="
				+ productId + ", unitPrice=" + unitPrice + ", quantity=" + quantity +  "]";
	}
}
