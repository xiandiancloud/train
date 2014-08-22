package com.dhl.web;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping("/saveCategory")
	public void saveCategory(HttpServletRequest request, HttpServletResponse response,
		String name, String describle) {
			try {
				PrintWriter out = response.getWriter();
				Category c = categoryService.getCategoryByname(name);
				if (c != null)
				{
					String result = "{'sucess':'fail'}";
					out.write(result);
					return;
				}
				c = new Category();
				c.setName(name);
				c.setDescrible(describle);
				categoryService.save(c);
				String result = "{'sucess':'sucess'}";
				out.write(result);
			} catch (Exception e) {
			}
	}
	
	@RequestMapping("/delcategory")
	public ModelAndView delcategory(HttpServletRequest request,int id) {
		categoryService.remove(id);
		String url = "redirect:/admin.action?index=1";
		return new ModelAndView(url);
	}
}
