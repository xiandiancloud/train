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

<title>我的云课堂</title>

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
	<div class="h40"></div>
	<div class="container">
		<div class="row  wback nospace">
			<div class="clear"></div>
			<div class="col-sm-3">
				<a href="getAllCategory.action" class="thumbnail"> <img
					src="images/addcourse.png" alt="添加我的课程">
				</a>
			</div>
			<div class="col-sm-9">
				<img src="images/addct.png" alt="添加我的课程">
			</div>
		</div>
		<div class="row center wback nospace"><h3>进行中的课程</h3></div>
		<c:forEach var="ucourse" items="${having}">
			<div class="row wback nospace">
				<hr>
				<div class="clear"></div>
				<div class="col-sm-3 courseh">
					<a> <img src="${ucourse.course.imgpath}" alt="..." width="100%"
						height="150px;" class="img-rounded">
					</a>
				</div>
				<div class="col-sm-7">
					<p>
						<a>
							<h1>${ucourse.course.name}</h1>
						</a>
					</p>
					<p>
						<a> ${ucourse.course.describle}</a>
					</p>
				</div>
				<div class="col-sm-2">

					<div class="wrap">
						<div class="subwrap">
							<div class="content">
								<p>
									<a href="getCourse.action?courseId=${ucourse.course.id}"><button
											type="button" class="btn btn-primary">进入学习</button> </a>

								</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</c:forEach>
		<div class="h10 wback nospace"></div>
		<div class="row center wback nospace"><h3>完成的课程</h3></div>
		<c:forEach var="ucourse" items="${finish}">
			<div class="row wback nospace">
				<hr>
				<div class="clear"></div>
				<div class="col-sm-3 courseh">
					<a> <img src="${ucourse.course.imgpath}" alt="..." width="100%"
						height="150px;" class="img-rounded">
					</a>
				</div>
				<div class="col-sm-7">
					<p>
						<a>
							<h1>${ucourse.course.name}</h1>
						</a>
					</p>
					<p>
						<a> ${ucourse.course.describle}</a>
					</p>
				</div>
				<div class="col-sm-2">

					<div class="wrap">
						<div class="subwrap">
							<div class="content">
								<p>
									<a href="getCourse.action?courseId=${ucourse.course.id}"><button
											type="button" class="btn btn-primary">继续学习</button> </a>

								</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- 	<script src="js/jquery-1.11.1.js"></script>	
	<script src="js/bootstrap.min.js"></script> -->
	<script>
		$(function() {

		});
	</script>
</body>
</html>