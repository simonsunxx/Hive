package com.Dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.Model.Category;
import com.Service.CategoryService;
import com.Util.StringUtil;
@Service
public class CategoryDao implements CategoryService{
	@Resource
	private JdbcTemplate jdbcTemplate;
	@SuppressWarnings("all")
	@Override
	public List<Category> getAllCategories() {
		List<Category> categorylist = new ArrayList<Category>() ;
		String sql = "SELECT CATEGORY_ID ,CATEGORY_NAME,CATEGORY_DESCRIPTION FROM CATEGORIES";
		List cglist = jdbcTemplate.queryForList(sql);
		
		if(cglist.isEmpty()){
			return null;
		}
		else{
			Iterator iterator = cglist.iterator();
			Category category = null;
			while(iterator.hasNext()){
				category = new Category();
				Map categoryMap = (Map) iterator.next();
				category.setCategoryId(StringUtil.StringToInt(categoryMap.get("CATEGORY_ID").toString()));
				category.setCategoryName(categoryMap.get("CATEGORY_NAME").toString());
				category.setCategoryDescription(categoryMap.get("CATEGORY_DESCRIPTION").toString());
				categorylist.add(category);
			}
			return categorylist;
		}
	}


}
