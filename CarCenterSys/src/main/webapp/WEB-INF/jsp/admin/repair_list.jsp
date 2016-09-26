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
<title>在修订单列表</title>
</head>
<body style="background-color: aliceblue;">
	<table class="table table-hover table-bordered">
		<caption class="hidden-print" style="color: red">${requestScope.settlement_info}</caption>
		<thead>
			<tr>
				<th>客户</th>
				<th>服务数</th>
				<th class="hidden-print text-center" colspan="3" >操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${requestScope.repair_list!=null}">
				<c:forEach items="${requestScope.repair_list}" var="repairList">
					<tr>
						<td><c:out value="${repairList.userName}" /></td>
						<td><c:out value="${repairList.repairCount}" /></td>
						<c:if test="${sessionScope.admin.adminPower!=null}">
							<td class="hidden-print settlement"><a href="#"
								onclick="setData('<c:out value = "${repairList.userId}" />','<c:out value = "${repairList.costMoney}" />')"
								data-toggle="modal" data-target="#settlement">结算</a></td>
							<td><a href="#" data-toggle="modal" data-target="#addOrder"
								onclick='modify("<c:out value="${repairList.userId}" />")'>添加服务</a></td>
							<td><a href="<%=path%>/admin/repair_details.html?userId=<c:out value='${repairList.userId}' />&userName=<c:out value = '${repairList.userName}' /> ">详情</a></td>
						</c:if>
						<c:if test="${sessionScope.admin.adminPower==null}">
							<td class="hidden-print" colspan="3">权限不足</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

	<!-- 结算 -->
	<div class="modal fade" id="settlement" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">结算</h4>
				</div>
				<!-- 需要提交的表单 -->
				<form class="form-horizontal" role="form"
					action="<%=path%>/admin/settlement_order.html" method="post">
					<div class="modal-body">
						<div style="width: 400px; margin: 0 auto;">
							<!-- userId -->
							<input required id="userId" name="userId" type="number"
								class="hidden" hidden="hidden" />
							<!-- 管理员 -->
							<input required name="adminId" type="number" class="hidden"
								hidden="hidden"
								value='<c:out value="${sessionScope.admin.id}" />' /> <br />

							<!-- 显示价格 -->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="costMoney">应收金额:</label>
								<div class="col-sm-8 control-label " style="text-align: left;">
									<span id="costMoney" style="color: red;"></span>&nbsp;元
								</div>
							</div>


							<!-- 消费日期 -->
							<div class="form-group">
								<label for="consumeTime" class="col-sm-4 control-label">完工日期:</label>
								<div class="col-sm-8">
									<input required type="datetime-local"
										class="form-control consumeTime" id="consumeTime"
										name="consumeTime" />
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
	<!-- 添加服务 -->
	<div class="modal fade" id="addOrder" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加服务</h4>
				</div>
				<!-- 需要提交的表单 -->
				<form class="form-horizontal" role="form"
					action="<%=path%>/admin/repair_add.html" method="post">
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
									<input required type="datetime-local"
										class="form-control consumeTime" id="consumeTime"
										name="consumeTime" />
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


	<!-- JS导入 -->
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/date.js"></script>
	<script type="text/javascript" src="<%=path%>/js/modify.js"></script>
	<script type="text/javascript" src="<%=path%>/js/repair_list.js"></script>
</body>
</html>