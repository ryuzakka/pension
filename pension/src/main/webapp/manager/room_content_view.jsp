<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.AdminDao" %>
<%
	AdminDao dao = new AdminDao();
	String content = dao.content_view(request);
%>
<div style="width:200px;height:100px;border:1px solid red"><%=content%></div>