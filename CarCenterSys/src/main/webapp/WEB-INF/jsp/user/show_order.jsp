<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
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
<title>订单明细</title>
</head>
<body style="background-color: aliceblue;">
	<a
		href="<%=path%>/user/user_order.html?userId=<c:out value="${requestScope.user_order_info.userId}" />&userName=<c:out value="${requestScope.user_order_info.userName}" />&stateId=<c:out value="${requestScope.user_order_info.stateId}" />"
		class="hidden-print selectCom"><span
		class="hidden hidden-print formA">提交</span></a>

	<table class="table table-hover table-bordered">
		<caption>
			<span class="row"> <select
				class="form-control hidden-print state_id" style="width: 150px;">
					<c:if test="${requestScope.state_list!=null}">
						<c:forEach items="${requestScope.state_list}" var="stateList">
							<option value="<c:out value='${stateList.id}'/>"><c:out
									value="${stateList.stateName}" /></option>
						</c:forEach>
					</c:if>
			</select>
			</span> <br /> <span class="row"> 客户: <c:out
					value="${requestScope.user_order_info.userName}" />
				&nbsp;&nbsp;订单总数: <c:out
					value="${requestScope.user_order_info.countOrder}" />
				&nbsp;&nbsp;总金额: <c:out
					value="${requestScope.user_order_info.sumMoney}" />
				&nbsp;元&nbsp;&nbsp; <font color="red"><c:out
						value="${requestScope.show_info}" /></font>
			</span>
		</caption>
		<thead>
			<tr>
				<th>日期</th>
				<th>消费项目</th>
				<th>消费金额</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${requestScope.consume_list!=null}">
				<c:forEach items="${requestScope.consume_list}" var="consumeList">
					<tr>
						<td style="width: 200px;"><c:out
								value="${consumeList.consumeTime}" /></td>
						<td><c:out value="${consumeList.serviceName}" /></td>
						<td><c:out value="${consumeList.realPrice}" /></td>
						<td><c:out value="${consumeList.stateName}" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<!-- 分页 -->

	<div style="width: 100%; position: absolute; bottom: 15px;"
		align="center" class="hidden-print">
		<!-- 如果页面大于5 -->
		<c:if test="${requestScope.user_order_info.pageSum>5}">
			<ul class="pagination">
				<c:if test="${requestScope.user_order_info.page>1}">
					<li><a
						href="<%=path%>/user/user_order.html?stateId=<c:out value="${requestScope.user_order_info.stateId}" />&userId=<c:out value="${requestScope.user_order_info.userId}" />&page=<c:out value="${requestScope.user_order_info.page-1}" />&userName=<c:out value="${requestScope.user_order_info.userName}" />">&laquo;</a></li>
				</c:if>
				<%--如果当前页面之后的页面数量大于5 --%>
				<c:if
					test="${requestScope.user_order_info.page+4<=requestScope.user_order_info.pageSum}">
					<c:forEach begin="${requestScope.user_order_info.currentPage}"
						end="${requestScope.user_order_info.currentPage+4}" var="page_i">
						<li><a
							href="<%=path%>/user/user_order.html?stateId=<c:out value="${requestScope.user_order_info.stateId}" />&userId=<c:out value="${requestScope.user_order_info.userId}" />&page=<c:out value="${page_i}" />&userName=<c:out value="${requestScope.user_order_info.userName}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<%--如果当前页面之后的页面数量小于5 --%>
				<c:if
					test="${requestScope.user_order_info.page+4>requestScope.user_order_info.pageSum}">
					<c:forEach begin="${requestScope.user_order_info.page}"
						end="${requestScope.user_order_info.pageSum}" var="page_i">
						<li><a
							href="<%=path%>/user/user_order.html?stateId=<c:out value="${requestScope.user_order_info.stateId}" />&userId=<c:out value="${requestScope.user_order_info.userId}" />&page=<c:out value="${page_i}" />&userName=<c:out value="${requestScope.user_order_info.userName}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<c:if
					test="${requestScope.user_order_info.page<requestScope.user_order_info.pageSum}">
					<li><a
						href="<%=path%>/user/user_order.html?stateId=<c:out value="${requestScope.user_order_info.stateId}" />&userId=<c:out value="${requestScope.user_order_info.userId}" />&page=<c:out value="${requestScope.user_order_info.page+1}" />&userName=<c:out value="${requestScope.user_order_info.userName}" />">&raquo;</a></li>
				</c:if>
			</ul>
		</c:if>
		<!-- 如果页面小于5 -->
		<c:if test="${requestScope.user_order_info.pageSum<=5}" var="sum">
			<ul class="pagination">
				<c:forEach begin="1" end="${requestScope.user_order_info.pageSum}"
					var="page_i">
					<li><a
						href="<%=path%>/user/user_order.html?stateId=<c:out value="${requestScope.user_order_info.stateId}" />&userId=<c:out value="${requestScope.user_order_info.userId}" />&page=<c:out value="${page_i}" />&userName=<c:out value="${requestScope.user_order_info.userName}" />"><c:out
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
	<script type="text/javascript" src="<%=path%>/js/show_select.js"></script>
</body>
</html>