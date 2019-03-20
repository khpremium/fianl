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

	$(document).ready(function() {
		var oPay = Naver.Pay.create({
			"mode" : "production", // development or production
			"clientId" : "u86j4ripEt8LRfPGzQ8", // clientId
			"openType" : "layer",
			"onAuthorize" : function(oData) {
	/*
	layer 타입을 사용했을 때 페이지 전환 없이 구현이 가능하도록 지원되며, 그 외의 경우는 returnUrl 로 참조 정보와 함께 redirect 됩니다.
	oData 객체에는 결제 인증 결과와 전달한 returnUrl 정보가 함께 전달되며,
	이 정보는 이후 승인 요청 처리를 위한 정보 (resultCode, resultMessage, returnUrl, paymentId, reserveId 등) 입니다.
	전달되는 값은 https://developer.pay.naver.com/docs/v2/api#payments-payments_window 의 성공 & 실패 응답 값을 참조해주세요.
	 */
				if (oData.resultCode === "Success") {
					// 네이버페이 결제 승인 요청 처리
					alert('결제성공');
					$('#payment_chk').val(1);
					$('form').submit();
				} else {
					// 필요 시 oData.resultMessage 에 따라 적절한 사용자 안내 처리
					alert('결제실패\n사유:' + oData.resultMessage);
					$('#payment_chk').val(0);
				}
			}
		});

		//직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
		var elNaverPayBtn = document.getElementById("naverpayment");

		elNaverPayBtn.addEventListener("click", function() {
			if ($('#dep_airinfo_flight').val() == '' || $('#arv_airinfo_flight').val() == '') {
				alert('비행편을 선택해주세요.');
				return false;
			}
			oPay.open({
				"merchantUserKey" : "123",
				"merchantPayKey" : "123",
				"productName" : "항공권",
				"totalPayAmount" : "1000",
				"taxScopeAmount" : "1000",
				"taxExScopeAmount" : "0",
				"returnUrl" : "payment.do"
			});
		});

		$('#kakaopayment').on('click', function() {
			if ($('#dep_airinfo_flight').val() == '' || $('#arv_airinfo_flight').val() == '') {
				alert('비행편을 선택해주세요.');
				return false;
			}

			$.ajax({
				type : 'GET',
				url : 'kakaoPro.do',
				dataType : 'json',
				success : function(res) {
					window.open(res.next_redirect_pc_url,'_blank','width=400, height=600, left=580, top=200');
				}
			});
		});
	});

	// 카카오페이 실행결과
	function kakaoResultProcess(res) {
		if (res == 'cancel')
			alert('결제가 취소되었습니다.');
		else if (res == 'fail')
			alert('결제에 실패하였습니다.');
		else {
			$('#payment_chk').val(1);
			$('form').submit();
		}
	}
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
				<p>${dep_date}~ ${arv_date}</p>

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
								<td>${fn:substring(dto.d_time,6,8)}시
									${fn:substring(dto.d_time,8,10)}분</td>
								<td>${fn:substring(dto.a_time,6,8)}시
									${fn:substring(dto.a_time,8,10)}분</td>
								<td>${dto.price_ad}</td>
								<td>${dto.seat}</td>
								<td><input type="radio" name=dept value="${dto.flight}" /></td>
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
								<td>${fn:substring(dto.d_time,6,8)}시
									${fn:substring(dto.d_time,8,10)}분</td>
								<td>${fn:substring(dto.a_time,6,8)}시
									${fn:substring(dto.a_time,8,10)}분</td>
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
												client님
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
								<button id="kakaopayment" class="btn btn-primary btn-lg">KakaoPay</button>
								<hr />
								<button id="payment" class="btn btn-primary btn-lg">일반결제</button>
								<button id="cancel" class="btn btn-primary btn-lg">취소</button>
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
		<c:if test="${rdto.guestchk == 'guest'}">
			<input type="hidden" name="guestchk" value="${rdto.guestchk}">
			<input type="hidden" name="non_name" value="${rdto.non_name}">
			<input type="hidden" name="non_gender" value="${rdto.non_gender}">
			<input type="hidden" name="non_phonenumber" value="${rdto.non_phonenumber}">
			<input type="hidden" name="non_email" value="${rdto.non_email}">
			<input type="hidden" name="non_pass" value="${rdto.non_pass}">
		</c:if>
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