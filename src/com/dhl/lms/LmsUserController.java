package com.dhl.lms;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Cloud;
import com.dhl.domain.Train;
import com.dhl.domain.UserCourse;
import com.dhl.domain.UserEnvironment;
import com.dhl.domain.UserTrain;
import com.dhl.service.TrainService;
import com.dhl.service.UserCloudService;
import com.dhl.service.UserCourseService;
import com.dhl.service.UserEnvironmentService;
import com.dhl.service.UserTrainService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;
import com.xiandian.cai.UserInterface;
import com.xiandian.model.User;
import com.xiandian.model.UserProfile;
import com.xiandian.util.MD5;

/**
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class LmsUserController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private TrainService trainService;
	@Autowired
	private UserCloudService userCloudService;
	@Autowired
	private UserEnvironmentService uceService;
	@Autowired
	private UserTrainService userTrainService;
	@Autowired
	private UserCourseService userCourseService;
	@Autowired
	private UserInterface userInterface;
	/**
	 * 跳转到登陆界面
	 * 
	 * @param request
	 * @param url
	 * @return
	 */
	@RequestMapping("/tologin")
	public ModelAndView tologin(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String url;
		int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
		if (type == CommonConstant.SSO_CAS)
		{
			url = "redirect:/lms/getAllCategory.action";
		}
		else
		{
			url = "/lms/login";
		}
		view.setViewName(url);
		return view;
	}

	/**
	 * 跳转到注册页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toregeister")
	public ModelAndView toregeister(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/lms/regeister");
		return view;
	}

	/**
	 * 注册用户
	 * 
	 * @param name
	 *            ：全名(真实姓名)
	 */
	@RequestMapping("/regeister")
	public void regeister(HttpServletRequest request,
			HttpServletResponse response, String roleName, String email,
			String password, String username, String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals, String school_name,
			String major, String class_name, String admission_time) {
		try {
			PrintWriter out = response.getWriter();
			User user = userInterface.getUserBymail(email);
			if (user != null) {
				String result = "{'sucess':'fail','msg':'电子邮件已经注册'}";
				out.write(result);
				return;
			}
			user = userInterface.getUserByUserName(username);
			if (user != null) {
				String result = "{'sucess':'fail','msg':'公开用户名已经注册'}";
				out.write(result);
				return;
			}
			user = userInterface.save(roleName, email, password, username, name,
					gender, mailing_address, year_of_birth, level_of_education,
					goals, school_name, major, class_name, admission_time);
			setSessionUser(request, user);

			String result = "{'sucess':'sucess'}";
			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新用户
	 * 
	 * @param name
	 *            ：全名(真实姓名)
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request,
			HttpServletResponse response, String email,
			String username, String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals) {
		try {
			PrintWriter out = response.getWriter();
			userInterface.update(email,username, name, gender,
				mailing_address, year_of_birth,level_of_education, goals);
			User user = getSessionUser(request);
			user.setUsername(username);
			setSessionUser(request, user);
			String result = "{'sucess':'sucess'}";
			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/sleepfront")
	public ModelAndView sleepfront(HttpServletRequest request) {
		
		setSessionUser(request, null);
		HttpSession session = request.getSession(false);
		session.setAttribute("_const_cas_assertion_", null);
		String url = "redirect:/lms/getAllCategory.action";
		return new ModelAndView(url);
	}
	
	
	@RequestMapping("/loginout")
	public ModelAndView loginout(HttpServletRequest request) {
		setSessionUser(request, null);
		String url;
		int type = Integer.parseInt(UtilTools.getConfig().getProperty("SSO_TYPE"));
		if (type == CommonConstant.SSO_CAS)
		{
			url = "redirect:"+UtilTools.getConfig().getProperty("SSO_LOGOUT");
		}
		else
		{
			url = "redirect:/lms/getAllCategory.action";
		}
		return new ModelAndView(url);
	}

	/**
	 * 学生登陆
	 * 
	 * @param request
	 * @param response
	 * @param email
	 * @param password
	 */
	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response,
			String email, String password) {
		try {
			PrintWriter out = response.getWriter();
			User user = userInterface.getUserBymail(email);
			if (user == null) {
				String result = "{'sucess':'fail','msg':'电子邮件不对'}";
				out.write(result);
				return;
			}
			MD5 md5 = new MD5();
			String inputstr = md5.getMD5ofStr(password);
			if (!inputstr.equals(user.getPassword())) {
				String result = "{'sucess':'fail','msg':'登录密码不对'}";
				out.write(result);
				return;
			}
//			Role role = user.getRole();//userInterface.getUserRoleByuserId(user.getId());
//			user.setRole(role);
			setSessionUser(request, user);
			String toUrl = (String) request.getSession().getAttribute(
					CommonConstant.LOGIN_TO_URL);
			request.getSession().removeAttribute(CommonConstant.LOGIN_TO_URL);
			// 如果当前会话中没有保存登录之前的请求URL，则直接跳转到主页
			if (StringUtils.isEmpty(toUrl)) {
				toUrl = "lms/getAllCategory.action";
			}
			String result = "{'sucess':'sucess','toUrl':'" + toUrl + "'}";
			out.write(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 个人设置，环境准备，个人课程情况等等总结信息
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	@RequestMapping("/mysetting")
	public ModelAndView mysetting(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		UserProfile up = userInterface.getUserProfileByuserId(user.getId());
		view.addObject("up", up);
		view.setViewName("/lms/mysetting");
		return view;
	}

	/**
	 * 我的云平台
	 * @param request
	 * @return
	 */
	@RequestMapping("/mycloudenv")
	public ModelAndView mycloudenv(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		User user = getSessionUser(request);
		Cloud uc = userCloudService.getMyCloud(user.getId());
		view.addObject("uc", uc);
		view.setViewName("/lms/mycloudenv");
		return view;
	}
	
	/**
	 * 我的云平台
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatemycloudenv")
	public void updatemycloudenv(HttpServletRequest request,HttpServletResponse response,String ip,String name,String password) {
		try
		{
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
			boolean flag = userCloudService.save(user.getId(), ip, name, password);
			String temp = flag?"sucess":"fail";
			String str = "{'sucess':'"+temp+"'}";
			out.write(str);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 我的云虚机
	 * @param request
	 * @return
	 */
	@RequestMapping("/mycourseenv")
	public ModelAndView mycourseenv(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		User user = getSessionUser(request);
		List<UserEnvironment> uce = uceService.getMyUCE(user.getId());
		view.addObject("uce", uce);
		view.setViewName("/lms/mycourseenv");
		return view;
	}
	
	/**
	 * 我的实验
	 * @param request
	 * @return
	 */
	@RequestMapping("/mycoursetrain")
	public ModelAndView mycoursetrain(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		User user = getSessionUser(request);
		List<UserCourse> having = userCourseService.getMyHavingCourse(user
				.getId());
		List<UserCourse> finish = userCourseService.getMyFinishCourse(user
				.getId());

		view.addObject("having", having);
		view.addObject("finish", finish);
		view.setViewName("/lms/mycoursetrain");
		return view;
	}
	
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
			// if (user != null) {
			UserEnvironment uce = uceService.getMyUCE(user.getId(),courseId,trainId);
			UserTrain userTrain = userTrainService.getUserTrain(user.getId(),
					courseId, trainId);
			String result = userTrain == null ? "" : userTrain.getResult();
			String revalue = userTrain == null ? "" : userTrain.getRevalue();
			Train t = trainService.get(trainId);
			String conContent = UtilTools.replaceBackett(t.getConContent());
			String conAnswer = UtilTools.replaceBackett(t.getConAnswer());
			if (uce != null) {

				String str = "{'sucess':'sucess','ip':'" + uce.getHostname()
						+ "','username':'" + uce.getUsername() + "','result':'"
						+ result + "','revalue':'" + revalue + "','password':'"
						+ uce.getPassword()+"','conContent':'"+conContent+"','conAnswer':'"+conAnswer + "','ssh':'" + uce.getServerId()
						+ "'}";
				out.write(str);
			} else {
				String str = "{'sucess':'fail','result':'" + result+"','conContent':'"+conContent+"','conAnswer':'"+conAnswer
						+ "','revalue':'" + revalue + "'}";
				out.write(str);
			}
			// } else {
			// String result = "{'sucess':'fail'}";
			// out.write(result);
			// }
		} catch (Exception e) {

		}
	}
}
