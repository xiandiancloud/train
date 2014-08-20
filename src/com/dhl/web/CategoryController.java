package com.dhl.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.Category;
import com.dhl.service.CategoryService;

/**
 * 
 * @see
 * @since
 */
@Controller
public class CategoryController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private CategoryService categoryService;
	
	
	@RequestMapping("/getAllCategory")
	public ModelAndView getAllCategory(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		List<Category> category = categoryService.getAllCategory();
		view.addObject("category", category);
		view.addObject("navindex",1);
		view.setViewName("/courselist");
		return view;
	}
}
