package com.Model;

public class Cart {
	private int cartId ;
	private int productId ;
	private int customerId ;
	private float unitPrice;
	private int quantity;
	private float totalExpense;
	private String addDate;
	
	
	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public float getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public float getTotalExpense() {
		return totalExpense;
	}


	public void setTotalExpense(float totalExpense) {
		this.totalExpense = totalExpense;
	}


	public String getAddDate() {
		return addDate;
	}


	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}


	@Override
	public String toString() {
		return "Cart [cart_id=" + cartId + ", product_id=" + productId + ", customer_id="
				+ customerId + ", unit_price=" + unitPrice +", quantity=" + quantity
				+", total_expense=" + totalExpense +", add_date=" + addDate +  "]";
	}


}
