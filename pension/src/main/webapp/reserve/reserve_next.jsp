<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dao.ReserveDao" %>
<c:if test="${userid == null}">
	<c:redirect url="../member/member_only.jsp" />
</c:if>
<%
	ReserveDao dao = new ReserveDao();
	dao.reserve_next(request);
	
	dao.getSuk(request);
%>
<!-- reserve_next.jsp -->
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
	#section table tr td {
		height:40px;
	}
	#section #confirmBtn {
		display:inline-block;
		width:400px;
		height:70px;
		/* padding-top:15px; */
		background:#6B8E23;
		color:white;
		font-size:20px;
		margin:30px 0px 10px 0px;
	}
	#section #confirmBtn:hover {
		background:#556B2F;
	}
</style>
<script>
	function total_price() {
		// 숙박, 인원, 숯, BBQ의 선택 값을 가져와서 총 금액을 계산한다.
		
		// 1. 숙박
		var howLong = document.reservationForm.howLong.value;
		var howLongCost = howLong * ${room.price};
		/* document.getElementById('suk').innerText = ;  */
		document.getElementById('suk').innerText = new Intl.NumberFormat().format(howLongCost); 
		
		// 2. 인원
		var howMany = document.reservationForm.howMany.value;
		howMany = howMany - ${room.min};
		var howManyCost = howMany * 20000;
		document.getElementById('inwon').innerText = new Intl.NumberFormat().format(howManyCost);
		
		// 3. 숯
		var pack = document.reservationForm.charcoal.value;
		var packCost = pack * 20000;
		document.getElementById('charcoal').innerText = new Intl.NumberFormat().format(packCost);
		
		// 4. BBQ
		var barbq = document.reservationForm.bbq.value;
		var barbqCost = barbq * 50000;
		document.getElementById('bbq').innerText = new Intl.NumberFormat().format(barbqCost);
		
		// 5. 총계
		var tt = howLongCost + howManyCost + packCost + barbqCost;
		document.getElementById('cost').innerText = new Intl.NumberFormat().format(tt);
		
		// form태그 내에 총 금액을 input태그에 전달
		document.reservationForm.total.value = tt;
	}
	
	window.onload = total_price();
</script>
<div id="section">
	
<h1> 예약 신청서 (${userid}님) </h1>

<form name="reservationForm" method="post" action="reserve_ok.jsp">
	<input type="hidden" name="bangid" value="${room.id}">
	<table width="800" align="center" border="1">
		<tr>
			<td width="225"> <strong>방이름</strong> </td>
			<td colspan="3"> ${room.bang} </td>
		</tr>
		<tr>
			<td> <strong>입실일</strong> </td>
			<td> <input type="hidden" name="checkin" value="${checkin}">${checkin} </td>
			<td> <strong>숙박일수</strong> </td>
			<td>
				<select name="howLong" onchange="total_price()">
				<c:forEach var="i" begin="1" end="${available}">
					<option value="${i}">${i}박</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td> <strong>기준인원</strong><br>(최소인원 - 최대인원) </td>
			<td> ${room.min} - ${room.max} </td> 
			<td> <strong>입실인원</strong> </td>
			<td>
				<select name="howMany" onchange="total_price()">
					<c:forEach begin="${room.min}" end="${room.max}" var="i">
					<option value="${i}">${i} 명</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td> <strong>숯패키지</strong> </td>
			<td>
				<select name="charcoal" onchange="total_price()">
					<option value="0">선택안함</option>
					<option value="1"> 1 명 </option>
					<option value="2"> 2 명 </option>
					<option value="3"> 3 명 </option>
					<option value="4"> 4 명 </option>
					<option value="5"> 5 명 </option>
				</select>
			</td>
			<td> <strong>BBQ(식재료)</strong> </td>
			<td>
				<select name="bbq" onchange="total_price()">
					<option value="0">선택안함</option>
					<option value="1"> 1 명 </option>
					<option value="2"> 2 명 </option>
					<option value="3"> 3 명 </option>
					<option value="4"> 4 명 </option>
					<option value="5"> 5 명 </option>
				</select>
			</td>
		</tr>
	</table>
	<p>
	<h2>가격표</h2>
	<table width="800" align="center" border="1">
		<tr>
			<td> 숙박가격 </td>
			<td> <span id="suk"><fmt:formatNumber value="${room.price}" type="number" /></span> 원</td>
		</tr>
		<tr>
			<td> 인원추가 </td>
			<td> <span id="inwon">0</span> 원</td>
		</tr>
		<tr>
			<td> 숯 패키지 </td>
			<td> <span id="charcoal">0</span> 원</td>
		</tr>
		<tr>
			<td> BBQ </td>
			<td> <span id="bbq">0</span> 원</td>
		</tr>
		<tr>
			<td> 최종금액 </td>
			<td>
				<span id="cost"><fmt:formatNumber value="${room.price}" type="number" /></span> 원
				<input type="hidden" name="total" value="${room.price}">
			</td>
		</tr>
	</table>
	<p>
	
	<input type="submit" id="confirmBtn" value="예약하기">
	<p><a href="reserve.jsp">취소하기</a></p>
</form>
	
</div>
<c:import url="../bottom.jsp" />