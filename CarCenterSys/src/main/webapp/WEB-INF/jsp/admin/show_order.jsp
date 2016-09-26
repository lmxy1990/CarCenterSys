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
<title>订单明细</title>
</head>
<body style="background-color: aliceblue;">
	<a
		href="<%=path%>/admin/do_find_consume.html?userId=<c:out value="${requestScope.page_info.userId}" />&userName=<c:out value="${requestScope.page_info.userName}" />&stateId=<c:out value="${requestScope.page_info.stateId}" />"
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
					value="${requestScope.page_info.userName}" /> &nbsp;&nbsp;订单总数: <c:out
					value="${requestScope.page_info.countOrder}" /> &nbsp;&nbsp;总金额: <c:out
					value="${requestScope.page_info.sumMoney}" /> &nbsp;元&nbsp;&nbsp;
				<font color="red"><c:out value="${requestScope.show_info}" /></font>
			</span>
		</caption>
		<thead>
			<tr>
				<th>日期</th>
				<th>消费项目</th>
				<th>消费金额</th>
				<th>状态</th>
				<th class="hidden-print">操作</th>
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
						<c:if test="${sessionScope.admin.adminPower==1}">
							<td class="hidden-print"><a
								href="<%=path%>/admin/del_consume.html?id=<c:out value="${consumeList.id}" />&userId=<c:out value="${requestScope.page_info.userId}" />&userName=<c:out value="${requestScope.page_info.userName}" />">删除</a></td>
						</c:if>
						<c:if test="${sessionScope.admin.adminPower!=1}">
							<td class="hidden-print">权限不足</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<!-- 分页 -->

	<div style="width: 100%; position: absolute; bottom: 15px;"
		align="center" class="hidden-print">
		<!-- 如果页面大于5 -->
		<c:if test="${requestScope.page_info.pageSum>5}">
			<ul class="pagination">
				<c:if test="${requestScope.page_info.page>1}">
					<li><a
						href="<%=path%>/admin/do_find_consume.html?stateId=<c:out value="${requestScope.page_info.stateId}" />&userId=<c:out value="${requestScope.page_info.userId}" />&page=<c:out value="${requestScope.page_info.page-1}" />&userName=<c:out value="${requestScope.page_info.userName}" />">&laquo;</a></li>
				</c:if>
				<%--如果当前页面之后的页面数量大于5 --%>
				<c:if
					test="${requestScope.page_info.page+4<=requestScope.page_info.pageSum}">
					<c:forEach begin="${requestScope.page_info.currentPage}"
						end="${requestScope.page_info.currentPage+4}" var="page_i">
						<li><a
							href="<%=path%>/admin/do_find_consume.html?stateId=<c:out value="${requestScope.page_info.stateId}" />&userId=<c:out value="${requestScope.page_info.userId}" />&page=<c:out value="${page_i}" />&userName=<c:out value="${requestScope.page_info.userName}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<%--如果当前页面之后的页面数量小于5 --%>
				<c:if
					test="${requestScope.page_info.page+4>requestScope.page_info.pageSum}">
					<c:forEach begin="${requestScope.page_info.page}"
						end="${requestScope.page_info.pageSum}" var="page_i">
						<li><a
							href="<%=path%>/admin/do_find_consume.html?stateId=<c:out value="${requestScope.page_info.stateId}" />&userId=<c:out value="${requestScope.page_info.userId}" />&page=<c:out value="${page_i}" />&userName=<c:out value="${requestScope.page_info.userName}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<c:if
					test="${requestScope.page_info.page<requestScope.page_info.pageSum}">
					<li><a
						href="<%=path%>/admin/do_find_consume.html?stateId=<c:out value="${requestScope.page_info.stateId}" />&userId=<c:out value="${requestScope.page_info.userId}" />&page=<c:out value="${requestScope.page_info.page+1}" />&userName=<c:out value="${requestScope.page_info.userName}" />">&raquo;</a></li>
				</c:if>
			</ul>
		</c:if>
		<!-- 如果页面小于5 -->
		<c:if test="${requestScope.page_info.pageSum<=5}" var="sum">
			<ul class="pagination">
				<c:forEach begin="1" end="${requestScope.page_info.pageSum}"
					var="page_i">
					<li><a
						href="<%=path%>/admin/do_find_consume.html?stateId=<c:out value="${requestScope.page_info.stateId}" />&userId=<c:out value="${requestScope.page_info.userId}" />&page=<c:out value="${page_i}" />&userName=<c:out value="${requestScope.page_info.userName}" />"><c:out
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