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
	<div class="h30"></div>
	<div class="clear"></div>
	<div class="container">
		<div class="cmargin">
			<div class="clear"></div>
			<div class="row panel panel-default">
				<div class="col-sm-8">
					<img src="${course.imgpath}" alt="..." width="100%" height="200px;"
						class="img-rounded">
				</div>
				<div class="col-sm-4">
					<p>
					<h3>${course.name}</h3>
					</p>
					<c:if test="${buttonshow == 1}">
						<p>
						<h5>
							参加时间：<a id="dotime"></a>
						</h5>
						</p>
						<c:if test="${coursehaving == 0}">
						<p class="right ctop" id="">
							<button type="button" class="btn btn-warning" onclick="fcourse();">完成该课程</button>
						</p>
						</c:if>
						<c:if test="${coursehaving == 1}">
						<p class="right ctop" id="">
							<button type="button" class="btn btn-warning" onclick="acourse();">再来一次</button>
						</p>
						</c:if>
					</c:if>
					<c:if test="${buttonshow == 0}">
						<p class="right ctop">
							<a href="tocourse.action?courseId=${course.id}">
								<button type="button" class="btn btn-primary">参加该课程</button>
							</a>
						</p>
					</c:if>
				</div>
			</div>
			<c:if test="${buttonshow == 1}">
				<div class="clear"></div>
				<div class="row panel panel-default cback">
					<div class="col-sm-10">
						<div class="h10"></div>
						<div class="progress">
							<div
								class="progress-bar progress-bar-primary progress-bar-striped"
								role="progressbar" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100" style="width: 0%">
								<span class="sr-only"></span>
							</div>
						</div>
						<div>
							<h5>
								总共有<a id="alltext"></a>个实验，目前已完成<a id="protext"></a>个实验，加油啊！
							</h5>
						</div>
					</div>
					<div class="col-sm-2">
						<p class="right top20">
							<c:if test="${coursehaving == 0}">
								<a href="tocourse.action?courseId=${course.id}">
									<button type="button" class="btn btn-primary">继续学习</button>
								</a>
							</c:if>
						</p>
					</div>
				</div>
			</c:if>
			<div class="cmargin">
				<div class="row">
					<div class="col-sm-12">
						<c:forEach var="chapter" items="${course.chapters}">
							<div class="center">
								<h3>${chapter.name}</h3>
							</div>
							<%--<div class="panel nospace">
								 <div class="panel-heading">
									<h5 class="panel-title">
										<a data-toggle="collapse" href="#c${chapter.id}">
											<h5>${chapter.name}</h5>
										</a>
									</h5>
								</div> --%>
							<%-- <div id="c${chapter.id}" class="panel-collapse collapse in">
									<div class="panel-body nospace"> --%>

							<c:forEach var="sequential" items="${chapter.sequentials}">
								<div class="panel nospace wback">
									<div class="panel-heading">
										<h5 class="panel-title">
											<a data-toggle="collapse" href="#s${sequential.id}">
												<h5>${sequential.name}</h5>
											</a>
										</h5>
									</div>
									<div id="s${sequential.id}" class="panel-collapse collapse in">
										<div class="panel-body nospace">

											<c:forEach var="vertical" items="${sequential.verticals}">

												<div class="nospacebody">
													<div class="panel-heading vbody">
														<h5 class="panel-title">
															<a data-toggle="collapse" href="#v${vertical.id}">
																<h5 class="left40">${vertical.name}</h5>
															</a>
														</h5>
													</div>
													<div id="v${vertical.id}"
														class="panel-collapse collapse in">
														<div class="panel-body nospace">
															<c:if test="${!empty vertical.verticalTrains}">
																<c:forEach var="verticalTrains"
																	items="${vertical.verticalTrains}">
																	<div class="nospace wback">
																		<div class="panel-body left80 tbody">
																			<div class="divleft">
																				<h5 class="">${verticalTrains.train.name}</h5>
																			</div>
																			<c:if test="${buttonshow == 1}">
																				<div class="divright">
																					<%-- <a
																									href="tocourseone.action?courseId=${course.id}&verticalId=${vertical.id}&trainId=${verticalTrains.train.id}">
																									<button type="button" class="btn btn-success">进入学习</button>
																								</a> --%>
																					<c:if test="${coursehaving == 0}">
																					<form action="tocourseone.action" method="post">
																						<input type="hidden" value="${course.id}"
																							name="courseId" /> <input type="hidden"
																							value="${vertical.id}" name="verticalId" /> <input
																							type="hidden" value="${verticalTrains.train.id}"
																							name="trainId" />
																						<button type="submit" class="btn btn-primary">进入学习</button>
																					</form>
																					</c:if>
																				</div>
																			</c:if>
																		</div>
																	</div>
																</c:forEach>
															</c:if>

														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- </div>
								</div> 
							</div>-->
							<div class="h10"></div>
						</c:forEach>

					</div>
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
			//$('.progress-bar').css({'width':'80%'}).find('span').html('80%');
			var courseId = parseInt("${course.id}");
			var data = {
				courseId : courseId
			};
			$.ajax({
				url : "condition.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						var complete = a.complete;
						$("#alltext").html(a.allcounts);
						$("#protext").html(a.counts);

						$("#dotime").html(stotime(a.dotime));
						$('.progress-bar').css({
							'width' : complete
						}).find('span').html(complete);
					}
				}
			});
		});
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
		function fcourse()
		{
			var courseId = parseInt("${course.id}");
			var data = {
				courseId : courseId
			};
			$.ajax({
				url : "fcourse.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					
					if ("sucess" == a.sucess)
					{
						location.href="";
					}
				}
			});
		}
		function acourse()
		{
			var courseId = parseInt("${course.id}");
			var data = {
				courseId : courseId
			};
			$.ajax({
				url : "acourse.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess)
					{
						location.href="tocourse.action?courseId="+courseId;
					}
				}
			});
		}
	</script>
</body>
</html>