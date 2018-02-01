package com.Service;

import java.util.List;

import com.Model.Product;

public interface ProductService {
	public List<Product> getProductsByCategory(int categoryId);//根据商品类型ID获取相关商品
	public Product getProductById(int productId);//根据商品ID获取商品
	public boolean updateProduct(Product product);//更新商品信息
	public List<Product> getDailyRecommend();//获取每日推荐商品
	public List<Product> getAssoProducts(int productId);//获取关联商品
	public List<Product> searchProducts(String searchInput);//获取关联商品
}
