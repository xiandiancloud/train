<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<!--[if IE 7]><html class="ie7 lte9 lte8 lte7" lang="zh-cn"><![endif]-->
<!--[if IE 8]><html class="ie8 lte9 lte8" lang="zh-cn"><![endif]-->
<!--[if IE 9]><html class="ie9 lte9" lang="zh-cn"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="zh-cn">
<!--<![endif]-->
<head>
<base href="<%=basePath%>">
<title>设置</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<meta content='text/html;charset=utf-8' http-equiv='content-type'>
<meta
	content='Flat administration template for Twitter Bootstrap. Twitter Bootstrap 3 template with Ruby on Rails support.'
	name='description'>
<link href='assets/images/meta_icons/favicon.ico' rel='shortcut icon'
	type='image/x-icon'>
<link href='assets/images/meta_icons/apple-touch-icon.png'
	rel='apple-touch-icon-precomposed'>
<link href='assets/images/meta_icons/apple-touch-icon-57x57.png'
	rel='apple-touch-icon-precomposed' sizes='57x57'>
<link href='assets/images/meta_icons/apple-touch-icon-72x72.png'
	rel='apple-touch-icon-precomposed' sizes='72x72'>
<link href='assets/images/meta_icons/apple-touch-icon-114x114.png'
	rel='apple-touch-icon-precomposed' sizes='114x114'>
<link href='assets/images/meta_icons/apple-touch-icon-144x144.png'
	rel='apple-touch-icon-precomposed' sizes='144x144'>
<!-- / START - page related stylesheets [optional] -->

<!-- / END - page related stylesheets [optional] -->
<!-- / bootstrap [required] -->
<link href="assets/stylesheets/bootstrap/bootstrap.css" media="all"
	rel="stylesheet" type="text/css" />
<!-- / theme file [required] -->
<link href="assets/stylesheets/light-theme.css" media="all"
	id="color-settings-body-color" rel="stylesheet" type="text/css" />
<!-- / coloring file [optional] (if you are going to use custom contrast color) -->
<link href="assets/stylesheets/theme-colors.css" media="all"
	rel="stylesheet" type="text/css" />
<!-- / demo file [not required!] -->
<link href="assets/stylesheets/demo.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="css/train.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
      <script src="assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <![endif]-->
</head>
<body class='contrast-green fixed-header'>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id='wrapper'>
		<section id=''>
		<div class="container">
		<div class="row">
<%-- 			<div class="col-sm-3">
				<div class="list-group">
					<a href="lms/setting.action?index=1"
						class="list-group-item list-group-item-success <c:if test='${setindex == 1}'>active</c:if>">
						个人 设置 </a> <a href="lms/setting.action?index=2"
						class="list-group-item list-group-item-success <c:if test='${setindex == 2}'>active</c:if>">我的云平台</a>
					<a href="lms/setting.action?index=3"
						class="list-group-item list-group-item-success <c:if test='${setindex == 3}'>active</c:if>">我的实验</a>
				</div>
			</div> --%>
			<div class='col-xs-3'>
					<div class='row'>
						<div class='col-sm-12 box'>
							<div class='box-content'>
								<div style="text-align:center">
									<img src="images/user.jpg">
								</div>
								<div style="text-align:center">
									<a class="btn btn-link">${USER_CONTEXT.username} </a>
								</div>
								<div style="text-align:center">
									<a class="btn btn-link">你的角色 </a> <a class="btn btn-link">
										${USER_CONTEXT.role.roleName}</a>
								</div>
							</div>
						</div>
					</div>
					<div class='row'>
						<div class='col-sm-12 box'>
							<div class="box bordered-box blue-border box-nomargin">
								<div class="box-header green-background">
									<i class="icon-book"></i> 我的信息
								</div>
								<div class="box-content">
									<a href="lms/mysetting.action" class="list-group-item"> <i class='icon-plus'></i> 个人设置
									</a>
									<a href="lms/mycloudenv.action" class="list-group-item"> <i class='icon-plus'></i> 我的云平台
									</a>
									<a href="lms/mycourseenv.action" class="list-group-item"> <i class='icon-plus'></i> 我的云虚机
									</a>
									<a href="lms/mycoursetrain.action" class="list-group-item active"> <i class='icon-plus'></i> 我的实验
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-9">
				
					<div class='row'>
						<div class='col-sm-12' style='margin-bottom: 0'>
							<div class='box-content'>
								<div class='tabbable'>
									<ul class='nav nav-tabs nav-tabs-simple'>
										<li class='active'><a class='green-border'
											data-toggle='tab' href='#tabsimple1'>进行中</a></li>
										<li ><a class='green-border'
											data-toggle='tab' href='#tabsimple2'>完成</a></li>	
									</ul>
									<div class='tab-content'>
										<div class='tab-pane active' id='tabsimple1'>
											<!-- <p>I'm in Section 1.</p> -->
											<c:forEach var="uc" items="${having}">
												<div class="row">
													<div class="col-sm-12">
														<div class="box ">
															<div class="box-content">
																<p>
																	<strong>${uc.course.name}</strong>
																</p>
																<hr class="hr-normal">
																<div class="pull-left"></div>
																<div class="pull-right">
																</div>
																<div class="clearfix"></div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
										<div class='tab-pane' id='tabsimple2'>
											<c:forEach var="uf" items="${finish}">
												<div class="row">
													<div class="col-sm-12">
														<div class="box bordered-box blue-border box-nomargin">
															<div class="box-content">
																<p>
																	<strong>${uf.course.name}</strong>
																</p>
																<hr class="hr-normal">
																<div class="pull-left">${te.exam.describle}</div>
																<div class="pull-right">
																</div>
																<div class="clearfix"></div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
<%-- 					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#having" data-toggle="tab">
								进行中</a></li>
						<li><a href="#finish" data-toggle="tab">完成</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="having">
							<c:forEach var="uc" items="${having}">
								<div class="h5"></div>
								<div class="bbborder"><h5>${uc.course.name}</h5></div>
								<div class="h5"></div>
							</c:forEach>
						</div>
						<div class="tab-pane fade" id="finish">
							<c:forEach var="uf" items="${finish}">
								<div class="h5"></div>
								<div class="bbborder"><h5>${uf.course.name}</h5></div>
								<div class="h5"></div>
							</c:forEach>
						</div>
					</div> --%>
				</div>
		</div>
	</div>
		</section>
	</div>
	<div class="clear"></div><div class="clear"></div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- / jquery [required] -->
	<script src="assets/javascripts/jquery/jquery.min.js"
		type="text/javascript"></script>
	<!-- / jquery mobile (for touch events) -->
	<script src="assets/javascripts/jquery/jquery.mobile.custom.min.js"
		type="text/javascript"></script>
	<!-- / jquery migrate (for compatibility with new jquery) [required] -->
	<script src="assets/javascripts/jquery/jquery-migrate.min.js"
		type="text/javascript"></script>
	<!-- / jquery ui -->
	<script src="assets/javascripts/jquery/jquery-ui.min.js"
		type="text/javascript"></script>
	<!-- / jQuery UI Touch Punch -->
	<script
		src="assets/javascripts/plugins/jquery_ui_touch_punch/jquery.ui.touch-punch.min.js"
		type="text/javascript"></script>
	<!-- / bootstrap [required] -->
	<script src="assets/javascripts/bootstrap/bootstrap.js"
		type="text/javascript"></script>
	<!-- / modernizr -->
	<script src="assets/javascripts/plugins/modernizr/modernizr.min.js"
		type="text/javascript"></script>
	<!-- / retina -->
	<script src="assets/javascripts/plugins/retina/retina.js"
		type="text/javascript"></script>
	<!-- / theme file [required] -->
	<script src="assets/javascripts/theme.js" type="text/javascript"></script>
	<!-- / demo file [not required!] -->
	<script src="assets/javascripts/demo.js" type="text/javascript"></script>
	<!-- / START - page related files and scripts [optional] -->

	<!-- / END - page related files and scripts [optional] -->
	<script src="js/common.js" type="text/javascript"></script>
	<script src="js/holder.js"></script>
	<script>
	</script>
</body>
</html>