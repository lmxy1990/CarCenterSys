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
<title>客户信息管理</title>
</head>
<body style="background-color: aliceblue;">
	<br />
	<div>
		<div class="row">
			<div class="col-sm-3">
				<!-- 表单 -->
				<form action="<%=path%>/admin/find_user.html" method="post">
					<div class="input-group">
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
						<input type="text" class="form-control " id="inputKey"
							name="userName" placeholder="请输入需要查询的用户名...."> <span
							class="input-group-btn">
							<button class="btn btn-success" type="submit">查询</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-sm-1">
				<a href="<%=path%>/admin/user_page.html" class="btn btn-primary ">查询全部</a>
			</div>
		</div>
	</div>
	<table class="table table-hover table-bordered">
		<caption>
			<!-- 提示消息 -->
			<font color="red">${user_info}</font><br /> 用户列表
		</caption>
		<thead>
			<tr>
				<th>用户名</th>
				<th>电话</th>
				<th>车牌号</th>
				<th>里程数</th>
				<th colspan="2">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.user_list}" var="userList">
				<tr>
					<td><c:out value="${userList.userName}"></c:out></td>
					<td><c:out value="${userList.userTel}"></c:out></td>
					<td><c:out value="${userList.userNo}"></c:out></td>
					<td><c:out value="${userList.userMile}"></c:out></td>
					<c:if test="${sessionScope.admin.adminPower==1}">
						<td><a href="#" data-toggle="modal" data-target="#modify"
							onclick='modify("<c:out value="${userList.id}"></c:out>")'>修改</a></td>
						<td><a
							href='<%=path%>/admin/do_del_user.html?id=<c:out value="${userList.id}"></c:out>'>删除</a>
						</td>
					</c:if>
					<c:if test="${sessionScope.admin.adminPower==0}">
						<td colspan="2">权限不足</td>
					</c:if>
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
					<h4 class="modal-title" id="myModalLabel">客户信息修改</h4>
				</div>
				<form class="form-horizontal" role="form"
					action="<%=path%>/admin/do_user_modify.html" method="post">
					<div class="modal-body">
						<div style="width: 400px; margin: 0 auto;">
							<font color="red">只填写需要变更的信息!</font> <input id="modifyId"
								name="id" type="number" class="hidden" hidden="hidden" /> <br />
							<!-- 需要提交的表单 -->
							<div class="form-group">
								<label for="userName" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>用户名:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userName"
										placeholder="请输入用户名..." name="userName">
								</div>
							</div>


							<div class="form-group">
								<label for="userMile" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>车牌:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userMile"
										placeholder="请输入车牌..." name="userNo">
								</div>
							</div>



							<div class="form-group">
								<label for="userPassword" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>密码:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userPassword"
										placeholder="请输入密码..." name="userPassword">
								</div>
							</div>


							<div class="form-group">
								<label for="userUnit" class="col-sm-4 control-label">单位:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userUnit"
										placeholder="请输入单位.." name="userUnit">
								</div>
							</div>



							<div class="form-group">
								<label for="userTel" class="col-sm-4 control-label">电话:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" id="userTel"
										placeholder="请输入电话.." name="userTel">
								</div>
							</div>


							<div class="form-group">
								<label for="userMile" class="col-sm-4 control-label">里程数(KM):</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userMile"
										placeholder="请输入里程数..." name="userMile">
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
	<!-- 分页 -->

	<div style="width: 100%; position: absolute; bottom: 15px;"
		align="center">
		<!-- 如果页面大于5 -->
		<c:if test="${requestScope.user_pages.pageSum>5}">
			<ul class="pagination">
				<c:if test="${requestScope.user_pages.currentPage>1}">
					<li><a
						href="<%=path%>/admin/user_page.html?page=<c:out value="${requestScope.user_pages.currentPage-1}" />">&laquo;</a></li>
				</c:if>
				<%--如果当前页面之后的页面数量大于5 --%>
				<c:if
					test="${requestScope.user_pages.currentPage+4<=requestScope.user_pages.pageSum}">
					<c:forEach begin="${requestScope.user_pages.currentPage}"
						end="${requestScope.user_pages.currentPage+4}" var="page_i">
						<li><a
							href="<%=path%>/admin/user_page.html?page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<%--如果当前页面之后的页面数量小于5 --%>
				<c:if
					test="${requestScope.user_pages.currentPage+4>requestScope.user_pages.pageSum}">
					<c:forEach begin="${requestScope.user_pages.currentPage}"
						end="${requestScope.user_pages.pageSum}" var="page_i">
						<li><a
							href="<%=path%>/admin/user_page.html?page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<c:if
					test="${requestScope.user_pages.currentPage<requestScope.user_pages.pageSum}">
					<li><a
						href="<%=path%>/admin/user_page.html?page=<c:out value="${requestScope.user_pages.currentPage+1}" />">&raquo;</a></li>
				</c:if>
			</ul>
		</c:if>
		<!-- 如果页面小于5 -->
		<c:if test="${requestScope.user_pages.pageSum<=5}" var="sum">
			<ul class="pagination">
				<c:forEach begin="1" end="${requestScope.user_pages.pageSum}"
					var="page_i">
					<li><a
						href='<%=path%>/admin/user_page.html?page=<c:out value="${page_i}"/>'><c:out
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
</body>
</html>