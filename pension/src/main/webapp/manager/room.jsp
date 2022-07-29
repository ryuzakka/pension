<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${userid != 'admin'}"><c:redirect url="../main/index.jsp" /></c:if>
<%@ page import="dao.AdminDao" %>
<%
	AdminDao dao = new AdminDao();
	dao.room_view(request);
%>
<!-- manager/room.jsp -->
<c:import url="../top.jsp" />
<style>
	#section {
		width:1100px;
		height:auto;
		margin:auto;
		margin-top:80px;
		text-align:center;
	}
	#section #content_layer {
		position:absolute;
		background:white;
	}
</style>
<script>
	function content_view(id) {
		
		var xx = event.pageX;
		var yy = event.pageY;
		var chk = new XMLHttpRequest();
		
		chk.open("post","room_content_view.jsp?id="+id);
		chk.send();
		chk.onreadystatechange = function() {
			if(chk.readyState == 4) {
				document.getElementById('content_layer').style.visibility = "visible";
				document.getElementById('content_layer').style.top = yy+"px";
				document.getElementById('content_layer').style.left = xx+"px";
				document.getElementById('content_layer').innerHTML = chk.responseText; 
			}
		}
	}
	function content_hide() {
		document.getElementById('content_layer').style.visibility = "hidden";
	}
</script>
<div id="section">
	
	<h2>객실 현황</h2>
	
	<table width="800" align="center" border="1">
		<tr>
			<td> 방이름 </td>
			<td> 최소인원 </td>
			<td> 최대인원 </td>
			<td> 가격(1박기준) </td>
			<td> 상 태 </td>
			<td></td>
		</tr>
		
		<c:forEach items="${list}" var="room">
		<tr>
			<td onmouseover="content_view(${room.id})" onmouseout="content_hide()"> ${room.bang} </td>
			<td> ${room.min} </td>
			<td> ${room.max} </td>
			<td> <fmt:formatNumber value="${room.price}" /> 원</td>
			<td>
				<c:if test="${room.state == 0}">정상운영</c:if> 
				<c:if test="${room.state == 1}">준비중</c:if> 
			</td>
			<td>
				<a href="room_update.jsp"><input type="button" value="수정"></a>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div id="content_layer"></div>
	
</div>
<c:import url="../bottom.jsp" />