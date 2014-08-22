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

<title>后台管理</title>

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
	<div class="h50"></div>
	<div class="clear"></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="list-group">
					<a href="admin.action?index=1"
						class="list-group-item list-group-item-primary <c:if test='${adminindex == 1}'>active</c:if>">增加分类
					</a> <a href="admin.action?index=2"
						class="list-group-item list-group-item-primary <c:if test='${adminindex == 2}'>active</c:if>">增加学校</a>
					<a href="admin.action?index=3"
						class="list-group-item list-group-item-primary <c:if test='${adminindex == 3}'>active</c:if>">增加专业</a>
				</div>
			</div>
			<c:if test="${adminindex == 1}">
				<div class="col-sm-9 panel panel-default">
					<div class="">
						<div class="h10"></div>
						<ul class="nav nav-pills">
							<li class="active"><a href="javascript:void(0);"
								onclick="showdialog();">增加课程分类</a></li>
						</ul>
						<div class="h10"></div>
						<table class="table table-bordered table-hover h5">
							<caption></caption>
							<thead>
								<tr class="setback">
									<th>课程分类名称</th>
									<th>课程分类描述</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="category" items="${categorylist}">
									<tr>
										<td>${category.name}</td>
										<td>${category.describle}</td>
										<td><a href="delcategory.action?id=${category.id}"
											class="glyphicon glyphicon-trash"></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${adminindex == 2}">
				<div class="col-sm-9 panel panel-default">
				</div>

			</c:if>
			<c:if test="${adminindex == 3}">
				<div class="col-sm-9 panel panel-default">
				</div>
			</c:if>
		</div>
	</div>

	<jsp:include page="common/footer.jsp"></jsp:include>

	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">课程分类</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="cname" class="col-sm-2 control-label"><h4>名称</h4></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="cname">
							</div>
						</div>
						<div class="form-group">
							<label for=cdesc class="col-sm-2 control-label"><h4>描述</h4></label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="5" id="cdesc"></textarea>
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="createcategory();">增加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- 	<script src="js/jquery-1.11.1.js"></script>	
	<script src="js/bootstrap.min.js"></script> -->
	<script>
		function showdialog() {
			$('#myModal').modal({
				keyboard : false
			});
		}

		function isNull( str ){
			if ( str == "" ) return true;
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			return re.test(str);
		} 

		function createcategory() {
			var name = $("#cname").val();
			if (isNull(name))	
			{					
				alert("名称不能为空");
				return ;
			}	
			var describle = $("#cdesc").val();
			var data = {				
				name : name,
				describle : describle
			};
			$.ajax({
				url : "saveCategory.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if (a.sucess == "sucess") {
						location.href = "admin.action?index=1";
					}
				}
			});
		}
	</script>
</body>
</html>