<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.AdminDao" %>
<%
	AdminDao dao = new AdminDao();
	dao.reserve_cancel(request, response);
%>