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
public class AdminController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private CategoryService categoryService;
	
	
	/**
	 * 管理员增加分类
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/admin")
	public ModelAndView admin(HttpServletRequest request, int index) {
		ModelAndView view = new ModelAndView();

//		User user = getSessionUser(request);
//		if (user == null) {
//			String url = "redirect:/tologin.action";
//			return new ModelAndView(url);
//		}
		if (index == 1)
		{
			List<Category> categorylist = categoryService.getAllCategory();
			view.addObject("categorylist", categorylist);
		}
		view.addObject("adminindex", index);
		view.setViewName("admin");
		return view;
	}
}
