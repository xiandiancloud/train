<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="wrapper-header wrapper" id="view-top">
	<header class="primary" role="banner">

		<div class="wrapper wrapper-l">
			<h1 class="branding">
				<a href="/"><img src="/static/452d696/img/logo-edx-studio.png"
					alt="edX Studio" /> </a>
			</h1>

		</div>
		<div class="wrapper wrapper-r">
			<nav class="nav-not-signedin nav-pitch">
				<h2 class="sr">You're not currently signed in</h2>
				<ol>
					<!-- 					<li class="nav-item nav-not-signedin-help"><a
						href="http://edx.readthedocs.org/projects/edx-partner-course-staff/en/latest/getting_started/get_started.html"
						title="Contextual Online Help" target="_blank">帮助</a></li>
					<li class="nav-item nav-not-signedin-signup"><a
						class="action action-signup" href="signup.jsp">注册</a></li>
					<li class="nav-item nav-not-signedin-signin"><a
						class="action action-signin" href="signin.jsp">登录</a></li> -->
					<c:choose>
						<c:when test="${empty USER_CONTEXT}">
							<li class="nav-item nav-not-signedin-signin"><a
								class="action action-signin" href="totlogin.action">登录</a></li>
						</c:when>
						<c:otherwise>
								<li class="nav-item nav-not-signedin-signin"><a
								class="action action-signin" href="#">${USER_CONTEXT.username}</a></li>
						</c:otherwise>
					</c:choose>
				</ol>
			</nav>
		</div>
	</header>
</div>