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
<title>预约信息查询</title>
</head>
<body style="background-color: aliceblue;">
	<table class="table table-bordered">
		<caption>
			管理员信息变更
			<!-- 提示消息 -->
			<font color="red">${admin_info}</font>
		</caption>
		<thead>
			<tr>
				<th>帐号</th>
				<th>真实姓名</th>
				<th>权限</th>
				<th colspan="2">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${sessionScope.admin.adminPower==0}">
				<tr>
					<td><c:out value="${sessionScope.admin.adminName}"></c:out></td>
					<td><c:out value="${sessionScope.admin.adminRealName}"></c:out></td>
					<td><c:if test="${sessionScope.admin.adminPower==1}">超级管理员</c:if>
						<c:if test="${sessionScope.admin.adminPower==0}">普通管理员</c:if></td>
					<td colspan="2"><a href="#" data-toggle="modal"
						onclick='modify("
						<c:out value = "${sessionScope.admin.id}"></c:out>")'
						data-target="#modify">修改</a></td>
				</tr>
			</c:if>
			<c:if test="${sessionScope.admin.adminPower==1}">
				<c:forEach items="${requestScope.admin_list}" var="adminList">
					<tr>
						<td><c:out value="${adminList.adminName}"></c:out></td>
						<td><c:out value="${adminList.adminRealName}"></c:out></td>
						<td><c:if test="${adminList.adminPower==1}">超级管理员</c:if> <c:if
								test="${adminList.adminPower==0}">普通管理员</c:if></td>
						<td><a href="#" data-toggle="modal" data-target="#modify"
							onclick='modify("<c:out value="${adminList.id}"></c:out>")'>修改</a></td>
						<td><a
							href='<%=path%>/admin/del_admin.html?id=<c:out value="${adminList.id}"></c:out>'>删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<!-- 数据修改模态 -->
	<div class="modal fade" id="modify" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">管理员信息修改</h4>
				</div>
				<form class="form-horizontal" role="form"
					action="<%=path%>/admin/modify_admin.html" method="post">
					<div class="modal-body">
						<div style="width: 400px; margin: 0 auto;">
							<font color="red">只填写需要变更的信息!</font> <input id="modifyId"
								name="id" type="number" class="hidden" hidden="hidden" />
							<div class="form-group">
								<label for="adminName" class="col-sm-4 control-label">新
									账 号:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="adminName"
										placeholder="请输入新的帐号" name="adminName">
								</div>
							</div>
							<div class="form-group">
								<label for="adminPassword" class="col-sm-4 control-label">密&nbsp;&nbsp;码:</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="adminPassword"
										placeholder="请输入新的密码" name="adminPassword">
								</div>
							</div>
							<div class="form-group">
								<label for="adminPasswordRepeat" class="col-sm-4 control-label">重复密码:</label>
								<div class="col-sm-8">
									<input type="password" class="form-control"
										id="adminPasswordRepeat" placeholder="请输入新的密码"
										name="adminPasswordRepeat">
								</div>
							</div>
							<div class="form-group">
								<label for="adminRealName" class="col-sm-4 control-label">真实姓名:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="adminRealName"
										placeholder="请输入需要变更的姓名" name="adminRealName">
								</div>
								<div class="form-group">
									<label for="adminRealName" class="col-sm-4 control-label">类型变更:</label>
									<div class="col-sm-8">
										<label class="checkbox-inline"> <input type="radio"
											name="adminPower" id="optionsRadios1" value="1" checked />超级管理员
										</label> <label class="checkbox-inline"> <input type="radio"
											name="adminPower" id="optionsRadios2" value="0" />普通管理员
										</label>
									</div>
								</div>
								<br />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">提交更改</button>
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
	<script type="text/javascript" src="<%=path%>/js/modify.js"></script>
</body>
</html>