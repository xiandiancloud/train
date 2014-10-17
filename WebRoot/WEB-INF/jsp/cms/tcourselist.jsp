<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<base href="<%=basePath%>">
<title>我的课程 </title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="path_prefix" content="">
<link type="text/css" rel="stylesheet" href="tcss/normalize.css">
<link type="text/css" rel="stylesheet" href="tcss/font-awesome.css">
<link type="text/css" rel="stylesheet" href="tcss/number-polyfill.css">
<link type="text/css" rel="stylesheet" href="tcss/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="tcss/jquery-ui-1.8.22.custom.css">
<link type="text/css" rel="stylesheet" href="tcss/jquery.qtip.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style.css">
<link type="text/css" rel="stylesheet" href="tcss/content.min.css">
<link type="text/css" rel="stylesheet"
	href="tcss/tinymce-studio-content.css">
	
<link type="text/css" rel="stylesheet" href="tcss/skin.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app-extend1.css">
<link type="text/css" rel="stylesheet" href="tcss/style-xmodule.css">
<script src="degreepicker. min.js"></script>
<script src="degreepicker.js"></script>

	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/index.js"></script>
	<!-- 日期控件js -->
	<script type="text/javascript"  src="js/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="css/jquery.timepicker.css">
	<!-- <script type="text/javascript">
	//页面加载时,隐藏
	window.onload=function(){
	$("#dengji").hide();
	</script>
	/* $("#degreelevel").val($("#dengji li:each").attr("class","select"));
	$("#dengji li:each").click();
	}; */
	<script type="text/javascript">
	//工厂函数显示或者
	$(function(){
	//显示
	$("#degreelevel").focus(function(){
	$("#dengji").show();
	});
	//隐藏
	$("#degreelevel").blur(function(){
	$("#dengji").hide();
	});
		
		/* $("#dengji").children.bind("click",function(){
		$("#degreelevel").val($(this).text());
		}); */
		/* $("#dengji li").each(function(index){
		alert(index+$(this).text());
		}); */
		$("#dengji li").each(function(index,item){
		$(item).bind("click",function(){
		alert(1);
		alert($(this).text());
		$("#degreelevel").val($(this).text());
		alert(2);
		});
		});	
	})
	</script> -->
	
<script type="text/javascript">
window.onload=function(){
$("#dengji").hide();
};
$("#coursespecial").hide();
</script>
<script type="text/javascript">
$(function(){
$("#degreelevel").focus(function(){
$("#dengji").show();
});
$("#category").focus(function(){
$("#coursespecial").show();
});


$("#degreelevel").blur(function(){
$("#dengji").hide();
});
$("#category").blur(function(){
$("#coursespecial").hide();
});

$("#dengji li a").click(function(index){
  alert($(this).text());
  $("#dengji li").removeClass("showdegree");
  $(this).parent().addClass("showdegree");
});



/* $("#dengji li").each(function(index) {
    alert(index + ': ' + $(this).text());
  }); */



})
</script>
	
</head>
<body class="is-signedin index view-dashboard hide-wip lang_zh-cn">
	<a class="nav-skip" href="#content">跳过本内容页</a>
	<!-- view -->
	<div class="wrapper wrapper-view">

		<jsp:include page="theader.jsp"></jsp:include>

		<div id="page-alert"></div>

		<div id="content">

			<div class="wrapper-mast wrapper">
				<header class="mast has-actions">
				<h1 class="page-header">我的课程</h1>
				<nav class="nav-actions">
				<h3 class="sr">页面操作</h3>
				<ul>
					<li class="nav-item"><a
						class="button new-button new-course-button" onclick="btn()"><i
							class="icon-plus icon-inline"></i>新建课程</a></li>
				</ul>
				</nav> </header>
			</div>
			<div class="wrapper-content wrapper">
				<section class="content"> <article class="content-primary"
					role="main">
				<div class="introduction">
					<h2 class="title">欢迎，${USER_CONTEXT.username}！</h2>
					<div class="copy">
						<p>这是当前您在平台中可以访问的所有课程：</p>
					</div>
				</div>
				<div class="wrapper-create-element wrapper-create-course">
					<form class="create-course course-info" id="create-course-form"
						name="create-course-form">
						<div class="wrap-error">
							<div id="course_creation_error" name="course_creation_error"
								class="message message-status message-status error" role="alert">
								<p>请改正下面高亮的字段。</p>
							</div>
						</div>

						<div class="wrapper-form">
							<h3 class="title">创建一个新课程</h3>
							<fieldset>
								<legend class="sr">创建一个新课程的必要信息</legend>

								<ol class="list-input">
									<li class="field text required" id="field-course-name"><label
										for="name">课程名称</label> <input
										class="new-course-name" id="name" type="text"
										name="new-course-name" aria-required="true"
										placeholder="例如，计算机科学导论" /> <span class="tip"><!-- The
											public display name for your course. This cannot be changed,
											but you can set a different display name in Advanced Settings
											later. -->课程公开显示名称，公开名称是不能被修改的，但您以后可以在高级设置中设置一个不同的显示名字</span> <span class="tip tip-error is-hiding"></span></li>
									<li class="field text required" id="field-course-category"><label
										for="name">课程专业</label>
										<input
										class="new-course-rank ui-timepicker-input" id="category" type="text"
										name="new-course-rank" aria-required="true"
										placeholder="例如，大数据    云计算    iaas" style="width:200px;" />
										<!-- <input
										class="new-course-category" id="category" type="text"
										name="new-course-category" aria-required="true"
										placeholder="例如，云计算   大数据  iaas" /> -->
										<ul id="coursespecial" tabindex="-1" class="ui-timepicker-list" style="position: absolute; left: 342.53125px; height:84px; margin-top:0.5px; width:198px;display: block;">
										<li style="text-align:center" ><a href="javascript void(0);">大   数   据</a></li>
										<li style="text-align:center"><a href="javascript void(0);">云   计   算   </a></li>
										<li style="text-align:center"><a href="javascript void(0);">iaas</a></li>
										</ul>
										
											<!-- <ul id="speciality" tabindex="-1" class="ui-timepicker-list" style="position: absolute; left: 342.53125px; height:84px; margin-top:20px; width:198px;display: block;">
										<li style="text-align:center">云          计           算</li>
										<li style="text-align:center">i  a  a  s</li>
										<li style="text-align:center">大          数           据</li>
										</ul> -->
										 <!-- <input
										class="new-course-category" id="category" type="text"
										name="new-course-category" aria-required="true"
										placeholder="例如，计算机" /> --> <!-- <select class="short"	id="category"></select><span class="tip"> -->
									
										<span class="tip"><!-- The
											public display name for your course. This cannot be changed,
											but you can set a different display name in Advanced Settings
											later. -->课程公开显示名称，公开名称是不能被修改的，但您以后可以在高级设置中设置一个不同的显示名字</span> <span class="tip tip-error is-hiding"></span></li>
									<li class="field text required" id="field-course-rank"><label
										for="name">等级</label>
										 <input
										id="degreelevel" type="text"
										 aria-required="true"
										placeholder="例如，高级 中级  低级" style="width:200px;" onFocus="show();" value=""/>
										<ul id="dengji" tabindex="-1" class="ui-timepicker-list" style="position: absolute; left: 342.53125px; height:84px; margin-top:0.5px; width:198px;display: block;">
										<li style="text-align:center" class="showdegree"><a href="javascript void(0);">高   级</a></li>
										<li style="text-align:center"><a href="javascript void(0);">中   级</a></li>
										<li style="text-align:center"><a href="javascript void(0);">初   级</a></li>
										</ul>
										<span class="tip"><!-- The
											public display name for your course. This cannot be changed,
											but you can set a different display name in Advanced Settings
											later. -->课程公开显示名称，公开名称是不能被修改的，但您以后可以在高级设置中设置一个不同的显示名字</span>
										<!-- <select style="width:100px;" size="1" multiple="multiple">
										<option value="高级">高级</option>
										<option value="中级">中级</option>
										<option value="低级">低级</option>
										</select> -->
										 <span class="tip tip-error is-hiding"></span></li>
									<li class="field text required" id="field-organization"><label
										for="org">组织</label> <input class="new-course-org"
										id="org" type="text" name="new-course-org"
										aria-required="true"
										placeholder="例如：UniversityX 或 OrganizationX" /> <span
										class="tip">资助本课程的机构名称。 <strong>注意：这是你课程URL的一部分，请勿使用空格或特殊字符。</strong>
											这将不能被更改，但是您可以稍后在高级设置中设置不同的显示名称。
									</span> <span class="tip tip-error is-hiding"></span></li>

									<li class="field text required" id="field-course-number">
										<label for="coursecode">课程代码</label> <input
										class="new-course-number" id="coursecode" type="text"
										name="new-course-number" aria-required="true"
										placeholder="例如： CS101" /> <span class="tip">这个编号用来标记该课程在组织内的唯一性。
											<strong>注意：这是课程URL的一部分，请勿使用空格或特殊字符，一旦设定不可更改。</strong>
									</span> <span class="tip tip-error is-hiding"></span>
									</li>

									<li class="field text required" id="field-course-run"><label
										for="starttime">开课时间</label>
										   <!-- <input type="text"  id="temp" 
                         	onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/> -->									
                         		 <input	class="new-course-run" id="starttime" type="text" name="new-course-run" aria-required="true"placeholder="例如：2014_T1" />
                         		  <span class="tip">
											您课程开设的学期。 <strong>注意：这是课程URL的一部分，请勿使用空格或特殊字符，一旦设定不可更改。</strong>
									</span> <span class="tip tip-error is-hiding"></span></li>
								</ol>

							</fieldset>
						</div>

						<div class="actions">
							<input type="hidden" value="False"
								class="allow-unicode-course-id" /> <input type="button"
								value="创建" class="action action-primary new-course-save" onclick="createcourse();"/> <input
								type="button" value="取消"
								class="action action-secondary action-cancel new-course-cancel"
								onclick="btn()" />
						</div>
					</form>
				</div>

				<div class="courses">
					<ul class="list-courses">
						<c:forEach var="tcourse" items="${tcourselist}">
							<li class="course-item"><a class="course-link" href="cms/totcourse.action?courseId=${tcourse.course.id}">
									<h3 class="course-title">${tcourse.course.name}</h3>

									<div class="course-metadata">
										<span class="course-org metadata-item"> <span
											class="label">组织：</span> <span class="value">${tcourse.course.org}</span>
										</span> <span class="course-num metadata-item"> <span
											class="label">课程代码：</span> <span class="value">${tcourse.course.coursecode}</span>
										</span> <span class="course-run metadata-item"> <span
											class="label">开课时间</span> <span class="value">${tcourse.course.starttime}</span>
										</span>
									</div>
							</a>

								<ul class="item-actions course-actions">
								<table><tr><td><li class="action"><a href="cms/delcourse.action?courseId=${tcourse.course.id}" rel="external"
										class="button view-button view-live-button">删除</a></li></td><td>&nbsp;&nbsp;</td><td><li class="action"><a href="cms/totcourse.action?courseId=${tcourse.course.id}" rel="external"
										class="button view-button view-live-button">在线查看</a></li></td></tr></table>
								<%-- 	<li class="action"><a href="cms/totcourse.action?courseId=${tcourse.course.id}" rel="external"
										class="button view-button view-live-button">在线查看</a></li> --%>
								</ul></li>
						</c:forEach>
						<!-- 
          <li class="course-item">
            <a class="course-link" href="/course/Nanjing/NO003/2014_T2">
              <h3 class="course-title">云计算与软件工程</h3>

              <div class="course-metadata">
                <span class="course-org metadata-item">
                  <span class="label">组织：</span> <span class="value">Nanjing</span>
                </span>
                <span class="course-num metadata-item">
                  <span class="label">课程代码：</span>
                  <span class="value">NO003</span>
                </span>
                <span class="course-run metadata-item">
                  <span class="label">开课时间</span> <span class="value">2014_T2</span>
                </span>
              </div>
            </a>

            <ul  class="item-actions course-actions">
              <li class="action">
                <a href="//localhost:8000/courses/Nanjing/NO003/2014_T2/jump_to/i4x://Nanjing/NO003/course/2014_T2" rel="external" class="button view-button view-live-button">在线查看</a>
              </li>
            </ul>
          </li>
          
          <li class="course-item">
            <a class="course-link" href="/course/NJUPT/No001/2014_T1">
              <h3 class="course-title">数据结构</h3>

              <div class="course-metadata">
                <span class="course-org metadata-item">
                  <span class="label">组织：</span> <span class="value">NJUPT</span>
                </span>
                <span class="course-num metadata-item">
                  <span class="label">课程代码：</span>
                  <span class="value">No001</span>
                </span>
                <span class="course-run metadata-item">
                  <span class="label">开课时间</span> <span class="value">2014_T1</span>
                </span>
              </div>
            </a>

            <ul  class="item-actions course-actions">
              <li class="action">
                <a href="//localhost:8000/courses/NJUPT/No001/2014_T1/jump_to/i4x://NJUPT/No001/course/2014_T1" rel="external" class="button view-button view-live-button">在线查看</a>
              </li>
            </ul>
          </li>
          
          <li class="course-item">
            <a class="course-link" href="/course/nicky-NJUPT/NO002/2014_09">
              <h3 class="course-title">算法设计与分析</h3>

              <div class="course-metadata">
                <span class="course-org metadata-item">
                  <span class="label">组织：</span> <span class="value">nicky-NJUPT</span>
                </span>
                <span class="course-num metadata-item">
                  <span class="label">课程代码：</span>
                  <span class="value">NO002</span>
                </span>
                <span class="course-run metadata-item">
                  <span class="label">开课时间</span> <span class="value">2014_09</span>
                </span>
              </div>
            </a>

            <ul  class="item-actions course-actions">
              <li class="action">
                <a href="//localhost:8000/courses/nicky-NJUPT/NO002/2014_09/jump_to/i4x://nicky-NJUPT/NO002/course/2014_09" rel="external" class="button view-button view-live-button">在线查看</a>
              </li>
            </ul>
          </li>
        
        -->
					</ul>
				</div>

				</article> 
				<aside class="content-supplementary" role="complimentary" style="margin-top:90px;">
				<div class="bit">
					<h3 class="title title-3">对云实训平台不熟悉?</h3>
					<p>	点击右上角的帮助按钮，从而获得更多您访问的平台页面信息.您也可以使用在页面底部的链接，从而进入我们不断更新的文件和其他一些平台资源。
						</p>

					<ol class="list-actions">
						<li class="action-item"><a
							href="http://edx.readthedocs.org/projects/edx-partner-course-staff/en/latest/getting_started/get_started.html"
							target="_blank">从云实训平台开始</a></li>
						<li class="action-item"><a
							href="http://help.edge.edx.org/discussion/new"
							class="show-tender"
							title="Use our feedback tool, Tender, to request help">向云实训平台求助</a></li>
					</ol>
				</div>


				</aside> </section>


			</div>

		</div>

		<div class="wrapper-sock wrapper">
			<ul class="list-actions list-cta">
				<li class="action-item"><a href="#sock"
					class="cta cta-show-sock"><i class="icon-question-sign"></i> <span
						class="copy"><!-- Looking for help with Studio? -->
						向云平台寻求帮助？</span></a></li>
			</ul>

			<div class="wrapper-inner wrapper">
				<section class="sock" id="sock"> <header>
				<h2 class="title sr">edX Studio Documentation</h2>
				</header>

				<div class="support">
					<h3 class="title">edX Studio Documentation</h3>

					<div class="copy">
						<p>You can click Help in the upper right corner of any page to
							get more information about the page you're on. You can also use
							the links below to download the Building and Running an edX
							Course PDF file, to go to the edX Author Support site, or to
							enroll in edX101.</p>
					</div>

					<ul class="list-actions">
						<li class="action-item js-help-pdf"><a
							href="https://media.readthedocs.org/pdf/edx-partner-course-staff/latest/edx-partner-course-staff.pdf"
							target="_blank" rel="external" class="action action-primary">Building
								and Running an edX Course PDF</a></li>

						<li class="action-item"><a href="http://help.edge.edx.org/"
							rel="external" class="action action-primary">edX Studio
								Author Support</a> <span class="tip">edX Studio Author
								Support</span></li>
						<li class="action-item"><a
							href="https://edge.edx.org/courses/edX/edX101/How_to_Create_an_edX_Course/about"
							rel="external" class="action action-primary">注册edX101</a> <span
							class="tip">How to use edX Studio to build your course</span></li>
					</ul>
				</div>
				<div class="feedback">
					<h3 class="title">Request help with edX Studio</h3>

					<div class="copy">
						<p>Have problems, questions, or suggestions about edX Studio?</p>
					</div>

					<ul class="list-actions">
						<li class="action-item"><a
							href="http://help.edge.edx.org/discussion/new"
							class="action action-primary show-tender"
							title="请使用工具Tender来分享您的反馈"><i class="icon-comments"></i>联系我们</a>
						</li>
					</ul>
				</div>
				</section>
			</div>
		</div>

		<jsp:include page="tfooter.jsp"></jsp:include>

	</div>
	<script type="text/javascript">
	/* 	var box1 = document.getElementById('box');
		function btn() {
			if (box1.style.display == '') {
				box1.style.display = 'none';
			} else {
				box1.style.display = '';
			}
		} */
		$(function() {
			
			$.ajax({
				url:"cms/tgetAllCategory.action",
				type:"post",
				success:function(s){
					var a=eval("("+s+")");	
					var row = a.rows;
					var tmp = '';
					for ( var i = 0; i < row.length; i++) {
						var category = row[i];
						var id = category.id;
						var name = category.name;
						tmp += '<option value='+id+'>'+name+'</option>';
					}
					$("#category").html(tmp);
				}
			});
		});
		function createcourse()
		{
			var name = $("#name").val();
			var org = $("#org").val();
			var coursecode = $("#coursecode").val();
			var starttime = $("#starttime").val();
			var category = $("#category").val();
			var rank = $("#rank").val();
			var data = {name:name,org:org,coursecode:coursecode,starttime:starttime,category:category,rank:rank};
			$.ajax({
				url:"cms/createcourse.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.href="cms/totcourselist.action";
					}
					else
					{
						alert(a.msg);
					}
				}
			});
		}
	</script>
</body>
</html>
