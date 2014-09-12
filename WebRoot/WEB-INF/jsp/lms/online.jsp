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
		
	<title>学堂在线</title>
	
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

	
	<link rel="stylesheet" type="text/css" href="css/reset.d647ac6d47ad.css">
	<link rel="stylesheet" type="text/css" href="css/index.c7e3fd169ae0.css">
	<link rel="stylesheet" type="text/css" href="css/media.31a5f54389ba.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.onebyone-min.css"/>
	<link rel="stylesheet" type="text/css" href="css/light-theme.css"/>
	<link rel="stylesheet" type="text/css" href="css/pagination.css"/>
	

	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/lunbo.js"></script>
	
</head>




<body  class='contrast-green fixed-header'>
	
<jsp:include page="header.jsp"></jsp:include>
<div class="h40"></div>	
<article>
	<div class="wrap">
		<div class="search_wrap">
			<section id="search" style="position: relative;">
				<form role="search" id="main-search" class="main-search" action="/search">
						<div class="row">
						<div class="col-xs-3">
						<select class='select2 form-control' name="major">
                              
                              <option value='NC'>North Carolina</option>
                              <option value='OH'>Ohio</option>
                              <option value='PA'>Pennsylvania</option>
                              <option value='RI'>Rhode Island</option>
                              <option value='SC'>South Carolina</option>
                              <option value='VT'>Vermont</option>
                              <option value='VA'>Virginia</option>
                              <option value='WV'>West Virginia</option>
                              <option value='NY' selected="selected">-专业-</option>
                          </select>
                          </div>
                          <div class="col-xs-3">
                          <select class='select2 form-control' name="level">                          
                              <option value='all' selected="selected">-等级-</option>
                              <option value='low'>初级</option>
                              <option value='middle'>中级</option>
                              <option value='high'>高级</option>          
                          </select>
                          </div>
                          <div class="col-xs-6">
                      	  <input value="" placeholder="Search..." class="form-control" name="q" type="text" />
                          <span >
                          	<button class='btn' type='submit'>
                           		<i class='icon-search'></i>
                          	</button>
                          </span>    
                           </div>                
					</div>
				</form>
			</section>
		</div>
			<div class="oneByOne_item" style="display:block">
				<ul id="list_style" class="list_style">
					<li class="cf image_scale">
						<div class="img fl">
							<div class="cover">
								<a target="_blank" title="点击查看"
									href="/courses/TsinghuaX/60240013_2014X/2014_T2/about">点击查看</a>
							</div>
							<img title="组合数学（2014秋）" alt="组合数学（2014秋）"
								src="/c4x/TsinghuaX/60240013_2014X/asset/images_course_image.jpg">
						</div>
						<div class="fl center">
							<p class="name">清华大学 计算机系 副教授&nbsp;&nbsp;马昱春</p>
							<h3>
								<a target="_blank" title="组合数学（2014秋）"
									href="/courses/TsinghuaX/60240013_2014X/2014_T2/about">组合数学（2014秋）&nbsp;&nbsp;<span>TsinghuaX&nbsp;60240013X</span>
								</a>
							</h3>
							<p class="txt">本课程是计算机专业核心的基础理论课,是计算机理论分析和算法设计的基础,侧重介绍组合数学的概念和思想，研究离散对象的计数方法和相关理论。</p>
						</div>
						<div class="right fl">
							<p class="green">即将开课</p>
							<p class="updata">更新于 6天前</p>
							<p>
								<a>助教在线</a>
							</p>
						</div></li>
				</ul>
			</div>
			<div style="text-align:center;">
            	<ul class="pagination" >
                        <li class="prev">
                          <a href="javascript:void(0)">«</a>
                        </li>
                        <li class="active course">
                          <a href="javascript:void(0)">1</a>
                        </li>
                        <li class="course">
                          <a href="javascript:void(0)">2</a>
                        </li>
                        <li class="next">
                          <a href="javascript:void(0)">»</a>
                        </li>
		   		</ul>
           </div>
	</div>
</article>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
