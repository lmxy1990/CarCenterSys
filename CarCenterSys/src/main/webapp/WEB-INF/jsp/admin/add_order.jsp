<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./check_admin.jsp"%>
<html>
<head>
<!-- CSS导入 -->
<link type="text/css" href="<%=path%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 图标 -->
<link rel="icon" type="image/x-icon"
	href="<%=path%>/images/index_64.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/index_256.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增订单</title>
</head>
<body style="background-color: aliceblue;">
	<br />
	<div class="row " style="width: 500px; height: 34px;">
		<div class="col-sm-4" style="width: 380px;">
			<!-- 表单 -->
			<form action="<%=path%>/admin/order_select_user.html" method="post">
				<div class="input-group " style="width: 350px;">
					<div class="btn-group input-group-btn">
						<button id="select" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							用户名 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#" class="select-item">用户名</a></li>
							<li><a href="#" class="select-item">车牌号</a></li>
						</ul>
					</div>
					<input style="width: 165px;" required type="text"
						class="form-control " id="inputKey" name="userName"
						placeholder="请输入需要查询的用户名....">
					<div class="input-group-btn">
						<button class="btn btn-success" type="submit">查询用户</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-2" style="width: 100px;">
			<a href="<%=path%>/admin/order_select_all_user.html"
				class="btn btn-primary ">查询全部</a>
		</div>
	</div>
	<table class="table table-hover table-bordered">
		<caption>
			<!-- 提示消息 -->
			<font color="red">${order_info}</font><br /> 用户列表
		</caption>
		<thead>
			<tr>
				<th>用户名</th>
				<th>电话</th>
				<th>车牌号</th>
				<th>里程数(KM)</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.user_list}" var="userList">
				<tr>
					<td><c:out value="${userList.userName}"></c:out></td>
					<td><c:out value="${userList.userTel}"></c:out></td>
					<td><c:out value="${userList.userNo}"></c:out></td>
					<td><c:out value="${userList.userMile}"></c:out></td>
					<c:if test="${sessionScope.admin.adminPower!=null}">
						<td><a href="#" data-toggle="modal"
							data-target="#add_reserve"
							onclick='modify("<c:out value="${userList.id}"></c:out>")'>新增订单</a></td>
					</c:if>
					<c:if test="${sessionScope.admin.adminPower==null}">
						<td>权限不足</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 订单新增模态 -->
	<div class="modal fade" id="add_reserve" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增消费记录</h4>
				</div>
				<!-- 需要提交的表单 -->
				<form class="form-horizontal" role="form"
					action="<%=path%>/admin/do_add_order.html" method="post">
					<div class="modal-body">
						<div style="width: 400px; margin: 0 auto;">
							<!-- 用户 -->
							<input required id="modifyId" name="userId" type="number"
								class="hidden" hidden="hidden" />
							<!-- 管理员 -->
							<input required name="adminId" type="number" class="hidden"
								hidden="hidden"
								value='<c:out value="${sessionScope.admin.id}" />' /> <br />
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
							<div class="form-group">
								<label for="realPrice" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>服务价格:</label>
								<div class="col-sm-8">
									<input required type="number" class="form-control"
										id="realPrice" placeholder="请输入价格..." name="realPrice" />
								</div>
							</div>

							<!-- 订单状态 -->
							<div class="form-group">
								<!-- 后台增加的状态都是在修状态 -->
								<input class="hidden" type="number" name="stateId" value="2" />
								<%--
								<label for="stateId" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>订单状态:</label>
								<div class="col-sm-8">
									<select class="form-control" name="stateId" id="stateId">
										<c:forEach items="${requestScope.state_list}" var="stateList">
											<option value='<c:out value="${stateList.id}" />'><c:out
													value="${stateList.stateName}" /></option>
										</c:forEach>
									</select>
								</div>
								 --%>
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
								<label for="consumeTime" class="col-sm-4 control-label">维修日期:</label>
								<div class="col-sm-8">
									<input required type="datetime-local" class="form-control consumeTime"
										id="consumeTime" name="consumeTime" />
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
	<!-- 分页 -->

	<div style="width: 100%; position: absolute; bottom: 15px;"
		align="center">
		<!-- 如果页面大于5 -->
		<c:if test="${requestScope.user_pages.pageSum>5}">
			<ul class="pagination">
				<c:if test="${requestScope.user_pages.currentPage>1}">
					<li><a
						href="<%=path%>/admin/order_select_all_user.html?page=<c:out value="${requestScope.user_pages.currentPage-1}" />">&laquo;</a></li>
				</c:if>
				<%--如果当前页面之后的页面数量大于5 --%>
				<c:if
					test="${requestScope.user_pages.currentPage+4<=requestScope.user_pages.pageSum}">
					<c:forEach begin="${requestScope.user_pages.currentPage}"
						end="${requestScope.user_pages.currentPage+4}" var="page_i">
						<li><a
							href="<%=path%>/admin/order_select_all_user.html?page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<%--如果当前页面之后的页面数量小于5 --%>
				<c:if
					test="${requestScope.user_pages.currentPage+4>requestScope.user_pages.pageSum}">
					<c:forEach begin="${requestScope.user_pages.currentPage}"
						end="${requestScope.user_pages.pageSum}" var="page_i">
						<li><a
							href="<%=path%>/admin/order_select_all_user.html?page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<c:if
					test="${requestScope.user_pages.currentPage<requestScope.user_pages.pageSum}">
					<li><a
						href="<%=path%>/admin/order_select_all_user.html?page=<c:out value="${requestScope.user_pages.currentPage+1}" />">&raquo;</a></li>
				</c:if>
			</ul>
		</c:if>
		<!-- 如果页面小于5 -->
		<c:if test="${requestScope.user_pages.pageSum<=5}" var="sum">
			<ul class="pagination">
				<c:forEach begin="1" end="${requestScope.user_pages.pageSum}"
					var="page_i">
					<li><a
						href='<%=path%>/admin/order_select_all_user.html?page=<c:out value="${page_i}"/>'><c:out
								value="${page_i}" /> </a></li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	<!-- JS导入 -->
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/modify.js"></script>
	<script type="text/javascript" src="<%=path%>/js/user_page.js"></script>
	<script type="text/javascript" src="<%=path%>/js/date.js"></script>
</body>
</html>