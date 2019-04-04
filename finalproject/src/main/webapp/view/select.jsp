<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
		<link rel="stylesheet" href="view/assets/css/main.css" />
		<style type="text/css">
			.non {
				visibility: hidden;
			}
		</style>
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="index.html">Road Trip <span>by TEMPLATED</span></a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li>
				</ul>
			</nav>

		<!-- Content -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
			<section id="post" class="wrapper bg-img" data-bg="banner2.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>${dep_name}→${arv_name}</h2>
							<span>${dep_date}</span><br><br>
						</header>
						<div>
							<table>
								<thead>
									<tr>
										<th>항공사</th>
										<th>편명</th>
										<th>출발시간</th>
										<th>도착시간</th>
										<th>가격</th>
										<th>잔여좌석</th>
										<th>선택</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dList}" var="dto" varStatus="i">
										<c:choose>
											<c:when test="${dto.seat>=rdto.p_count}">
												<tr>
													<td>${dto.airline}</td>
													<td>${dto.flight}</td>
													<td>${fn:substring(dto.d_time,8,10)}시
														${fn:substring(dto.d_time,10,12)}분</td>
													<td>${fn:substring(dto.a_time,8,10)}시
														${fn:substring(dto.a_time,10,12)}분
														<c:if test="${fn:substring(dto.a_time,8,10) < fn:substring(dto.d_time,8,10)}">
															(+1일)
														</c:if>
														</td>
													<td>${dto.price_ad}</td>
													<td>${dto.seat}</td>
													<td><input type="radio" id="dept${i.index}" name="dept" value="${dto.flight}" />
														<label for="dept${i.index}"></label>
													</td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<br>
						<header>
							<h2>${arv_name}→${dep_name}</h2>
							<span>${arv_date}</span><br><br>
						</header>
						<div>
							<table>
								<thead>
									<tr>
										<th>항공사</th>
										<th>편명</th>
										<th>출발시간</th>
										<th>도착시간</th>
										<th>가격</th>
										<th>잔여좌석</th>
										<th>선택</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${rList}" var="dto" varStatus="i">
										<c:choose>
											<c:when test="${dto.seat>=rdto.p_count}">
												<tr>
													<td>${dto.airline}</td>
													<td>${dto.flight}</td>
													<td>${fn:substring(dto.d_time,8,10)}시
														${fn:substring(dto.d_time,10,12)}분</td>
													<td>${fn:substring(dto.a_time,8,10)}시
														${fn:substring(dto.a_time,10,12)}분
														<c:if test="${fn:substring(dto.a_time,8,10) < fn:substring(dto.d_time,8,10)}">
															(+1일)
														</c:if>
														</td>
													<td>${dto.price_ad}</td>
													<td>${dto.seat}</td>
													<td><input type="radio" id="arrv${i.index}" name="arrv" value="${dto.flight}" />
														<label for="arrv${i.index}"></label>
													</td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</article>
					
					<article class="box">
						<br/>
						
						<header>
							<h2>결제 정보</h2>
						</header>
						<div class="content">
							<ul class="alt">
							<li>예약자
									<c:choose>
										<c:when test="${!empty rdto.non_name}">
											<span id="resName">${rdto.non_name}</span>
										</c:when>
										<c:otherwise>
											<span id="resName">${id}</span>
										</c:otherwise>
									</c:choose>
								님
							</li>
							<c:if test="${!empty point}">
								<li>포인트 <span id="point">${point}</span>점</li>
							</c:if>
							<li>출국 <span class="dep_airinfo_flight"></span></li>
							<li>귀국 <span class="arv_airinfo_flight"></span></li>
							<li>요금 <span class="price">0</span>원</li>
							<li>탑승객수 <span id="p_count">${rdto.p_count}</span></li>
							<li>총가격 <span class="totalPrice">0</span>원</li>
							</ul>
							<c:if test="${point > 10000}">
								<input type="text" id="pointSel" class="point non" value="10000">
								<label class="button alt" id="pointBtn" for="pointSel">포인트 선택</label>
							</c:if>
						</div>
						<footer>
							<ul class="actions fit">
								<!-- <li><button id="naverpayment" class="btn btn-primary btn-lg">NaverPay</button></li> -->
								<li><a href="#" id="kakaopayment"><img alt="카카오페이" src="images/payment_icon_yellow_medium.png"></a></li>
								<li><a href="#" class="button fit" id="payment">일반결제</a></li>
								<li><a href="main.do" class="button">취소</a></li>
							</ul>
						</footer>
						<header>
							<h2>주의 사항</h2>
						</header>
						<div class="content">
							<p>Ac pretium parturient et scelerisque dis pulvinar nascetur suspendisse justo parturient est quis adipiscing nisi dis eu ullamcorper. Penatibus aliquet vestibulum dis pretium a ullamcorper accumsan facilisis elit ullamcorper porttitor dictumst per a a potenti interdum fusce a adipiscing nostra ac parturient. Proin a imperdiet at a scelerisque quam et at ante aenean per per faucibus senectus lobortis mi tincidunt a penatibus. Mauris vestibulum aliquet parturient odio dapibus euismod a mi ullamcorper maecenas turpis non scelerisque nibh fermentum natoque erat parturient suspendisse a magna curabitur cum.</p>

							<p>Aliquet a consectetur semper suscipit ridiculus mattis augue volutpat hendrerit proin hac vel tristique quis amet parturient sem. Adipiscing laoreet blandit vestibulum laoreet fermentum sed sociis lorem class ipsum scelerisque porttitor viverra vestibulum nascetur. Ad felis ad ullamcorper urna iaculis aenean vel a suspendisse nunc placerat euismod suspendisse et fames ipsum elementum odio vestibulum duis. Fringilla condimentum donec tincidunt enim volutpat nam velit quisque laoreet adipiscing nam in suspendisse mattis ad libero parturient scelerisque. Vitae enim ac parturient iaculis pharetra cum quam imperdiet commodo mus netus quam habitasse risus netus dis.</p>

							<p>Arcu est vestibulum condimentum conubia tempus a porttitor quam urna adipiscing a adipiscing condimentum tortor cubilia parturient per senectus interdum felis suspendisse penatibus auctor pretium ac. Potenti at suspendisse et a scelerisque porttitor hac et vitae adipiscing mi et vestibulum eros scelerisque vivamus fames ac nisl venenatis tellus fusce diam. Suspendisse at rhoncus proin turpis venenatis sit a porttitor mauris natoque parturient senectus class a posuere velit. Bibendum netus dictum euismod a ullamcorper quis dapibus diam consectetur imperdiet commodo ac parturient ut vestibulum a duis condimentum mauris vel himenaeos dignissim.</p>
						</div>
					</article>
				</div>
			
				<form action="reservation.do" method="post">
					<input type="hidden" name="p_count" value="${rdto.p_count}">
					<input type="hidden" name="payment_chk" id="payment_chk">
					<input type="hidden" name="dep_airinfo_flight" id="dep_airinfo_flight">
					<input type="hidden" name="arv_airinfo_flight" id="arv_airinfo_flight">
					<c:choose>
						<c:when test="${!empty rdto.non_name}">
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
					<input type="hidden" name="usePoint" id="usePoint" value="0">
				</form>
			</section>
		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					
					<ul class="icons">
						<li><a href="#" class="icon round fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon round fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon round fa-instagram"><span class="label">Instagram</span></a></li>
					</ul>

					<div class="copyright">
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
					</div>

				</div>
			</footer>

		<!-- Scripts -->
			<script src="view/assets/js/jquery.min.js"></script>
			<script src="view/assets/js/jquery.scrolly.min.js"></script>
			<script src="view/assets/js/jquery.scrollex.min.js"></script>
			<script src="view/assets/js/skel.min.js"></script>
			<script src="view/assets/js/util.js"></script>
			<script src="view/assets/js/main.js"></script>
			<script src="view/js/reservation.js"></script>
	</body>
</html>