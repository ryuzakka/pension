<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.TourDao" %>
<%
	TourDao dao = new TourDao();
	dao.update(request, response);
%>