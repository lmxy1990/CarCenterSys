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
		<h2>管理员新增</h2>
	</div>
	<br>
	<br>
	<c:if test="${sessionScope.admin.adminPower==0}">
		<div style="text-align: center">
			<h3 style="color: red">管新增管理员需要超级管理员权限,请退出系统使用超级管理员!</h3>
		</div>
	</c:if>
	<c:if test="${sessionScope.admin.adminPower==1}">
		<!-- 表单 -->
		<form class="form-horizontal" role="form"
			action="<%=path%>/admin/do_add_admin.html" method="post">
			<!-- 新增div -->
			<div style="width: 400px; margin: 0 auto;">
				<!-- 账号 -->
				<div class="form-group">
					<label for="adminName" class="col-sm-4 control-label"><span
						style="color: red; font-family: arial;">*</span>管理账号:</label>
					<div class="col-sm-8">
						<input required type="text" class="form-control" id="adminName"
							placeholder="请输入用户名" name="adminName">
					</div>
				</div>
				<!-- 密码 -->
				<div class="form-group">
					<label for="adminPassword" class="col-sm-4 control-label"><span
						style="color: red; font-family: arial;">*</span>密&nbsp;&nbsp;码:</label>
					<div class="col-sm-8">
						<input required type="password" class="form-control" id="adminPassword"
							placeholder="请输入密码" name="adminPassword">
					</div>
				</div>
				<!-- 重复密码 -->
				<div class="form-group">
					<label for="adminPasswordRepeat" class="col-sm-4 control-label"><span
						style="color: red; font-family: arial;">*</span>重复密码:</label>
					<div class="col-sm-8">
						<input required type="password" class="form-control"
							id="adminPasswordRepeat" placeholder="请输入密码"
							name="adminPasswordRepeat">
					</div>
				</div>
				<!-- 真实姓名 -->
				<div class="form-group">
					<label for="adminRealName" class="col-sm-4 control-label">真实姓名:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="adminRealName"
							placeholder="请输入真实姓名" name="adminRealName">
					</div>
				</div>
				<!-- 类型 -->
				<div class="form-group">
					<label for="adminRealName" class="col-sm-4 control-label">类&nbsp;&nbsp;型:</label>
					<div class="col-sm-8">
						<label class="checkbox-inline"> <input type="radio"
							name="adminPower" id="optionsRadios1" value="1" checked />超级管理员
						</label> <label class="checkbox-inline"> <input type="radio"
							name="adminPower" id="optionsRadios2" value="0" />普通管理员
						</label>
					</div>
				</div>
				<br />
				<!-- 提示消息 -->
				<div style="text-align: center">
					<font color="red">${admin_info}</font>
				</div>
				<br />
				<!-- 提交按钮 -->
				<div class="form-group">
					<div class="col-sm-offset-6 col-sm-6">
						<button type="submit" class="btn btn-default">新&nbsp;增</button>
					</div>
				</div>
			</div><!-- 输入框结束 -->
		</form><!-- 表单结束 -->
	</c:if><!-- 前台判断结束 -->

	<!-- JS导入 -->
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>