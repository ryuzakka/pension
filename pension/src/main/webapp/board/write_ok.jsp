<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDao" %>
<%
	BoardDao dao = new BoardDao();
	dao.write(request, response, session);
%>