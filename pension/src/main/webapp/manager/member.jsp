<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.AdminDao" %>
<c:if test="${userid != 'admin'}"><c:redirect url="../main/index.jsp" /></c:if>
<%
	AdminDao dao = new AdminDao();
	dao.member_check(request);
%>
<!-- manager/member.jsp -->
<c:import url="../top.jsp" />
<style>
	#section {
		width:1100px;
		height:auto;
		margin:auto;
		margin-top:80px;
		text-align:center;
	}
	#section table {
		border-spacing:0px;
	}
</style>
<div id="section">
	
	<h2>회원 현황</h2>
	
	<table width="800" align="center" border="1">
		<tr>
			<td> 회원번호 </td>
			<td> 아이디 </td>
			<td> 이름 </td>
			<td> 연락처 </td>
			<td> 이메일 </td>
			<td> 가입일 </td>
			<td> 상태 </td>
			<td></td>
		</tr>

		<c:forEach items="${list}" var="member">
		<tr>
			<td> ${member.id} </td>
			<td> ${member.userid} </td>
			<td> ${member.name} </td>
			<td> ${member.phone} </td>
			<td> ${member.email} </td>
			<td> ${member.writeday} </td>
			<td>
				<c:if test="${member.state == 0}">일반</c:if>
				<c:if test="${member.state == 1}">휴면</c:if>
				<c:if test="${member.state == 9}">탈퇴</c:if>
			</td>
			<td></td>
		</tr>
		</c:forEach>

	</table>
	
	
</div>
<c:import url="../bottom.jsp" />