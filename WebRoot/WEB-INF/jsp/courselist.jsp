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

<title>课程列表</title>

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

	<jsp:include page="common/header.jsp"></jsp:include>
	<div class="h40"></div>
	<div class="tback">
		<div class="container">
			<div class="row nospace">
				<div class="clear"></div>
				<div class="col-sm-12">
					<img src="images/findTop.jpg" alt="添加我的课程">
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="clear"></div>
		<div class="clear"></div>
		<div class="row none" id="myrecentlycourse">
			<div class="col-sm-12 center">
				<h3>欢迎回来</h3>
			</div>
			<div class="col-sm-12 center">
				<img src="" alt="..." class="img-circle w300" id="imgcourse">
			</div>
			<div class="col-sm-12 center"><h3 id="namecourse"></h3>				
			</div>
			<div class="col-sm-12 center">
				<table class="w500 center"><tr>
				<td>
				<div class="progress w500 center">
					<div
						class="progress-bar progress-bar-primary progress-bar-striped"
						role="progressbar" aria-valuenow="40" aria-valuemin="0"
						aria-valuemax="100" style="width: 0%">
						<span class="sr-only"></span>
					</div>	
				</div>
				</td>
				<td>
				<h5 id="completecourse"></h5>	
				</td>
				</tr></table>
			</div>
			<div class="col-sm-12 clear"></div>
			<div class="col-sm-12 center">
				<a href="#" id="hrefcourse">
					<button type="button" class="btn btn-primary btn-lg">继续学习</button>
				</a>
			</div>
			<div class="col-sm-12 center">
				<hr>
			</div>
			
		</div>
		<div class="clear"></div>
		<c:forEach var="category" items="${category}">
			<div class="row">
				<div class="col-sm-12 center">
					<h3>${category.name}</h3>
				</div>
				<div class="col-sm-12 center">
					<h4>${category.describle}</h4>
				</div>
				<div id="category${category.id}"></div>
				<div class="col-sm-12 center" id="nav${category.id}"></div>
			</div>
			<div class="clear"></div>
		</c:forEach>

		<!-- 		<div class="clear"></div>
		<div class="row">
			<div class="col-sm-12 center">
				<div id="pagination" class="center"></div>
			</div>
		</div> -->
		<div class="clear"></div>
	</div>

	<jsp:include page="common/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script>
		$(function() {
			<c:forEach items="${category}" var="category">
				loadCourse("${category.id}", 1);
			</c:forEach>
			loadmyCourse();
		});

		function addimgmove() {
			$('.boxgrid').hover(function() {
				//$(".cover", this).stop().animate({top:'-150px'},{queue:false,duration:300});
				$(".cover", this).hide();
				$(".desc", this).show();
			}, function() {
				$(".cover", this).show();
				$(".desc", this).hide();
				//$(".cover", this).stop().animate({top:'0px'},{queue:false,duration:300});
			});
		}
		function loadmyCourse() {
			$.ajax({
				url : "recentcourse.action",
				type : "post",
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess)
					{
						$("#imgcourse").attr("src",a.img);
						$("#namecourse").html(a.name);
						$('.progress-bar').css({
							'width' : a.complete
						}).find('span').html(a.complete);
						$("#completecourse").html(a.complete);
						$("#hrefcourse").attr("href","tocourse.action?courseId="+a.courseId);
						$("#myrecentlycourse").show();
					}
				}
			});
		}
		function loadCourse(categoryId, pageNo) {
			categoryId = parseInt(categoryId);
			//var pageNo = 1;
			var data = {
				categoryId : categoryId,
				pageNo : pageNo
			};
			$
					.ajax({
						url : "getCourseByCategoryId.action",
						type : "post",
						data : data,
						success : function(s) {
							//conid,conreid
							var a = eval("(" + s + ")");
							var tmp = '<div class="row">';
							var row = a.rows;
							for ( var i = 0; i < row.length; i++) {
								var course = row[i];
								var id = course.id;
								var name = course.name;
								var desc = course.desc;
								var imgpath = course.imgpath;
								tmp += '<div class="col-sm-3 boxgrid">'
										+ '<a href="getCourse.action?courseId='
										+ id
										+ '" class="">'
										+ '<img src="'
										+ imgpath
										+ '" alt="..." width="100%"	height="150px;" class="img-rounded cover">'
										+ '<div class="desc none">' + desc
										+ '</div>' + '<h3>' + name + '</h3>'
										+ '</a>' + '</div>';
							}
							tmp += '</div>';
							$("#category" + categoryId).html(tmp);
							/* 							<div class="col-sm-3">
							 <a href="getSimpleCourse.action?courseId=${course.id}" class="">
							 <img src="${course.imgpath}" alt="..." width="100%"
							 height="150px;" class="img-rounded">
							 <h3>${course.name}</h3>
							 </a>
							 </div> */
							var tmp2 = '<ul class="pagination lastspan">';
							for ( var i = 1; i < a.total + 1; i++) {
								if (pageNo == i) {
									tmp2 += '<li class="active"><a href="javascript:void(0);" onclick="loadCourse('
											+ categoryId
											+ ','
											+ i
											+ ');">'
											+ i
											+ '</a></li>';
								} else {
									tmp2 += '<li><a href="javascript:void(0);" onclick="loadCourse('
											+ categoryId
											+ ','
											+ i
											+ ');">'
											+ i
											+ '</a></li>';
								}
							}
							tmp2 += '</ul>';
							/* var tmp2 = '<ul class="pagination">'+
							  '<li class="active"><a href="javascript:void(0);" onclick="">1</a></li>'+
							  '<li><a href="#">2</a></li>'+
							  '<li><a href="#">3</a></li>'+
							  '<li><a href="#">4</a></li>'+
							  '<li><a href="#">5</a></li>'+
							'</ul>'; */
							$("#nav" + categoryId).html(tmp2);
							addimgmove();
							/* 							$
							 .jqPaginator(
							 '#nav'+categoryId,
							 {
							 totalPages : a.total,
							 visiblePages : 10,
							 currentPage : 1,
							 wrapper : '<ul class="pagination"></ul>',
							 page : '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
							 onPageChange : function(num) {
							 //alert(num+"  ,  "+categoryId);
							 }
							 }); */
						}
					});
		}
	</script>
</body>
</html>