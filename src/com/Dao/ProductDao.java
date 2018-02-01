package com.Dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.Model.Product;
import com.Service.ProductService;
import com.Util.StringUtil;
@Service
public class ProductDao implements ProductService{
	@Resource
	private JdbcTemplate jdbcTemplate;
	@SuppressWarnings("all")

	/**
	 * @description:通过类别ID来获取所属商品
	 * @author liling
	 * @param int categoryId
	 * @return List<Product>
	 * @date 2017-04-17
	 * */
	@Override
	public List<Product> getProductsByCategory(int categoryId) {
		List<Product> productlist = new ArrayList<Product>();
		String sql = "SELECT PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,"
				+ "WARRANTY_PERIOD,CATEGORY_ID,ORIGINAL_PRICE,PRESENT_PRICE,QUANTITY,PIC_BIG,PIC_SMALL "
				+ "FROM PRODUCTS WHERE CATEGORY_ID = ?";
		List pdlist = jdbcTemplate.queryForList(sql,categoryId);
		if(pdlist.isEmpty()){
			return null;
		}
		else{
			Iterator iterator = pdlist.iterator();
			Product product = null;
			while(iterator.hasNext()){
				product = new Product();
				Map productMap = (Map)iterator.next();
				product.setProductId(StringUtil.StringToInt(productMap.get("PRODUCT_ID").toString()));
				product.setProductName(productMap.get("PRODUCT_NAME").toString());
				product.setOriginalPrice(StringUtil.strToFloat(productMap.get("ORIGINAL_PRICE").toString()));
				product.setPresentPrice(StringUtil.strToFloat(productMap.get("PRESENT_PRICE").toString()));
				product.setCategoryId(StringUtil.StringToInt(productMap.get("CATEGORY_ID").toString()));
				product.setProductDescription(productMap.get("PRODUCT_DESCRIPTION").toString());
				product.setWarrantyPeriod(StringUtil.StringToInt(productMap.get("WARRANTY_PERIOD").toString()));
				product.setQuantity(StringUtil.StringToInt(productMap.get("QUANTITY").toString()));
				product.setPicBig(productMap.get("PIC_BIG").toString());
				product.setPicSmall(productMap.get("PIC_SMALL").toString());
				productlist.add(product);
			}
			return productlist;
		}
		
	}

	/**
	 * @description:通过商品ID来获取商品信息
	 * @author liling
	 * @param int productId
	 * @return Product
	 * @date 2017-04-17
	 * */
	@Override
	public Product getProductById(int productId) {
		String sql = "SELECT PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,WARRANTY_PERIOD,"
				+ "CATEGORY_ID,ORIGINAL_PRICE,PRESENT_PRICE,QUANTITY,PIC_BIG,PIC_SMALL "
				+ "FROM PRODUCTS WHERE PRODUCT_ID = ? ";
		Map productMap = jdbcTemplate.queryForMap(sql,productId);
		if(productMap.isEmpty()){
			return null;
		}
		else{
			
			Product product = new Product();
			product.setProductId(StringUtil.StringToInt(productMap.get("PRODUCT_ID").toString()));
			product.setProductName(productMap.get("PRODUCT_NAME").toString());
			product.setOriginalPrice(StringUtil.strToFloat(productMap.get("ORIGINAL_PRICE").toString()));
			product.setPresentPrice(StringUtil.strToFloat(productMap.get("PRESENT_PRICE").toString()));
			product.setCategoryId(StringUtil.StringToInt(productMap.get("CATEGORY_ID").toString()));
			product.setProductDescription(productMap.get("PRODUCT_DESCRIPTION").toString());
			product.setWarrantyPeriod(StringUtil.StringToInt(productMap.get("WARRANTY_PERIOD").toString()));
			product.setQuantity(StringUtil.StringToInt(productMap.get("QUANTITY").toString()));
			product.setPicBig(productMap.get("PIC_BIG").toString());
			product.setPicSmall(productMap.get("PIC_SMALL").toString());
			return product;
		}
		
	}

	/**
	 * @description:更新商品信息
	 * @author liling
	 * @param Product product
	 * @return Boolean
	 * @date 2017-04-17
	 * */
	@Override
	public boolean updateProduct(Product product) {
		String sql = "UPDATE PRODUCTS SET PRODUCT_NAME = '" + product.getProductName() 
				+ "', ORIGINAL_PRICE = " + product.getOriginalPrice() 
				+ ", PRESENT_PRICE = " + product.getPresentPrice()
				+ ", CATEGORY_ID = " + product.getCategoryId()
				+ ", PRODUCT_DESCRIPTION = '" + product.getProductDescription()
				+ "', WARRANTY_PERIOD = " + product.getWarrantyPeriod()
				+ ", QUANTITY = " + product.getQuantity()
				+ " WHERE PRODUCT_ID = " + product.getProductId();
		
		int result = jdbcTemplate.update(sql);
		if(result > 0){
			return true;
		}
		return false;
	}

	/**
	 * @description:获取每日推荐商品
	 * @author liling
	 * @return List<Product>
	 * @date 2017-04-26
	 * */
	@Override
	public List<Product> getDailyRecommend() {
		List<Product> dailyRecommends = new ArrayList<Product>();
		String sql =" SELECT P.PRODUCT_ID ,P.PRODUCT_NAME,P.PRODUCT_DESCRIPTION,P.CATEGORY_ID,P.WARRANTY_PERIOD,"
				+ " P.ORIGINAL_PRICE,P.PRESENT_PRICE,P.QUANTITY ,P.PIC_BIG,P.PIC_SMALL" +
                  " FROM DAILY_RECOMMEND DR LEFT JOIN PRODUCTS P ON DR.PRODUCT_ID=P.PRODUCT_ID";
		List dplist = jdbcTemplate.queryForList(sql);
		if(dplist.isEmpty()){
			return null;
		}
		else{
			Iterator iterator = dplist.iterator();
			Product product = null;
			while(iterator.hasNext()){
				product = new Product();
				Map productMap = (Map)iterator.next();
				product.setProductId(StringUtil.StringToInt(productMap.get("PRODUCT_ID").toString()));
				product.setProductName(productMap.get("PRODUCT_NAME").toString());
				product.setOriginalPrice(StringUtil.strToFloat(productMap.get("ORIGINAL_PRICE").toString()));
				product.setPresentPrice(StringUtil.strToFloat(productMap.get("PRESENT_PRICE").toString()));
				product.setCategoryId(StringUtil.StringToInt(productMap.get("CATEGORY_ID").toString()));
				product.setProductDescription(productMap.get("PRODUCT_DESCRIPTION").toString());
				product.setWarrantyPeriod(StringUtil.StringToInt(productMap.get("WARRANTY_PERIOD").toString()));
				product.setQuantity(StringUtil.StringToInt(productMap.get("QUANTITY").toString()));
				product.setPicBig(productMap.get("PIC_BIG").toString());
				product.setPicSmall(productMap.get("PIC_SMALL").toString());
				dailyRecommends.add(product);
			}
			return dailyRecommends;
		}
	}

	/**
	 * @description:根据商品ID获取相关联的商品
	 * @author liling
	 * @return List<Product>
	 * @date 2017-04-26
	 * */
	@Override
	public List<Product> getAssoProducts(int productId) {
		List<Product> assoProducts = new ArrayList<Product>();
		String sql="SELECT PRODUCT_B FROM ASSOCIATION_RULE WHERE PRODUCT_A= ? ORDER BY SUPPORT,CONFIDENCE DESC LIMIT 0,5";
		List idList = jdbcTemplate.queryForList(sql,productId);
		if(idList.isEmpty()){
			return null;
		}
		else{
			Iterator iterator = idList.iterator();
			
			while(iterator.hasNext()){
				Map productIdMap = (Map)iterator.next();
				int proId;
				proId = StringUtil.StringToInt(productIdMap.get("PRODUCT_B").toString());//获取相关联商品的id
				Product product = getProductById(proId);//根据id获取商品
				assoProducts.add(product);
			}
			return assoProducts;
		}
	}

	/**
	 * @description:根据用户搜索获取商品
	 * @author liling
	 * @return List<Product>
	 * @date 2017-05-03
	 * */
	@Override
	public List<Product> searchProducts(String searchInput) {
		List<Product> productlist = new ArrayList<Product>();
		String sql = " SELECT PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,"
				+ "WARRANTY_PERIOD,CATEGORY_ID,ORIGINAL_PRICE,PRESENT_PRICE,QUANTITY,PIC_BIG,PIC_SMALL "
				+ "FROM PRODUCTS WHERE PRODUCT_NAME LIKE '%"+searchInput+"%' OR PRODUCT_DESCRIPTION LIKE '%"+searchInput+"%'";
		List pdlist = jdbcTemplate.queryForList(sql);
		if(pdlist.isEmpty()){
			return null;
		}
		else{
			Iterator iterator = pdlist.iterator();
			Product product = null;
			while(iterator.hasNext()){
				product = new Product();
				Map productMap = (Map)iterator.next();
				product.setProductId(StringUtil.StringToInt(productMap.get("PRODUCT_ID").toString()));
				product.setProductName(productMap.get("PRODUCT_NAME").toString());
				product.setOriginalPrice(StringUtil.strToFloat(productMap.get("ORIGINAL_PRICE").toString()));
				product.setPresentPrice(StringUtil.strToFloat(productMap.get("PRESENT_PRICE").toString()));
				product.setCategoryId(StringUtil.StringToInt(productMap.get("CATEGORY_ID").toString()));
				product.setProductDescription(productMap.get("PRODUCT_DESCRIPTION").toString());
				product.setWarrantyPeriod(StringUtil.StringToInt(productMap.get("WARRANTY_PERIOD").toString()));
				product.setQuantity(StringUtil.StringToInt(productMap.get("QUANTITY").toString()));
				product.setPicBig(productMap.get("PIC_BIG").toString());
				product.setPicSmall(productMap.get("PIC_SMALL").toString());
				productlist.add(product);
			}
			return productlist;
		}
	}

}
