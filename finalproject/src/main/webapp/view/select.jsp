<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>

<!-- Bootstrap core CSS -->
<link href="view/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="view/css/blog-post.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="view/css/reservation.css">
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script type="text/javascript">
	var p_count = Number('${rdto.p_count}');
</script>
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

	<!-- Header -->
	<header class="bg-primary py-5 mb-5">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">Business Name or
						Tagline</h1>
					<p class="lead mb-5 text-white-50">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Non possimus ab labore provident
						mollitia. Id assumenda voluptate earum corporis facere quibusdam
						quisquam iste ipsa cumque unde nisi, totam quas ipsam.</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Post Content Column -->
			<div class="col-lg-8">

				<!-- Title -->
				<h1 class="mt-4">${dep_name}→${arv_name}</h1>

				<!-- Date/Time -->
				<p>${dep_date}</p>

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
								<td>${fn:substring(dto.d_time,8,10)}시
									${fn:substring(dto.d_time,10,12)}분</td>
								<td>${fn:substring(dto.a_time,8,10)}시
									${fn:substring(dto.a_time,10,12)}분</td>
								<td>${dto.price_ad}</td>
								<td>${dto.seat}</td>
								<td><input type="radio" name=dept value="${dto.flight}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<!-- Title -->
				<h1 class="mt-4">${arv_name}→${dep_name}</h1>

				<!-- Date/Time -->
				<p>${arv_date}</p>
				
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
								<td>${fn:substring(dto.d_time,8,10)}시
									${fn:substring(dto.d_time,10,12)}분</td>
								<td>${fn:substring(dto.a_time,8,10)}시
									${fn:substring(dto.a_time,10,12)}분</td>
								<td>${dto.price_ad}</td>
								<td>${dto.seat}</td>
								<td><input type="radio" name="arrv" value="${dto.flight}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<hr>

				<p class="lead">안내사항</p>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut,
					tenetur natus doloremque laborum quos iste ipsum rerum obcaecati
					impedit odit illo dolorum ab tempora nihil dicta earum fugiat.
					Temporibus, voluptatibus.</p>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Eos, doloribus, dolorem iusto blanditiis unde eius illum
					consequuntur neque dicta incidunt ullam ea hic porro optio ratione
					repellat perspiciatis. Enim, iure!</p>

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
									예약자<span class="resName"> <c:choose>
											<c:when test="${rdto.guestchk == 'guest'}">
												${rdto.non_name}님
											</c:when>
											<c:otherwise>
												${id}님
											</c:otherwise>
										</c:choose>
									</span>
								</p>
								<p>
									출국<span class="dep_airinfo_flight"></span>
								</p>
								<p>
									귀국<span class="arv_airinfo_flight"></span>
								</p>
								<p>
									요금<span class="price">0</span>원
								</p>
								<p>
									탑승객수<span>${rdto.p_count}</span>
								</p>
								<p>
									총가격<span class="totalPrice">0</span>원
								</p>
								<button id="naverpayment" class="btn btn-primary btn-lg">NaverPay</button>
								<hr />
								<a href="#" id="kakaopayment">
								<img alt="카카오페이" src="images/payment_icon_yellow_medium.png"></a>
								<hr />
								<button id="payment" class="btn btn-primary btn-lg">일반결제</button>
								<a href="main.do" class="btn btn-primary btn-lg">취소</a>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<form action="reservation.do" method="post">
		<input type="hidden" name="p_count" value="${rdto.p_count}">
		<input type="hidden" name="payment_chk" id="payment_chk">
		<input type="hidden" name="dep_airinfo_flight" id="dep_airinfo_flight">
		<input type="hidden" name="arv_airinfo_flight" id="arv_airinfo_flight">
		<c:choose>
			<c:when test="${rdto.guestchk == 'guest'}">
				<input type="hidden" name="guestchk" value="${rdto.guestchk}">
				<input type="hidden" name="non_name" value="${rdto.non_name}">
				<input type="hidden" name="non_gender" value="${rdto.non_gender}">
				<input type="hidden" name="non_phonenumber" value="${rdto.non_phonenumber}">
				<input type="hidden" name="non_email" value="${rdto.non_email}">
				<input type="hidden" name="non_pass" value="${rdto.non_pass}">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="user_id" value="${id}">
			</c:otherwise>
		</c:choose>
	</form>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="view/vendor/jquery/jquery.min.js"></script>
	<script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="view/js/reservation.js"></script>
</body>
</html>