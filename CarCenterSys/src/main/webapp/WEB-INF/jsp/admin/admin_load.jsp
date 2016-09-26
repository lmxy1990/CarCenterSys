<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String path = request.getContextPath() ;
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap 风格-->
<link href="<%=path%>/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- 图标 -->
<link rel="icon" type="image/x-icon"
	href="<%=path%>/images/index_64.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/index_256.ico" />
<title>后台登陆</title>
</head>
<body style="background-color: darkcyan;font-size: 20px;">
<!-- 高度 -->
	<div style="height:20%;"></div>
	<!-- 图片 -->
	<div style="width: 320px;margin: 0 auto">
		<img width="320px;" height="160px;" alt="登录" src="<%=path%>/images/admin_load_pic.gif" />
	</div>
	<!-- 登录框 -->
	<div style="width: 320px;margin: 0 auto;">
	<span style="color: red">${info_admin}</span>
	<form action="<%=path%>/admin/doLoad.html" method="post">
			<div class = "input-group" >
				<span class = "input-group-addon" style="font-size: 20px;">用户名:</span>
				<input style="font-size: 20px;" name="adminName" type="text" class="form-control" placeholder="帐号">
			</div>
			<br />
			<br />
			<div  class = "input-group">
				<span class = "input-group-addon" style="font-size: 20px;">密 &nbsp;&nbsp;码:</span>
				<input style="font-size: 20px;" name="adminPassword" type="password" class="form-control" placeholder="密码">
			</div>
			<br />
			<br />
			<br />
			<div style="width: 80px;margin: 0 auto;">
				<button type="submit" class="btn btn-primary" style="font-size: 20px;">Sign in</button>
			</div>
		</form>
	</div>
</body>
</html>