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

<title>登录进入</title>

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
	<div class="container cpading">
		<div class="row  wback nospace">
			<div class="col-sm-12 hptop">
				</br>
				<h3>
					<p>
						<a>请登录</a>
					</p>
					<p class="left40">来访问你的实验</p>
				</h3>

			</div>
		</div>
		<div class="row  wback nospace">
			<hr>
			<div class="clear"></div>
			<div class="col-sm-8">
				<form role="form">
					<div class="form-group">
						<a>电子邮件&nbsp;*</a>
						<div class="h5"></div>
						<input type="text" class="form-control" id="email" placeholder="dhl@163.com">
						<div class="clear"></div>
						<a>密码&nbsp;*</a>
						<div class="h5"></div>
						<input type="password" class="form-control" id="password" placeholder="文本输入">
						<div class="clear"></div>
						<div class="clear"></div>
						<button type="button" class="btn btn-primary btn-lg btn-block" onclick="login();">
							登录+进入我的实验</button>
					</div>
				</form>
			</div>
			<div class="col-sm-4">
			<a>尚未注册？</a></br>
			<div class="clear"></div>
			<p>
			现在就注册加入<a href="toregeister.action">云实训平台</a> 
			</p>
			<div class="clear"></div>
			<a>需要帮助？</a></br>
			<div class="clear"></div>
			<p>
			寻找关于登录您的 云实训平台账户的帮助？<a>查看帮助部分来获得常见问题的解答。</a> 
			</p>
			</div>
		</div>
	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- 	<script src="js/jquery-1.11.1.js"></script>	
	<script src="js/bootstrap.min.js"></script> -->
	<script>
		$(function() {
			$('input').keypress(function (e) {
			    var key = e.which;
			    if (key == 13) {
			        login();
			    }
			});
		});
		
		function login()
		{
			var email = $("#email").val();
			var password = $("#password").val();
			//var url = "${url}";
			var data = {email:email,password:password};
			$.ajax({
				url:"login.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.href=a.toUrl;
						/*if (url)
						{
							location.href=url;
						}
						else
						location.href="mycourse.action";*/
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