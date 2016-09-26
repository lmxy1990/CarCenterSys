<%@page import="com.pan.car.model.AdminModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();

	AdminModel model = request.getSession() == null ? null
			: (AdminModel) request.getSession().getAttribute("admin");
	if (model == null) {
		response.sendRedirect(path+"/admin/adminLoad.html") ;
		return ;
	}
	if (model.getAdminName() == null){
		response.sendRedirect(path+"/admin/adminLoad.html") ;
		return ;
	}
%>