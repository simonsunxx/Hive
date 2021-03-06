package com.Model;

/**
 * @description:商品类别
 * @author liling
 * @date:2017/4/11
 * */
public class ProductCategory {
	private int categoryId;
	private String categoryName;
	private String categoryDescription;
	
	public ProductCategory(){
		super();
	}
	
	public ProductCategory(int categoryId,String categoryName,String categoryDescription){
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
	}
	
	public void setCategoryId(int categoryId){
		this.categoryId = categoryId;
	}
	
	public int getCategoryId(){
		return categoryId;
	}
	
	public void setCategoryName(String categoryName){
		this.categoryName = categoryName;
	}
	
	public String getCategoryName(){
		return categoryName;
	}
	
	public void setCategoryDescription(String categoryDescription){
		this.categoryDescription = categoryDescription;
	}
	
	public String getCategoryDescription(){
		return categoryDescription;
	}
	
	@Override
	public String toString() {
		return "ProductCategory [categoryId=" + categoryId 
				+ ", categoryName=" + categoryName 
				+ ", categoryDescription="
				+ categoryDescription  + "]";
	}

}
