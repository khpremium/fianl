<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/reservation.js"></script>
<link rel="stylesheet" href="css/reservation.css">
</head>
<body>
	비행기선택ㄱㄱ
	<p>왕복</p>
	<p>출발->도착</p>
	<p>여정1</p>
	<!-- 출발비행기 -->
	<div id="dept">
		<table><tr><th>항공사</th><th>편명</th><th>출발시간</th><th>도착시간</th><th>가격</th><th>잔여좌석</th><th>선택</th></tr></table>
	</div>
	<p>여정2</p>
	<!-- 도착비행기 -->
	<div id="arrv">
		<table><tr><th>항공사</th><th>편명</th><th>출발시간</th><th>도착시간</th><th>가격</th><th>잔여좌석</th><th>선택</th></tr></table>
	</div>
	<!-- 오른쪽 편명, 요금, 가격 -->
	<div id="choice">
		<p>예약자<span class="resName">ㅁ</span></p>
		<p>출국<span class="filghtName1">0</span></p>
		<p>귀국<span class="filghtName2">0</span></p>
		<p>요금<span class="price">0</span></p>
		<p>탑승객수<span class="pCount">3</span></p>
		<p>총가격<span class="totalPrice">0</span></p>
		<button>결제</button>
		<button>취소</button>
	</div>
</body>
</html>