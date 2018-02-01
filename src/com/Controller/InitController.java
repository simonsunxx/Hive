package com.Controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Model.Category;
import com.Model.Product;
import com.Service.CategoryService;
import com.Service.ProductService;

@Controller
@RequestMapping("/welcome")
public class InitController {
	@Resource
	private CategoryService categoryService;
	@Resource
	private ProductService productService;

	/**
	 * @description 初始化welcome界面数据
	 * @author liling
	 * @date 2017-04-17
	 * @modify 2017-04-26
	 * */
	@RequestMapping("/init.do")
	public String init(HttpServletRequest request,Model model){
		List<Category> categories = categoryService.getAllCategories();
		request.getSession().setAttribute("categories",categories);//投放商品类别
		List<Product> DailyRecommends = productService.getDailyRecommend();
		request.getSession().setAttribute("dailyRecommends", DailyRecommends);//投放今日推荐
		return "redirect:../jsp/front/welcome.jsp";
	} 

}
