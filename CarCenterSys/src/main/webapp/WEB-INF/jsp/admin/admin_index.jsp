<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./check_admin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>框架首页</title>
</head>
<body style="min-height: 597px;min-width: 800px;background-color: aliceblue;">
<div style="text-align: center;">
	<h2>帮 助 文 档</h2>
</div>
<div style="font-size: 16px;position: relative;">
	1.系统监听服务器数据变化,默认为5分钟访问一次<br />
	<br/>
	2.采用异步js处理,获取服务器端数据最新变化<br/>
	<br/>
	3.采用jajax获取json数据
	<br />
	<br />
	4.保证数据安全,在前端校验.服务器端再次检验.
	<br />
	<br />
	5.select自动提交,并保持选择的值
	<br />
	<br />
	6.模拟select下拉列表,进行关联输入组件的name值
	<br />
	<br />
	7.前端添加简单数据校验
	<br />
	<br />
	8.其他一些小细节.....
	
</div>



	<!-- JS导入 -->
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>