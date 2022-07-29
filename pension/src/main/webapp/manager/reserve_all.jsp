<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.AdminDao" %>
<c:if test="${userid != 'admin'}"><c:redirect url="../main/index.jsp" /></c:if>
<%
	AdminDao dao = new AdminDao();
	dao.reserve_checkAll(request);
%>
<!-- manager/reserve.jsp -->
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
		margin-top:50px;
		border-spacing:0px;
	}
</style>
<div id="section">
	
	<h2>예약 현황</h2>
	<div>사용이 완료된 예약만 보시려면 아래의 버튼을 눌러주세요.</div>
	<a href="reserve.jsp">사용완료 감추기</a><p>
	
	<table width="1000" align="center" border="1">
		<tr>
			<td> 예약번호 </td>
			<td> 예약상태 </td>
			<td> 예약일 </td>
			<td> 객실이름 </td>
			<td> 예약자 </td>
			<td> 체크인 </td>
			<td> 체크아웃 </td>
			<td> 금액 </td>
			<td> 인원 </td>
			<td> 숯 </td>
			<td> BBQ </td>
		</tr>

		<c:forEach items="${list}" var="reserve">
		<tr>
			<td> ${reserve.id} </td>
			<td>
				<c:if test="${reserve.state == 0}">예약 완료</c:if>
				<c:if test="${reserve.state == 2}">취소 완료</c:if>
				<c:if test="${reserve.state == 3}">사용 완료</c:if>
				<c:if test="${reserve.state == 1}">취소 신청중<br><input type="button" value="취소승인"></c:if>
			</td>
			<td> ${reserve.writeday} </td>
			<td> ${reserve.bang} </td>
			<td> ${reserve.userid} </td>
			<td> ${reserve.checkin} </td>
			<td> ${reserve.checkout} </td>
			<td> ${reserve.total} </td>
			<td> ${reserve.inwon} </td>
			<td> ${reserve.charcoal} </td>
			<td> ${reserve.bbq} </td>
		</tr>
		</c:forEach>

	</table>
	
	
</div>
<c:import url="../bottom.jsp" />