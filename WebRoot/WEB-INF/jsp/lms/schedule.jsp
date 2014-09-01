<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>课程</title>

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
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="clear"></div>
		<div class="clear"></div>
		<div class="row">
			<div class="col-sm-12 hh">
				<ul class="nav nav-pills nav-justified" role="tablist">
					<li role="presentation" class=""><a
						href="getSimpleCourse.action?courseId=${courseId}">实训</a></li>
					<li role="presentation" class="active"><a href="#">进度</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>

		<div class="row panel panel-default">
			<div class="col-sm-12 nospace">
				<div id="container" style="height: 400px"></div>
			</div>
			<div class="clear"></div>
			<div class="col-sm-12 nospace">
				<c:forEach var="chapter" items="${course.chapters}">
					<div class="clear"></div>
					<hr class="">
					<div class="row">
						<div class="col-sm-3">
							<h3 class="featurette">${chapter.name}</h3>
						</div>
						<div class="col-sm-9 sborder">
							<c:forEach var="sequential" items="${chapter.sequentials}">
								<p>
								<h3>
									<a href="">${sequential.name}</a>
								</h3>
								</p>
								<p>
									<label class="featurette">${sequential.trainResult}</label>
								</p>
								<div class="h5"></div>
							</c:forEach>
						</div>
					</div>
					<div class="clear"></div>
				</c:forEach>

			</div>

		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- 	<script src="js/jquery-1.11.1.js"></script>	
	<script src="js/bootstrap.min.js"></script> -->
	<script src="js/highcharts.js"></script>
	<script src="js/highcharts-3d.js"></script>
	<script src="js/modules/exporting.js"></script>
	<script>
		$(function() {
			var os = "${series}";
			var series = eval("("+os+")");
			var osdata = "${sdata}";
			var sdata = eval("("+osdata+")");
			var ofdata = "${fdata}";
			var fdata = eval("("+ofdata+")");
			$('#container')
					.highcharts(
							{
								chart : {
									type : 'column',
									options3d : {
										enabled : true,
										alpha : 15,
										beta : 15,
										viewDistance : 25,
										depth : 40
									},
									marginTop : 80,
									marginRight : 40,
									backgroundColor: 'rgba(0,0,0,0)'
								},

								title : {
									text : '进度'
								},

								xAxis : {
									categories : series
								},

								yAxis : {
									allowDecimals : false,
									min : 0,
									title : {
										text : '实验次数'
									}
								},

								tooltip : {
									headerFormat : '<b>{point.key}</b><br>',
									pointFormat : '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
								},

								plotOptions : {
									column : {
										stacking : 'normal',
										depth : 40
									}
								},

								series : [ {
									name : '通过',
									data : sdata,
									stack : 'male'
								}, {
									name : '失败',
									data : fdata,
									stack : 'male'
								}]
							});
		});
	</script>
</body>
</html>