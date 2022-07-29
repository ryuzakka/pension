<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- member/reserve_remain.jsp -->
<c:import url="../top.jsp" />
<style>
	#section {
		width:1100px;
		height:auto;
		margin:auto;
		margin-top:80px;
		text-align:center;
	}
	#section div {
		margin:50px 0px 150px 0px;
	}
</style>
<div id="section">
	
	<h3>예약 중인 건이 존재합니다.</h3>
	<div>회원탈퇴를 하시려면 예약된 객실이 없어야 합니다.</div>
	
</div>
<c:import url="../bottom.jsp" />