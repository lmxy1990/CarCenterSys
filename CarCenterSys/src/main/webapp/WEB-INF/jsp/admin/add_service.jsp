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
<title>消费信息管理</title>
</head>
<body style="background-color: aliceblue;">
	<div style="text-align: center">
		<h2>消费项目新增</h2>
	</div>
	<br>
	<br>
	<div>
		<form class="form-horizontal" role="form"
			action="<%=path%>/admin/do_add_service.html" method="post">
			<div style="width: 400px; margin: 0 auto;">
			
			
				<div class="form-group">
					<label for="serviceName" class="col-sm-4 control-label"><span
						style="color: red; font-family: arial;">*</span>消费名称:</label>
					<div class="col-sm-8">
						<input required type="text" class="form-control" id="serviceName"
							placeholder="请输入项目的名称" name="serviceName">
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="servicePrice" class="col-sm-4 control-label"><span
						style="color: red; font-family: arial;">*</span>消费价格:</label>
					<div class="col-sm-8">
						<input required type="number" class="form-control" id="servicePrice"
							placeholder="请输入项目的价格,面议请输入0" name="servicePrice">
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="adminRealName" class="col-sm-4 control-label"><span
						style="color: red; font-family: arial;">*</span>可以预约?:</label>
					<div class="col-sm-8">
						<label class="checkbox-inline"> <input  type="radio"
							name="canReserve" id="optionsRadios1" value="1" checked />是
						</label> <label class="checkbox-inline"> <input type="radio"
							name="canReserve" id="optionsRadios2" value="0" />否
						</label>
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="adminRealName" class="col-sm-4 control-label">详细描述:</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="serviceDescribe" cols="12" rows="8"
							placeholder="请输入这个项目的详细描述,字符控制在100个以内." name="serviceDescribe" ></textarea>
					</div>
				</div>

				<br />
				<!-- 提示消息 -->
				<div style="text-align: center">
					<font color="red">${service_info}</font>
				</div>
				<br />
				<div class="form-group">
					<div class="col-sm-offset-6 col-sm-6">
						<button type="submit" class="btn btn-default">新&nbsp;增</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- JS导入 -->
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>