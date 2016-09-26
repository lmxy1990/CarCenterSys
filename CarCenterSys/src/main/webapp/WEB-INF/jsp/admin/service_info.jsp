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
<title>消费条目管理</title>
</head>
<body style="background-color: aliceblue;">
	<table class="table table-bordered">
		<caption>
			消费条目管理
			<!-- 提示消息 -->
			<font color="red">${service_info}</font>
		</caption>
		<thead>
			<tr>
				<th>消费名称</th>
				<th>消费价格</th>
				<th>是否支持预定</th>
				<th>描述</th>
				<th colspan="2">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.service_list}" var="serviceList">
				<tr>
					<td><c:out value="${serviceList.serviceName}"></c:out></td>
					<td>
						<c:if test="${serviceList.servicePrice=='0.00'}">面议</c:if>
						<c:if test="${serviceList.servicePrice!='0.00'}"><c:out value="${serviceList.servicePrice}"></c:out></c:if>
					</td>
					<td><c:if test="${serviceList.canReserve==1}">是</c:if> <c:if
							test="${serviceList.canReserve==0}">否</c:if></td>
					<td><c:out value="${serviceList.serviceDescribe}"></c:out></td>
					<td><a href="#" data-toggle="modal" data-target="#modify"
						onclick='modify("<c:out value="${serviceList.id}"></c:out>")'>修改</a></td>
					<td><c:if test="${sessionScope.admin.adminPower==1}">
							<a
								href='<%=path%>/admin/del_service.html?id=<c:out value="${serviceList.id}"></c:out>'>删除</a>
						</c:if></td>
				</tr>
			</c:forEach>
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
					<h4 class="modal-title" id="myModalLabel">消费项目信息修改</h4>
				</div>
				<form class="form-horizontal" role="form"
					action="<%=path%>/admin/do_service_modify.html" method="post">
					<div class="modal-body">
						<div style="width: 400px; margin: 0 auto;">
							<font color="red">只填写需要变更的信息!</font> <input id="modifyId"
								name="id" type="number" class="hidden" hidden="hidden" /> <br />
							<!-- 需要提交的表单 -->
							<div class="form-group">
								<label for="serviceName" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>消费名称:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="serviceName"
										placeholder="请输入项目的名称" name="serviceName">
								</div>
							</div>


							<div class="form-group">
								<label for="servicePrice" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>消费价格:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="servicePrice"
										placeholder="请输入项目的价格,面议请输入0" name="servicePrice">
								</div>
							</div>


							<div class="form-group">
								<label for="adminRealName" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>可以预订?:</label>
								<div class="col-sm-8">
									<label class="checkbox-inline"> <input type="radio"
										name="canReserve" id="optionsRadios1" value="1" checked />是
									</label> <label class="checkbox-inline"> <input type="radio"
										name="canReserve" id="optionsRadios2" value="0" />否
									</label>
								</div>
							</div>


							<div class="form-group">
								<label for="adminRealName" class="col-sm-4 control-label">详细描述:</label>
								<div class="col-sm-8">
									<textarea class="form-control" id="serviceDescribe" cols="12"
										rows="8" placeholder="请输入这个项目的详细描述,字符控制在100个以内."
										name="serviceDescribe"></textarea>
								</div>
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