<%@page import="com.pan.car.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	UserModel model = request.getSession() == null ? null
			: (UserModel) request.getSession().getAttribute("admin");
	if (model == null) {
		response.sendRedirect(path+"#register") ;
		return ;
	}
	if (model.getUserName() == null){
		response.sendRedirect(path+"#register") ;
		return ;
	}
%>