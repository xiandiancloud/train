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

	<jsp:include page="common/header.jsp"></jsp:include>
	<div class="container">
		<div class="clear"></div>
		<div class="clear"></div>
		<div class="row">
			<div class="col-sm-12 hh">
				<ul class="nav nav-pills nav-justified" role="tablist">
					<li role="presentation" class="active"><a href="#">实训</a></li>
					<li role="presentation" class=""><a
						href="getSchedule.action?courseId=${courseId}">进度</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>

		<div class="row panel panel-default">
			<%-- <div class="col-sm-3 nospace">

				<div class="panel-group" id="accordion">
					<c:forEach var="chapter" items="${course.chapters}">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#chapter${chapter.id}">${chapter.name}</a>
								</h4>
							</div>
							<div id="chapter${chapter.id}" class="panel-collapse collapse">
								<c:forEach var="sequential" items="${chapter.sequentials}">
									<div class="panel-body" id="sequential${sequential.id}">
										<a
											href="getCourse.action?courseId=${courseId}&sequentialId=${sequential.id}">${sequential.name}</a>
									</div>
									<c:if test="${sequential.id==sequentialId}">
										<script>
										//var result = "#sequential${sequential.id}"; 
										//alert("#chapter${chapter.id}");
										$("#sequential${sequential.id}").addClass("menu");
										$("#chapter${chapter.id}").addClass("in");
										
										</script>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>

			</div> --%>

			<div class="col-sm-12">
				<div class="clear"></div>
				<div class="">
					<c:forEach var="vt" items="${vertical}" varStatus="status">
						<div class="" id="vt${vt.id}">
							<c:forEach var="train" items="${vt.trainList}" varStatus="steps">
								<c:if test="${train.envname!=null && train.envname!=''}">
									<p>${steps.count}.&nbsp;${train.envname}</p>
									<p class="trainleft">${train.preContent}</p>
									<p class="trainleft">
										<button type="button" class="btn btn-primary"
											id="${vt.id}prebutton${train.id}"
											onclick="javascript:createServer(${courseId},${vt.id},${train.id})">申请</button>
										<img src="images/Loading.gif" id="${vt.id}preimg${train.id}"
											style="display:none;" />
									</p>
									<p class="trainleft" id="preresult">
									<table class="table">
										<caption>VM信息</caption>
										<tbody>
											<tr class="active">
												<td>虚拟机IP</td>
												<td>虚拟机登录名称</td>
												<td>虚拟机密码</td>
												<td>虚拟机URL地址</td>
												<!-- <td>SSH Key</td> -->
											</tr>
											<tr class="danger">
												<td><label id="${vt.id}preip${train.id}">&nbsp;</label></td>
												<td><label id="${vt.id}envname${train.id}">&nbsp;</label></td>
												<td><label id="${vt.id}prepwd${train.id}">&nbsp;</label></td>
												<td><a id="${vt.id}preurl${train.id}" href=""
													target="_blank">&nbsp;</a></td>
												<!-- <td>&nbsp;</td> -->
											</tr>
										</tbody>
									</table>
									</p>

								</c:if>
								<c:if test="${train.conName!=null && train.conName!=''}">
									<p>${steps.count}.&nbsp;${train.conName}</p>
									<p class="trainleft">${train.conContent}</p>
									<p class="trainleft">
										<button type="button" class="btn btn-primary"
											onclick="javascript:myshell(${courseId},'${train.conShell}',${vt.id},${train.id})">提交</button>
										<img src="images/Loading.gif" id="${vt.id}conimg${train.id}"
											style="display:none;" />
									</p>
									<p>
									<form role="form">
										<div class="form-group trainleft">
											<label for="name">实训检测：</label>
											<textarea class="form-control autoh" rows="5"
												id="${vt.id}con${train.id}"></textarea>
											<%-- <textarea id="${vt.id}con${train.id}" rows=3 cols=40
												style='overflow:scroll;overflow-y:hidden;;overflow-x:hidden'
												onfocus="window.activeobj=this;this.clock=setInterval(function(){activeobj.style.height=activeobj.scrollHeight+'px';},200);"
												onblur="clearInterval(this.clock);"></textarea> --%>
										</div>
									</form>
									</p>
									<p class="trainleft">
										实训结果：<label id="${vt.id}conre${train.id}"></label>
									</p>
								</c:if>
								<c:if test="${train.garName!=null && train.garName!=''}">
									<p>${steps.count}.&nbsp;${train.garName}</p>
									<p class="trainleft">${train.garContent}</p>
									<p class="trainleft">
										<button type="button" class="btn btn-primary"
											onclick="javascript:delServer(${courseId},${vt.id},${train.id})">回收资源</button>
										<img src="images/Loading.gif" id="${vt.id}garimg${train.id}"
											style="display:none;" />
									</p>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
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
		});
		
		function mycarousel(element,id)
		{
			//$(".btn-default").removeClass("active");
			$("#myCarousel").carousel(id);
		}
		
		function createServer(courseId,vid,id)
		{
			$("#"+vid+"preimg"+id).show();
			var data = {courseId:courseId};
			$.ajax({
				url:"createServer.action",
				type:"post",
				data:data,
				success:function(s){
					//conid,conreid
					var a=eval("("+s+")");
					$("#"+vid+"preimg"+id).hide();
					if ("nouser" == a.user)
					{
						alert("你还没有登录");
					}
					else if ("error" == a.user)
					{
						alert("创建虚拟机出错，请联系系统管理员");
					}
					else if ("hasone" == a.user)
					{
						//alert("你已经创建虚拟机");
						$("#"+vid+"prebutton"+id).attr("disabled",true); 
						$("#"+vid+"preip"+id).html(a.hostname);
						$("#"+vid+"envname"+id).html(a.username);
						$("#"+vid+"prepwd"+id).html(a.password);
						var url = "http://10.172.20.10/dashboard/admin/instances/"+a.url+"/detail";
						$("#"+vid+"preurl"+id).html(a.url);
						$("#"+vid+"preurl"+id).attr("href",url);
					}
					else
					{
						$("#"+vid+"prebutton"+id).attr("disabled",true); 
						$("#"+vid+"preip"+id).html(a.hostname);
						$("#"+vid+"envname"+id).html(a.username);
						$("#"+vid+"prepwd"+id).html(a.password);
						var url = "http://10.172.20.10/dashboard/admin/instances/"+a.url+"/detail";
						$("#"+vid+"preurl"+id).html(a.url);
						$("#"+vid+"preurl"+id).attr("href",url);
					}
				}
			});
		}
		
		function delServer(courseId,vid,id)
		{
			$("#"+vid+"garimg"+id).show();
			var data = {courseId:courseId};
			$.ajax({
				url:"delServer.action",
				type:"post",
				data:data,
				success:function(s){
					//conid,conreid
					var a=eval("("+s+")");	
					$("#"+vid+"garimg"+id).hide();
					if ("nouser" == a.user)
					{
						alert("你还没有登录");
					}
					else if ("error" == a.user)
					{
						alert("删除虚拟机出错，请联系系统管理员");
					}
					else
					{
						$("#"+vid+"prebutton"+id).attr("disabled",false); 
						alert("你已经删除虚拟机");
					}
				}
			});
		}
		function myshell(courseId,path,vid,id)
		{
			$("#"+vid+"conimg"+id).show();
			var data = {courseId:courseId,path:path,id:id,vid:vid};
			$.ajax({
				url:"myshell.action",
				type:"post",
				data:data,
				success:function(s){
					//conid,conreid
					var a=eval("("+s+")");	
					$("#"+vid+"conimg"+id).hide();
					if ("nouser" == a.user)
					{
						alert("你还没有登录");
					}
					else if ("error" == a.user)
					{
						alert("提交出错，请联系系统管理员");
					}
					else
					{
						var reg=new RegExp("</br>","g"); //创建正则RegExp对象 
						var newstr=a.result.replace(reg,"\r\n");   
						$("#"+vid+"con"+id).val(newstr);
						$("#"+vid+"conre"+id).html(a.sucess);
					}
				}
			});
		}
	</script>
</body>
</html>