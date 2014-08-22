<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="ico/favicon.ico">

<title>实验</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/train.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="js/jquery-1.11.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/holder.js"></script>
<script src="js/jqPaginator.js"></script>
</head>
<body>

	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- <div class="h30"></div>
	<div class="clear"></div> -->
	<div class="navbar navbar-inverse navbar-fixed-top toptwo" role="navigation">
	<div class="container-fluid nospace">
			<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse">
					<div class="row topback">
			<div class="col-sm-3 topback left margin5">
				<a href="javascript:gotouppage();"><span
					class="glyphicon glyphicon-arrow-left">${course.name}</span></a>
			</div>
			<div class="col-sm-7 topback text-center margin5">操作控制台</div>
			<div class="col-sm-1 topback text-center margin5">
				<a href="javascript:pasueClock();"><span
					class="glyphicon glyphicon-pause">暂停</span></a>
			</div>
			<div class="col-sm-1 topback text-center margin5">
				<a><span class="glyphicon glyphicon-time" id="clock"></span></a>
			</div>
		</div>
		</div>
	</div>
	</div>
	<div class="h50"></div><div class="h50"></div>
	<div class="container-fluid topback nospace">
<%-- 		<div class="row topback gtop">
			<div class="col-sm-2 topback left margin5">
				<a href="javascript:gotouppage();"><span
					class="glyphicon glyphicon-arrow-left">${course.name}</span></a>
			</div>
			<div class="col-sm-1 topback text-center margin5" id="trainname"></div>
			<div class="col-sm-7 topback text-center margin5">操作控制台</div>
			<div class="col-sm-1 topback text-center margin5">
				<a href="javascript:pasueClock();"><span
					class="glyphicon glyphicon-pause">暂停</span></a>
			</div>
			<div class="col-sm-1 topback text-center margin5">
				<a><span class="glyphicon glyphicon-time" id="clock"></span></a>
			</div>
		</div> --%>
		<div class="row topback">
			<div class="col-sm-4 nospace theight">

				<div class="panel" id="leftpanel">
					<div class="panel-body">
						<div id="pagination" class="center"></div>
						<div class="panel panel-default cmargin5">
						  <div class="h30 l1back hfont">
						    <div class="lmargin5">实验定义</div>
						  </div>
						  <div class="panel-body">
							<form class="form-horizontal" role="form">
							  <div class="form-group">
							    <label for="trainname" class="col-sm-2 control-label"><div class="h2font">名称</div></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="trainname" disabled="disabled">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="traincode" class="col-sm-2 control-label"><div class="h2font">编号</div></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="traincode" disabled="disabled">
							    </div>
							  </div>
							</form>
						  </div>
						</div>

						<div class="panel panel-default cmargin5">
						  <div class="l2back h30 hfont">
						    <div class="lmargin5">环境</div>
						  </div>
						  <div class="panel-body">
							<form class="form-horizontal" role="form">
							  <div class="form-group">
							    <label for="trainprename" class="col-sm-2 control-label"><div class="h2font">模板</div></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="trainprename" disabled="disabled">
							    </div>
							  </div>
							  <h6 id="hasenv" class="none">
									<table class="table table-bordered">
										<tbody>
											<tr>
												<td>ip</td>
												<td id="ip"></td>
											</tr>
											<tr>
												<td>username</td>
												<td id="username"></td>
											</tr>
											<tr>
												<td>password</td>
												<td id="password"></td>
											</tr>
											<tr>
												<td>serverId</td>
												<td id="ssh"></td>
											</tr>
										</tbody>
									</table>
								</h6>
								<a href="javascript:void(0);" id="trainjoin" class="none">
									<button type="button" class="btn btn-primary">创建环境</button>
								</a>
								<img src="images/Loading.gif" class="none" id="imgenv"/>
							</form>
						  </div>
						</div>
						
						<div class="panel panel-default cmargin5">
						  <div class="l3back h30 hfont">
						    <div class="lmargin5">题目</div>
						  </div>
						  <div class="panel-body">
							    <label for="trainname" class="control-label"><div class="h2font">内容</div></label>
							    <h6 id="traincon"></h6>
						  </div>
						</div>
						
						<div class="panel panel-default cmargin5">
						  <div class="l4back h30 hfont">
						    <div class="lmargin5">结果</div>
						  </div>
						  <div class="panel-body">
							    <form role="form">
								  <div class="form-group">
								    <label for="trainanswer"><div class="h2font">内容</div></label>
								    <textarea class="form-control" rows="6" id="trainanswer"></textarea>
								  </div>
								</form>
								<a href="javascript:void(0);" id="trainsubmit">
									<button type="button" class="btn btn-primary" id="trainbutton">提交</button>
								</a>
								<img src="images/Loading.gif" class="none" id="imgsubmit"/>
						  </div>
						</div>
						
						<div class="panel panel-default cmargin5">
						  <div class="l5back h30 hfont">
						    <div class="lmargin5">成绩</div>
						  </div>
						  <div class="panel-body">
						  </div>
						</div>
						
						<div class="panel panel-default cmargin5">
						  <div class="l6back h30 hfont">
						    <div class="lmargin5">答案</div>
						  </div>
						  <div class="panel-body">
						  </div>
						</div>
						
					</div>
				</div>
				<!-- </div> -->
			</div>
			<div class="col-sm-8 nospace fheight">
				<iframe id="iframe" src="http://192.168.1.90:8090/" frameBorder="0"
					width="100%" scrolling="no" height="100%"></iframe>
			</div>
		</div>
		<!-- <div class="col-sm-12 nospace">
			<div class="sback">
				<iframe id="iframe" src="http://192.168.1.90:8090/" frameBorder="0"
					width="100%" scrolling="no"></iframe>
			</div>
		</div> -->
	</div>
	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>

	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Modal title</h4>
				</div> -->
				<div class="modal-body">
					<h4>不要离开太久哦</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="gototrain();">继续实验</button>
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- 	<script src="js/jquery-1.11.1.js"></script>	
	<script src="js/bootstrap.min.js"></script> -->
	<script>
		var currentPage;
		$(function() {

			$("#trainjoin").click(function() {
				createServer();
				timeservice(0);
			});
			$("#trainsubmit").click(function() {
				myshell();
				timeservice(0);
			});

			initClock();
			//var mainheight = $("#leftpanel").height();
			//$("#iframe").height(mainheight);
		});
		function initlist()
		{
			var totalPages = "${fn:length(tlist)}";
			currentPage = "${currentPage}";
			resetTrain(currentPage);
			totalPages = parseInt(totalPages);
			$
					.jqPaginator(
							'#pagination',
							{
								totalPages : totalPages,
								visiblePages : 4,
								currentPage : currentPage,

								wrapper : '<ul class="pagination lastspan"></ul>',
								/* 		 first : '<li class="first"><a href="javascript:void(0);">首页</a></li>',
								 */prev : '<li class="prev"><a href="javascript:void(0);">&laquo;</a></li>',
								next : '<li class="next"><a href="javascript:void(0);">&raquo;</a></li>',
								/*  last : '<li class="last"><a href="javascript:void(0);">尾页</a></li>', */
								page : '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
								onPageChange : function(num) {
									currentPage = num;
									resetTrain(num);
									timeservice(0);
								}
							});
		}
		var tt;
		var onet;
		function timetos(s) {
			var t = 0;
			var strs = s.split("天");
			var other;
			if (strs.length > 1) {
				var day = strs[0];
				t += 24 * day * 3600;
				other = strs[1];
			} else {
				other = strs[0];
			}
			var strss = other.split(":");
			t += parseInt(strss[0]) * 3600 + parseInt(strss[1]) * 60
					+ parseInt(strss[2]);
			return t;
		}
		function stotime(s) {
			var t;
			if (s > -1) {
				hour = Math.floor(s / 3600);
				min = Math.floor(s / 60) % 60;
				sec = s % 60;
				day = parseInt(hour / 24);
				if (day > 0) {
					hour = hour - 24 * day;
					t = day + "天 " + hour + ":";
				} else
					t = hour + ":";
				if (min < 10) {
					t += "0";
				}
				t += min + ":";
				if (sec < 10) {
					t += "0";
				}
				t += sec;
			}
			return t;
		}
		function timedCount() {
			tt = parseInt(tt) + 1;

			$("#clock").html(stotime(tt));

			onet = setTimeout("timedCount();", 1000);
		}
		function stopCount() {
			clearTimeout(onet);
		}
		function initClock() {
			var courseId = parseInt("${course.id}");
			var data = {
				courseId : courseId
			};
			$.ajax({
				url : "dotime.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if (a.sucess == "sucess") {
						tt = a.dotime;
						$("#clock").html(stotime(tt));
						timedCount();
						initlist();
					}
				}
			});
		}
		function timeservice(index)
		{
			var str = $("#clock").html();
			var usetime = timetos(str);
			var courseId = parseInt("${course.id}");
			var usetime;
			var data = {
				courseId : courseId,
				usetime : usetime
			};
			$.ajax({
				url : "setdotime.action",
				type : "post",
				data : data,
				success : function(s) {
					if (index == 1)
					{
						location.href = "getCourse.action?courseId=" + courseId;
					}
				}
			});
		}
		function pasueClock() {
			stopCount();
			$('#myModal').modal({
				keyboard : false
			});
			timeservice(0);
		}
		function gotouppage() {
			timeservice(1);
		}
		function gototrain() {
			$('#myModal').modal('hide');
			timedCount();
		}
		function myshell() {
			$("#imgsubmit").show();
			<c:forEach items="${tlist}" var="train" varStatus="status">
			if ("${status.count}" == currentPage) {
				var name = "${train.preName}";
				var courseId = parseInt("${course.id}");
				var path = "${train.conShell}";
				var trainId = parseInt("${train.id}");
				var data = {
					courseId : courseId,
					trainId : trainId,
					name : name,
					path : path
				};
				$.ajax({
					url : "myshell.action",
					type : "post",
					data : data,
					success : function(s) {
						var a = eval("(" + s + ")");
						$("#imgsubmit").hide();
						if (a.sucess == "sucess") {
							var reg = new RegExp("</br>", "g"); //创建正则RegExp对象 
							var newstr = a.result.replace(reg, "\r\n");
							var newstr2 = a.revalue.replace(reg, "\r\n");
							$("#trainresult").html(newstr);
							$("#trainanswer").html(newstr2);
							$("#trainbutton").html("再来一遍");
						}
						else
						{
							alert(a.msg);
						}
					}
				});
			}
			</c:forEach>
		}
		function createServer() {
			$("#imgenv").show();
			<c:forEach items="${tlist}" var="train" varStatus="status">
			if ("${status.count}" == currentPage) {
				var name = "${train.preName}";
				var courseId = parseInt("${course.id}");
				var data = {
					courseId : courseId,
					name : name
				};
				$.ajax({
					url : "createServer.action",
					type : "post",
					data : data,
					success : function(s) {
						var a = eval("(" + s + ")");
						$("#imgenv").hide();
						if (a.sucess == "sucess") {
							$("#hasenv").show();
							$("#trainjoin").hide();
							$("#ip").html(a.ip);
							$("#username").html(a.username);
							$("#password").html(a.password);
							$("#ssh").html(a.ssh);
						} else {
							$("#hasenv").hide();
							$("#trainjoin").show();
							alert("创建环境失败");
						}
					}
				});
			}
			</c:forEach>
		}
		function resetTrain(currentPage) {
			<c:forEach items="${tlist}" var="train" varStatus="status">
			if ("${status.count}" == currentPage) {
				var name = "${train.preName}";
				var courseId = parseInt("${course.id}");
				var trainId = parseInt("${train.id}");
				var data = {
					courseId : courseId,
					trainId : trainId,
					name : name
				};
				$.ajax({
					url : "hasenv.action",
					type : "post",
					data : data,
					success : function(s) {
						var a = eval("(" + s + ")");
						if (a.sucess == "sucess") {
							$("#hasenv").show();
							$("#trainjoin").hide();
							$("#ip").html(a.ip);
							$("#username").html(a.username);
							$("#password").html(a.password);
							$("#ssh").html(a.ssh);
							
						} else {
							$("#hasenv").hide();
							$("#trainjoin").show();
						}
						//a.result
						if (a.result && a.result.length > 0)
						{
							var reg = new RegExp("</br>", "g"); //创建正则RegExp对象 
							var newstr = a.result.replace(reg, "\r\n");
							var newstr2 = a.revalue.replace(reg, "\r\n");
							$("#trainresult").html(newstr);
							$("#trainanswer").html(newstr2);
							$("#trainbutton").html("再来一遍");
						}
						else
						{
							$("#trainresult").html("");
							$("#trainanswer").html("");
							$("#trainbutton").html("提交");
						}
					}
				});

				$("#trainname").attr("value","${train.name}");//html("实验名称：${train.name}");
				$("#traincode").attr("value","${train.codenum}");//html("实验名称：${train.name}");
				$("#trainprename").attr("value","${train.preName}");//html("${train.preName}");
				//$("#trainjoin").attr("href", "");
				$("#traincon").html("${train.conContent}");
				//$("#trainanswer").html("${train.conAnswer}");
			}
			</c:forEach>
		}
	</script>
</body>
</html>