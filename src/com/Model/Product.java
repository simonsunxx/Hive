package com.Model;
/**
 * @description:商品信息
 * @author liling
 * @date 2017/4/11
 * */
public class Product {

	private int productId;
	private String productName;
	private String productDescription;
	private int warrantyPeriod;
	private float originalPrice;
	private float presentPrice;
	private int quantity;
	private int categoryId;
	private String picBig;
	private String picSmall;


	public Product() {
		super();	
	}
	
	public Product(int productId,String productName,String productDescription,
			int warrantyPeriod,float originalPrice,float presentPrice,int quantity,int categoryId) {
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.warrantyPeriod = warrantyPeriod;
		this.originalPrice = originalPrice;
		this.presentPrice = presentPrice;
		this.quantity = quantity;	
		this.categoryId = categoryId;
	}
	
	public void setProductId(int productId){
		this.productId = productId;
	}
	
	public int getProductId(){
		return productId;
	}
	
	public void setProductName(String productName){
		this.productName = productName;
	}
	
	public String getProductName(){
		return productName;
	}

	public void setProductDescription(String productDescription){
		this.productDescription = productDescription;
	}

	public String getProductDescription(){
		return productDescription;
	}
	
	public void setWarrantyPeriod(int warrantyPeriod){
		this.warrantyPeriod = warrantyPeriod;
	}
	
	public int getWarrantyPeriod(){
		return warrantyPeriod;
	}
	
	public void setOriginalPrice(float originalPrice){
		this.originalPrice = originalPrice;
	}
	
	public float getOriginalPrice(){
		return originalPrice;
	}
	
	public void setPresentPrice(float presentPrice){
		this.presentPrice = presentPrice;
	}
	
	public float getPresentPrice(){
		return presentPrice;
	}
	
	public void setQuantity(int quantity){
		this.quantity = quantity;
	}
	
	public int getQuantity(){
		return quantity;
	}
	
	public void setCategoryId(int categoryId){
		this.categoryId = categoryId;
	}	

	public int getCategoryId(){
		return categoryId;
	}

	
	public String getPicBig() {
		return picBig;
	}

	public void setPicBig(String picBig) {
		this.picBig = picBig;
	}

	public String getPicSmall() {
		return picSmall;
	}

	public void setPicSmall(String picSmall) {
		this.picSmall = picSmall;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", warrantyPeriod=" + warrantyPeriod + ", originalPrice=" + originalPrice
				+ ", presentPrice=" + presentPrice +  ", quantity=" + quantity +  "]";
	}

}
