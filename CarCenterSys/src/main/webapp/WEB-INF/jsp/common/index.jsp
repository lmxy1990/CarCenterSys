<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="汽车4S店">
<meta name="author" content="pan">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 图标 -->
<link rel="icon" type="image/x-icon"
	href="<%=path%>/images/index_64.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/index_256.ico" />
<title>欢迎访问我们的网站</title>

<!-- Bootstrap 风格-->
<link href="<%=path%>/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="<%=path%>/skins/default.css" rel="stylesheet">
<link href="<%=path%>/css/animate.min.css" rel="stylesheet">
<link href="<%=path%>/css/icons/icons.css" rel="stylesheet">
<!-- 个人风格 -->
<link href="<%=path%>/css/style.css" rel="stylesheet">

</head>

<body>

	<!-- 导航 -->
	<div class="navbar navbar-color navbar-fixed-top" id="topnav">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon icon-reorder"></span>

				</button>
				<a class="navbar-brand" href="<%=path%>"><img
					src="<%=path%>/images/tianle_logo.png" height="25px" width="60px"
					alt="天乐汽修" /> </a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#home">主页</a></li>
					<li><a href="#services">服务</a></li>
					<c:if test="${sessionScope.user==null}">
						<li><a href="#load" data-toggle="modal"
							data-target="#user_load">登录</a></li>
						<li><a href="#register">注册</a></li>
					</c:if>
					<c:if test="${sessionScope.user!=null}">
						<li><a href="#" data-toggle="modal" data-target="#my_info">我的信息</a></li>
						<li><a href="<%=path%>/user/user_exit.html">退出</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<!-- 主页 -->
	<div class="jumbotron" id="home">
		<div class="intro">
			<div class="container">
				<div class="row" style="height: 70px;">
					<!-- 调整字位置 -->
				</div>
				<div class="row">
					<h1 class="text-center">
						天乐 <span>汽修</span>
					</h1>

					<p class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您的爱车维护专家!</p>
					<br />
				</div>
				<div class="row triangles" style="height: 150px;">
					<!-- 留白,以后考虑添加必要的元素 -->
				</div>
			</div>
		</div>
	</div>
	<br />
	<!-- 服务 -->
	<section id="services">
		<div class="container">
			<!-- 内部元素 -->
			<div class="row features">
				<div class="col-md-12 text-center">
					<h2 style="font-family: cursive;">About Tian Le</h2>

					<p style="font-size: 18px; font-family: monospace;">
						天乐汽修:专业平台,缔造最舒适的体验!<br /> 一站式服务,方便! 快捷! 口碑! 您理想的抉择!
					</p>
				</div>
			</div>
			<div class="row features col-md-12" style="height: 100px;"></div>
			<div class="row features">
				<div class="col-lg-2 col-sm-4"></div>
				<div class="col-lg-2 col-sm-4"></div>
				<!-- 我的订单 -->
				<div class="col-lg-2 col-sm-4">
					<c:if test="${sessionScope.user!=null}">
						<div class="hexicon">
							<a
								href="<%=path%>/user/user_order.html?userId=<c:out value='${sessionScope.user.id}'/>&page=1&userName=<c:out value='${sessionScope.user.id}'/>&stateId=1"
								target="_blank" class="inicon retina"></a>
						</div>
					</c:if>
					<c:if test="${sessionScope.user==null}">
						<div class="hexicon">
							<a href="#" data-toggle="modal" data-target="#alert_info"
								class="inicon retina"></a>
						</div>
					</c:if>
					<div class="text-center">
						<h3>我的订单</h3>
					</div>
				</div>
				<!-- 预订服务 -->
				<div class="col-lg-2 col-sm-4">
					<div class="hexicon">
						<c:if test="${sessionScope.user!=null}">
							<a href="#" data-toggle="modal" data-target="#reserve_shopping"
								class="inicon shopping"></a>
						</c:if>
						<c:if test="${sessionScope.user==null}">
							<a href="#" data-toggle="modal" data-target="#alert_info"
								class="inicon shopping"></a>
						</c:if>
					</div>
					<div class="text-center">
						<h3>预约服务</h3>
					</div>
				</div>
				<div class="col-lg-2 col-sm-4"></div>
				<div class="col-lg-2 col-sm-4"></div>
			</div>
		</div>
		<div class="row features col-md-12" style="height: 100px;"></div>
	</section>
	<!-- 注册 -->
	<c:if test="${sessionScope.user==null}">
		<section id="register">
			<div class="container">

				<div class="row features">
					<div class="col-md-12">
						<!-- 标题 -->
						<div class="col-md-12">
							<h2>欢迎注册:</h2>
						</div>
						<form action="<%=path%>/user/do_user_register.html" method="post">
							<!-- 注册框 -->
							<div class="col-md-12"
								style="margin: 0 auto; font-family: cursive; font-size: 20px;">
								<!-- 提示消息 -->
								<div class="col-md-12">
									<h4>
										<span id="register_info">${requestScope.register_info}</span>
									</h4>
								</div>
								<br />
								<div class="col-md-6">
									用户名:<span style="color: red; font-family: arial;">*</span> <br />
									<input required name="userName" type="text" /><br /> 密码:<span
										style="color: red; font-family: arial;">*</span> <br /> <input
										required name="userPassword" type="password" /><br /> 重复密码:<span
										style="color: red; font-family: arial;">*</span> <br /> <input
										required name="userPasswordRepeat" type="password" /><br />
									车牌号:<span style="color: red; font-family: arial;">*</span> <br />
									<input required type="text" name="userNo" />
								</div>


								<div class="col-md-6">
									电话:<br /> <input name="userTel" type="text" /><br /> 行驶里程<span
										style="color: red; font-family: arial;">*</span>:<br /> <input
										required name="userMile" type="text" /><br /> 单位:<br /> <input
										name="userUnit" type="text" /><br />
								</div>

							</div>
							<div class="col-md-12">
								<div class="col-md-6"></div>
								<div class="col-md-6 " align="right">
									<button type="submit" class="btn btn-primary"
										style="font-size: 20px;">注册</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row features col-md-12" style="height: 150px;"></div>
			</div>
		</section>
	</c:if>
	<!-- 登录 -->
	<div class="modal fade" id="user_load" tabindex="0" role="dialog"
		aria-labelledby="user_" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="<%=path%>/user/do_user_login.html" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="user_">登录</h3>
					</div>
					<div class="modal-body">
						<div style="font-size: 20px; width: 185px; margin: 0 auto;">
							用户名:<br /> <input class="form-control" name="userName"
								type="text" /> <br /> 密码:<br /> <input class="form-control"
								name="userPassword" type="password" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary"
							style="font-size: 20px;">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 我的信息 -->
	<c:if test="${sessionScope.user!=null}">
		<div class="modal fade" id="my_info" tabindex="0" role="dialog"
			aria-labelledby="user_" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="user_">我的信息</h3>
					</div>
					<div class="modal-body" style="font-size: 24px;">
						<div style="width: 264px; margin: 0 auto;">

							用户名:
							<c:out value="${sessionScope.user.userName}" />
							<br /> <br /> 车牌号码:
							<c:out value="${sessionScope.user.userNo}" />
							<br /> <br /> 行驶里程数:
							<c:out value="${sessionScope.user.userMile}" />
							<br /> <br /> 电话:
							<c:out value="${sessionScope.user.userTel}" />
							<br /> <br /> 单位:
							<c:out value="${sessionScope.user.userUnit}" />
							<br /> <br /> <br />
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 提示用户登录或注册 -->
	<div class="modal fade" id="alert_info" tabindex="0" role="dialog"
		aria-labelledby="user_" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="user_">抱歉,</h3>
				</div>
				<div class="modal-body">
					<span>您需要登录/注册!</span>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- 预约服务 -->
	<div class="modal fade" id="reserve_shopping" tabindex="0"
		role="dialog" aria-labelledby="user_" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="user_">预约</h3>
				</div>
				<!-- 需要提交的表单 -->
				<form class="form-horizontal" role="form"
					action="<%=path%>/user/user_do_reserve.html" method="post">
					<div class="modal-body">
						<div style="width: 400px; margin: 0 auto;">
							<!-- 用户 -->
							<input value=<c:out value="${sessionScope.user.id}" /> required
								name="userId" type="number" class="hidden" hidden="hidden" />
							<!-- 管理员 -->
							<input required name="adminId" type="number" class="hidden"
								hidden="hidden" value="1" /> <br />
							<!-- 服务项目 -->
							<div class="form-group">
								<label for="serviceId" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>服务项目:</label>
								<div class="col-sm-8">
									<select class="form-control" id="serviceId" name="serviceId">
										<c:forEach items="${requestScope.service_list}"
											var="serviceList">
											<option value='<c:out value="${serviceList.id}" />'><c:out
													value="${serviceList.serviceName}" /></option>
										</c:forEach>
									</select>
								</div>
							</div>

							<!-- 实际价格 -->
							<div class="form-group hidden hidden-print">
								<div class="col-sm-8">
									<input type="number" class="form-control " name="realPrice"
										value="0" />
								</div>
							</div>

							<!-- 服务价格 -->
							<div class="form-group">
								<label for="servicePrice" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>服务价格:</label>
								<div class="col-sm-8">
									<select disabled="disabled" class="form-control"
										style="font-family: '宋体';" id="servicePrice">
										<c:forEach items="${requestScope.service_list}"
											var="serviceList">
											<option value='<c:out value="${serviceList.id}" />'><c:out
													value="${serviceList.servicePrice}" /></option>
										</c:forEach>
									</select>
								</div>
							</div>

							<!-- 订单状态 -->
							<div class="form-group">
								<!-- 后台增加的状态都是预约状态 -->
								<input class="hidden" type="number" name="stateId" value="1" />
							</div>


							<!-- 备注 -->
							<div class="form-group">
								<label for="remarks" class="col-sm-4 control-label">备注:</label>
								<div class="col-sm-8">
									<textarea class="form-control" id="remarks"
										placeholder="请输入备注信息..." name="remarks"></textarea>
								</div>
							</div>

							<!-- 消费日期 -->
							<div class="form-group">
								<label for="consumeTime" class="col-sm-4 control-label">预约日期:</label>
								<div class="col-sm-8">
									<input required type="datetime-local"
										class="form-control consumeTime" id="consumeTime"
										name="consumeTime" />
								</div>
							</div>


						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 底部 -->
	<br />
	<br />
	<br />
	<footer>
		<div class="footer-copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<a class="logo" href="<%=path%>/index.html"> <img
							src="<%=path%>/images/author_logo.png" alt="pan" />
						</a>
					</div>
					<div class="col-md-8">
						<p align="center">&copy; Copyright 2016 by pan. All Rights
							Reserved.</p>
					</div>
					<div class="col-md-2">
						<nav id="footer-menu">
							<ul>
								<li><a href="http://my.oschina.net/sdkfz" target="_blank">my
										blog</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- ================================================== -->
	<!-- Bootstrap core JavaScript-->
	<script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/date.js"></script>
	<script src="<%=path%>/js/index.js"></script>
	<script src="<%=path%>/js/servicePrice_select.js"></script>
</body>
</html>
