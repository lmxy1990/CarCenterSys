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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 图标 -->
<link rel="icon" type="image/x-icon"
	href="<%=path%>/images/index_64.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/index_256.ico" />
<title>天乐汽修管理系统</title>
</head>
<body>
	<!-- 头部 -->
	<div style="text-align: center" class="hidden-print">
		<font color="red" size="48">天 乐</font>&nbsp;&nbsp;<font
			color="darkcyan" size="48">汽 修</font> <br />
		<div style="width: 122px; margin-right: 10px; margin-left: auto;">
			<span style="color: red; font-size: 20px;">后台管理系统</span>
		</div>
	</div>
	<!-- 导航栏 -->
	<div class="list hidden-print" style="width: 260px;">
		<ul>
			<li class="list-group-item active"><a style="font-size: 18px;"
				href="<%=path%>/admin/adminPage.html">天乐汽修后台管理系统</a></li>
			<li class="list-group-item"><a href="javascript:void(0);"
				class="inactive">订单管理 &nbsp;</a>
				<ul style="display: none">
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/add_order.html" target="view_panel">新增订单
					</a></li>
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/repair_list.html" target="view_panel">在修订单</a></li>

					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/order_info.html" target="view_panel">订单查询</a></li>
				</ul></li>
			<li class="list-group-item"><a style="font-size: 14px;"
				href="<%=path%>/admin/reserve_info.html" target="view_panel">预约信息
					&nbsp;<span class="badge reserve_info"
					style="background-color: #FF3366"></span>
			</a></li>
			<li class="list-group-item"><a href="javascript:void(0);"
				class="inactive">客户管理</a>
				<ul style="display: none">
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/add_user.html" target="view_panel">新增客户</a></li>
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/user_info.html" target="view_panel">客户查询管理</a></li>
				</ul></li>
			<li class="list-group-item"><a href="javascript:void(0);"
				class="inactive">消费条目</a>
				<ul style="display: none">
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/add_service.html" target="view_panel">新增消费条目</a></li>
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/service_info.html" target="view_panel">消费条目管理</a></li>
				</ul></li>
			<li class="list-group-item"><a href="javascript:void(0);"
				class="inactive">系统管理</a>
				<ul style="display: none">
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/add_admin.html" target="view_panel">新增管理员</a></li>
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/admin_info.html" target="view_panel">管理员信息管理</a></li>
					<li class="list-group-item"><a style="font-size: 14px;"
						href="<%=path%>/admin/exit_system.html" target="_top">退出系统</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- 框架 -->
	<iframe name="view_panel" frameborder="0" scrolling="no"
		src="<%=path%>/admin/admin_index.html"></iframe>
	<!-- JS导入 -->
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/admin_page.js"></script>
	<script type="text/javascript" src="<%=path%>/js/select_reserve_sum.js"></script>
</body>
</html>