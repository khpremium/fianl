<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-post.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/reservation.js"></script>
<link rel="stylesheet" href="css/reservation.css">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Post Content Column -->
			<div class="col-lg-8">

				<!-- Title -->
				<h1 class="mt-4">${adto.city_code_dep}→${adto.city_code_arv}</h1>
				
				<!-- Date/Time -->
				<p>2019 03 15 ~ 2019 04 01</p>

				비행기선택ㄱㄱ
				<p>여정1</p>
				<!-- 출발비행기 -->
				<div id="dept">
					<table>
						<tr>
							<th>항공사</th>
							<th>편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>가격</th>
							<th>잔여좌석</th>
							<th>선택</th>
						</tr>
						<c:forEach items="${dList}" var="dto">
							<tr>
								<td>${dto.airline}</td>
								<td>${dto.flight}</td>
								<td>${dto.d_time}</td>
								<td>${dto.a_time}</td>
								<td>${dto.price}</td>
								<td>${dto.seat}</td>
								<td><input type="radio" name="flight" value="${dto.flight}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<p>여정2</p>
				<!-- 도착비행기 -->
				<div id="arrv">
					<table>
						<tr>
							<th>항공사</th>
							<th>편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>가격</th>
							<th>잔여좌석</th>
							<th>선택</th>
						</tr>
						<c:forEach items="${rList}" var="dto">
							<tr>
								<td>${dto.airline}</td>
								<td>${dto.flight}</td>
								<td>${dto.d_time}</td>
								<td>${dto.a_time}</td>
								<td>${dto.price}</td>
								<td>${dto.seat}</td>
								<td><input type="radio" name="flight" value="${dto.flight}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<hr>
				
				<p class="lead">안내사항</p>

        		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>

        		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>
				
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">예약</h5>
					<div class="card-body">
						<div class="input-group">
							<!-- 오른쪽 편명, 요금, 가격 -->
							<div id="choice">
								<p>
									예약자<span class="resName">ㅁ</span>
								</p>
								<p>
									출국<span class="filghtName1"></span>
								</p>
								<p>
									귀국<span class="filghtName2"></span>
								</p>
								<p>
									요금<span class="price">0</span>원
								</p>
								<p>
									탑승객수<span>3</span>
								</p>
								<p>
									총가격<span class="totalPrice">0</span>원
								</p>
								<button id="payment">결제</button>
								<button id="cancel">취소</button>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<form>
		<c:if test="${!empty client_id}">
			<input type="hidden" value="${client_id}">
		</c:if>
		<div id="wrap"></div>
	</form>
</body>
</html>