<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="navbar-header">
				      <button type="button" class="navbar-toggle" data-toggle="collapse" 
				         data-target="#example-navbar-collapse">
				         <span class="sr-only">切换导航</span>
				         <span class="icon-bar"></span>
				         <span class="icon-bar"></span>
				         <span class="icon-bar"></span>
				      </button>
					<a class='navbar-brand' href='lms/getAllCategory.action'> <img
						width="51" height="48" class="logo" src="images/logo.png" /><img width="160" height="30"
							class="logo" alt="Flatty" src="images/logo-lab.png" />
					</a>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<!--向左对齐-->
					<ul class="nav navbar-nav navbar-left pleft15">
						<li><a href="lms/getAllCategory.action">首页</a></li>
						<li><a href="lms/courselist.action?currentpage=1&c=0&r=0">课程</a></li>
						<li><a href="lms/mycourse.action">我的云课堂</a></li>
						<c:if test="${USER_CONTEXT.role.roleName=='老师'}">
						<li><a href="cms">制作课件</a></li>
						</c:if>
						<c:if test="${USER_CONTEXT.role.roleName=='管理员'}">
						<li><a href="admin">系统设置</a></li>
						</c:if>
					</ul>
					<!--向右对齐-->
					<ul class="nav navbar-nav navbar-right">
						        <li class=''>
	           <a href="javascript:gotouppage();"><span
											class="glyphicon glyphicon-arrow-left">${course.name}</span></a>
			</li>
            <li class=''>
		            <a  href='javascript:pasueClock();'>
		              <i class='glyphicon glyphicon-pause'>暂停</i>
		            </a>
		    </li>
		    <li class=''>
		            <a><span class="glyphicon glyphicon-time" id="clock"></span></a>
		    </li>
						<c:choose>
							<c:when test="${empty USER_CONTEXT}">
								<li class='dropdown light only-icon'><a
									href='lms/tologin.action'> <i class='icon-signin'>登录</i>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class='dropdown dark user-menu'><a
									class='dropdown-toggle' data-toggle='dropdown' href='#'> <img
										width="23" height="23" alt="" src="images/logo.png" /> <span
										class='user-name'>${USER_CONTEXT.username}</span> <b
										class='caret'></b>
								</a>
									<ul class='dropdown-menu'>
										<li><a href='lms/mycourse.action'> <i
												class='icon-signout'></i> 我的云课堂
										</a></li>
										<li><a href='lms/mysetting.action'> <i
												class='icon-signout'></i> 设置
										</a></li>
										<li class='divider'></li>
										<li><a href='lms/loginout.action'> <i
												class='icon-signout'></i> 退出
										</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>
</header>
