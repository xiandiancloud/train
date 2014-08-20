package com.dhl.web;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.UCEnvironment;
import com.dhl.domain.User;
import com.dhl.domain.UserCourse;
import com.dhl.domain.UserTrain;
import com.dhl.service.UCEService;
import com.dhl.service.UserCourseService;
import com.dhl.service.UserService;
import com.dhl.service.UserTrainService;

/**
 * 
 * @see
 * @since
 */
@Controller
public class UserController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private UserService userService;
	@Autowired
	private UCEService uceService;
	@Autowired
	private UserTrainService userTrainService;
	@Autowired
	private UserCourseService userCourseService;
	
	@RequestMapping("/ssologin")
	public ModelAndView ssologin(HttpServletRequest request, String userName) {
		// ModelAndView view =new ModelAndView();
		User user = userService.getUserByUserName(userName);
		if (user == null) {
			user = userService.add(userName);
		}
		setSessionUser(request, user);
		String url = "redirect:/getAllCourse.action";

		return new ModelAndView(url);
	}

	@RequestMapping("/ssotocourse")
	public ModelAndView ssotocourse(HttpServletRequest request,
			String userName, int courseId) {
		// ModelAndView view =new ModelAndView();
		User user = userService.getUserByUserName(userName);
		if (user == null) {
			user = userService.add(userName);
		}
		setSessionUser(request, user);
		String url = "redirect:/getSimpleCourse.action?courseId=" + courseId;

		return new ModelAndView(url);
	}

	@RequestMapping("/tologin")
	public ModelAndView tologin(HttpServletRequest request, String url) {
		ModelAndView view = new ModelAndView();
		if (url != null && url.length() > 0) {
			String[] strs = url.split("\\.");
			url = strs[0] + ".action?" + strs[1];
			view.addObject("url", url);
		}
		view.setViewName("/login");
		return view;
	}

	@RequestMapping("/toregeister")
	public ModelAndView toregeister(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/regeister");
		return view;
	}
	
	@RequestMapping("/loginout")
	public ModelAndView loginout(HttpServletRequest request) {
		setSessionUser(request, null);
		String url = "redirect:/getAllCategory.action";

		return new ModelAndView(url);
	}

	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response,
			String username, String password) {
		try {
			// ModelAndView view = new ModelAndView();
			User user = userService.getUserByUserName(username);
			if (user == null) {
				user = userService.add(username);
			}
			setSessionUser(request, user);

			PrintWriter out = response.getWriter();
			String result = "{'sucess':'sucess'}";
			out.write(result);
		} catch (Exception e) {
		}
		// view.setViewName("redirect:/mycourse.cation");
		// return view;
		// String url = "redirect:/mycourse.action";
		// return new ModelAndView(url);
	}

	/**
	 * 个人设置，环境准备，个人课程情况等等总结信息
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/setting")
	public ModelAndView setting(HttpServletRequest request, int index) {
		ModelAndView view = new ModelAndView();
		// User user = userService.getUserByUserName(userName);
		// if (user == null)
		// {
		// user = userService.add(userName);
		// }
		// setSessionUser(request, user);
		// String url = "redirect:/getAllCourse.action";

		User user = getSessionUser(request);
		if (user == null) {
			String url = "redirect:/tologin.action";
			return new ModelAndView(url);
		}
		if (index == 2) {
			List<UCEnvironment> uce = uceService.getMyUCE(user.getId());
			view.addObject("uce", uce);
		}
		if (index == 3)
		{
			List<UserCourse> having = userCourseService.getMyHavingCourse(user.getId());
			List<UserCourse> finish = userCourseService.getMyFinishCourse(user.getId());
			
			view.addObject("having", having);
			view.addObject("finish", finish);
		}
		view.addObject("setindex", index);
		view.setViewName("setting");
		return view;
	}

//	@RequestMapping("/deleteEnv")
//	public ModelAndView deleteEnv(HttpServletRequest request, int id) {
//		uceService.delete(id);
//		String url = "redirect:/setting.action?index=2";
//		return new ModelAndView(url);
//	}

	/**
	 * 判断环境是否已经准备好
	 * 
	 * @param request
	 * @param response
	 * @param courseId
	 * @param name
	 *            :环境名称
	 */
	@RequestMapping("/hasenv")
	public void hasenv(HttpServletRequest request,
			HttpServletResponse response, int courseId, int trainId, String name) {

		try {
			User user = getSessionUser(request);
			PrintWriter out = response.getWriter();
			if (user != null) {
				UCEnvironment uce = uceService.getMyUCE(user.getId(), courseId,
						name);
				UserTrain userTrain = userTrainService.getUserTrain(
						user.getId(), courseId, trainId);
				String result = userTrain == null ? "" : userTrain
						.getResult();
				String revalue = userTrain == null ? "" : userTrain
						.getRevalue();
				if (uce != null) {
					
					String str = "{'sucess':'sucess','ip':'"
							+ uce.getHostname() + "','username':'"
							+ uce.getUsername() + "','result':'" + result
							+ "','revalue':'" + revalue + "','password':'"
							+ uce.getPassword() + "','ssh':'"
							+ uce.getServerId() + "'}";
					out.write(str);
				} else {
					String str = "{'sucess':'fail','result':'" + result
							+ "','revalue':'" + revalue+ "'}";
					out.write(str);
				}
			} else {
				String result = "{'sucess':'fail'}";
				out.write(result);
			}
		} catch (Exception e) {

		}
	}
}
