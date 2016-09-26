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
<title>订单查询</title>
</head>
<body style="background-color: aliceblue;">
	<br />
	<div>
		<div class="row">
			<div class="col-sm-3">
				<!-- 表单 -->
				<form action="<%=path%>/admin/do_order_detial_user.html"
					method="post">
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
							name="userName" placeholder="请输入需要查询的关键字..."> <span
							class="input-group-btn">
							<button class="btn btn-success" type="submit">查询</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-sm-1">
				<a href="<%=path%>/admin/do_find_consume.html?stateId=1&userName=所有用户&page=1"
					class="btn btn-primary ">统计全部</a>
			</div>
		</div>
	</div>
	<table class="table table-hover table-bordered">
		<caption>
			<!-- 提示消息 -->
			<font color="red">${order_info}</font><br />
		</caption>
		<thead>
			<tr>
				<th>用户名</th>
				<th>电话</th>
				<th>车牌号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.user_list}" var="userList">
				<tr>
					<td><c:out value="${userList.userName}"></c:out></td>
					<td><c:out value="${userList.userTel}"></c:out></td>
					<td><c:out value="${userList.userNo}"></c:out></td>
					<c:if test="${sessionScope.admin.adminPower!=null}">
						<td><a target="view_panel"
							href="<%=path%>/admin/do_find_consume.html?stateId=1&userId=<c:out value="${userList.id}" />&userName=<c:out value="${userList.userName}"/>&stateId=1">查询记录</a></td>
					</c:if>
					<c:if test="${sessionScope.admin.adminPower==null}">
						<td>权限不足</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 分页 -->
	<div style="width: 100%; position: absolute; bottom: 15px;"
		align="center">
		<!-- 如果页面大于5 -->
		<c:if test="${requestScope.user_pages.pageSum>5}">
			<ul class="pagination">
				<c:if test="${requestScope.user_pages.currentPage>1}">
					<li><a
						href="<%=path%>/admin/do_order_detial_all_user.html?page=<c:out value="${requestScope.user_pages.currentPage-1}" />">&laquo;</a></li>
				</c:if>
				<%--如果当前页面之后的页面数量大于5 --%>
				<c:if
					test="${requestScope.user_pages.currentPage+4<=requestScope.user_pages.pageSum}">
					<c:forEach begin="${requestScope.user_pages.currentPage}"
						end="${requestScope.user_pages.currentPage+4}" var="page_i">
						<li><a
							href="<%=path%>/admin/do_order_detial_all_user.html?page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<%--如果当前页面之后的页面数量小于5 --%>
				<c:if
					test="${requestScope.user_pages.currentPage+4>requestScope.user_pages.pageSum}">
					<c:forEach begin="${requestScope.user_pages.currentPage}"
						end="${requestScope.user_pages.pageSum}" var="page_i">
						<li><a
							href="<%=path%>/admin/do_order_detial_all_user?page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<c:if
					test="${requestScope.user_pages.currentPage<requestScope.user_pages.pageSum}">
					<li><a
						href="<%=path%>/admin/do_order_detial_all_user?page=<c:out value="${requestScope.user_pages.currentPage+1}" />">&raquo;</a></li>
				</c:if>
			</ul>
		</c:if>
		<!-- 如果页面小于5 -->
		<c:if test="${requestScope.user_pages.pageSum<=5}" var="sum">
			<ul class="pagination">
				<c:forEach begin="1" end="${requestScope.user_pages.pageSum}"
					var="page_i">
					<li><a
						href='<%=path%>/admin/do_order_detial_all_user?page=<c:out value="${page_i}"/>'><c:out
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
	<script type="text/javascript" src="<%=path%>/js/user_page.js"></script>
</body>
</html>