package com.dhl.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.User;

/**
 * 登陆过滤器
 * 
 * @author dhl
 * 
 */
public class LoginFilter implements Filter {
	private static final String FILTERED_REQUEST = "@@session_context_filtered_request";

	private static final String[] INHERENT_ESCAPE_URIS = {
			"/getAllCategory.action", "getCourse.action", "/tologin.action",
			"/login.action", "getCourseByCategoryId.action",
			"recentcourse.action", "toregeister.action","regeister.action", "getAllSchool.action",
			"/bbb.action" };

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		if (request != null && request.getAttribute(FILTERED_REQUEST) != null
				|| httpRequest.getRequestURI().contains("cms")) {
			chain.doFilter(request, response);
		} else {

			request.setAttribute(FILTERED_REQUEST, Boolean.TRUE);
			// HttpServletRequest httpRequest = (HttpServletRequest) request;
			User userContext = getSessionUser(httpRequest);

			// ②-3 用户未登录, 且当前URI资源需要登录才能访问
			if (userContext == null
					&& !isURILogin(httpRequest.getRequestURI(), httpRequest)) {
				String toUrl = httpRequest.getRequestURL().toString();
				if (!StringUtils.isEmpty(httpRequest.getQueryString())) {
					toUrl += "?" + httpRequest.getQueryString();
				}

				// ②-4将用户的请求URL保存在session中，用于登录成功之后，跳到目标URL
				httpRequest.getSession().setAttribute(
						CommonConstant.LOGIN_TO_URL, toUrl);

				// request.getRequestDispatcher("/tologin.action").forward(request,
				// response);
				HttpServletResponse re = (HttpServletResponse) response;
				String contextPath = httpRequest.getContextPath();
				re.sendRedirect(contextPath + "/tologin.action");
				return;
			}
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	/**
	 * 当前URI资源是否需要登录才能访问
	 * 
	 * @param requestURI
	 * @param request
	 * @return
	 */
	private boolean isURILogin(String requestURI, HttpServletRequest request) {
		if (request.getContextPath().equalsIgnoreCase(requestURI)
				|| (request.getContextPath() + "/")
						.equalsIgnoreCase(requestURI))
			return true;
		for (String uri : INHERENT_ESCAPE_URIS) {
			if (requestURI != null && requestURI.indexOf(uri) >= 0) {
				return true;
			}
		}
		return false;
	}

	protected User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute(
				CommonConstant.USER_CONTEXT);
	}

	@Override
	public void destroy() {

	}
}
