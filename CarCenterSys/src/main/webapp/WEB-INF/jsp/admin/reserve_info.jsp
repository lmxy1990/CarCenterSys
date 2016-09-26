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
	<table class="table table-hover table-bordered">
		<caption></caption>
		<thead>
			<tr>
				<th>客户</th>
				<th>预定项目</th>
				<th>预定时间</th>
				<th>备注</th>
				<th class="hidden-print">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${requestScope.reserve_info!=null}">
				<c:forEach items="${requestScope.reserve_info}" var="reserveList">
					<tr>
						<td><c:out value="${reserveList.userName}" /></td>
						<td><c:out value="${reserveList.serviceName}" /></td>
						<td><c:out value="${reserveList.consumeTime}" /></td>
						<td><c:out value="${reserveList.remarks}" /></td>
						<td class="hidden-print"><a href="#" data-toggle="modal"
							data-target="#delReserve"
							onclick='modify("<c:out value="${reserveList.id}" />")'>处理</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

	<!-- 数据处理 -->
	<div class="modal fade" id="delReserve" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">处理</h4>
				</div>
				<!-- 需要提交的表单 -->
				<form class="form-horizontal" role="form"
					action="<%=path%>/admin/do_add_order.html" method="post">
					<div class="modal-body">
						<div style="width: 400px; margin: 0 auto;">
							<!-- 处理的数据 -->
							<input required id="modifyId" name="id" type="number"
								class="hidden" hidden="hidden" />
							<!-- 管理员 -->
							<input required name="adminId" type="number" class="hidden"
								hidden="hidden"
								value='<c:out value="${sessionScope.admin.id}" />' /> <br />

							<!-- 实际价格 -->
							<div class="form-group">
								<label for="realPrice" class="col-sm-4 control-label"><span
									style="color: red; font-family: arial;">*</span>实际价格:</label>
								<div class="col-sm-8">
									<input required type="number" class="form-control"
										id="realPrice" placeholder="请输入价格..." name="realPrice" />
								</div>
							</div>

							<!-- 订单状态 -->
							<div class="form-group">
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
								<label for="remarks" class="col-sm-4 control-label">处理日期:</label>
								<div class="col-sm-8">
									<input required type="datetime-local" class="form-control consumeTime "
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
		<c:if test="${requestScope.page_info.pageSum>5}">
			<ul class="pagination">
				<c:if test="${requestScope.page_info.page>1}">
					<li><a
						href="<%=path%>/admin/reserve_info.html?page=<c:out value="${requestScope.page_info.page-1}" />">&laquo;</a></li>
				</c:if>
				<%--如果当前页面之后的页面数量大于5 --%>
				<c:if
					test="${requestScope.page_info.page+4<=requestScope.page_info.pageSum}">
					<c:forEach begin="${requestScope.page_info.page}"
						end="${requestScope.page_info.page+4}" var="page_i">
						<li><a
							href="<%=path%>/admin/reserve_info.html?&page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<%--如果当前页面之后的页面数量小于5 --%>
				<c:if
					test="${requestScope.page_info.page+4>requestScope.page_info.pageSum}">
					<c:forEach begin="${requestScope.page_info.page}"
						end="${requestScope.page_info.pageSum}" var="page_i">
						<li><a
							href="<%=path%>/admin/reserve_info.html?&page=<c:out value="${page_i}" />"><c:out
									value="${page_i}" /></a></li>
					</c:forEach>
				</c:if>
				<c:if
					test="${requestScope.page_info.page<requestScope.page_info.pageSum}">
					<li><a
						href="<%=path%>/admin/reserve_info.html?userId=<c:out value="${requestScope.page_info.userId}" />&page=<c:out value="${requestScope.page_info.page+1}" />&userName=<c:out value="${requestScope.page_info.userName}" />">&raquo;</a></li>
				</c:if>
			</ul>
		</c:if>
		<!-- 如果页面小于5 -->
		<c:if test="${requestScope.page_info.pageSum<=5}" var="sum">
			<ul class="pagination">
				<c:forEach begin="1" end="${requestScope.page_info.pageSum}"
					var="page_i">
					<li><a
						href="<%=path%>/admin/reserve_info.html?userId=<c:out value="${requestScope.page_info.userId}" />&page=<c:out value="${page_i}" />&userName=<c:out value="${requestScope.page_info.userName}" />"><c:out
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
	<script type="text/javascript" src="<%=path%>/js/date.js"></script>
</body>
</html>