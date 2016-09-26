<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./check_admin.jsp"%>
<html>
<head>
<!-- CSS导入 -->
<link type="text/css" href="<%=path%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="<%=path%>/css/admin_page.css"
	rel="stylesheet">
<!-- 图标 -->
<link rel="icon" type="image/x-icon"
	href="<%=path%>/images/index_64.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/index_256.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增管理员</title>
</head>
<body style="background-color: aliceblue;">
	<div style="text-align: center">
		<h2>客户新增</h2>
	</div>
	<br>
	<br>
	<div class="container">

		<div class="row features">
			<div class="col-md-12">
				<form action="<%=path%>/user/do_add_user.html" method="post">
					<!-- 注册框 -->
					<div class="col-md-12"
						style="margin: 0 auto; font-family: cursive; font-size: 20px;">
						<!-- 提示消息 -->
						<div class="col-md-12">
							<h4>
								<font color="red">${requestScope.user_info}</font>
							</h4>
						</div>
						<br />
						<div class="col-md-6">
							用户名:<span style="color: red; font-family: arial;">*</span> <br />
							<input required name="userName" type="text" /><br /> 密码:<span
								style="color: red; font-family: arial;">*</span> <br /> <input
								required name="userPassword" type="text" value="123456" /><br />
							车牌号:<span style="color: red; font-family: arial;">*</span> <br />
							<input required type="text" name="userNo" />
						</div>


						<div class="col-md-6">
							电话:<br /> <input name="userTel" type="number" /><br /> 里程数(KM)<span
								style="color: red; font-family: arial;">*</span> <br /> <input
								required name="userMile" type="text" /><br /> 单位:<br /> <input
								name="userUnit" type="text" /><br />
						</div>

					</div>
					<div class="row features col-md-12" style="height: 50px;"></div>
					<div class="col-md-12">
						<div class="col-md-8 text-center ">
							<button type="reset" class="btn btn-default"
								style="font-size: 20px;">清空</button>
							&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-default"
								style="font-size: 20px;">添加</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- JS导入 -->
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>