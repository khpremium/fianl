<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>KH Air</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" href="view/assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<jsp:include page="../joinMain/newIndex.jsp"></jsp:include>

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
							<h2>정보입력</h2>
						</header>
						<div class="content">
							<form action="selectFlight.do" method="post">
								<table>
									<tr>
										<td><label for="non_name">name</label></td>
										<td><input type="text" name="non_name" id="non_name" required="required"></td>
									</tr>
									<tr>
										<td>gender</td>
										<td><input type="radio" id="male" name="non_gender" value="남" checked="checked" required="required">
										<label for="male">남</label>
										<input type="radio" id="female" name="non_gender" value="여" required="required">
										<label for="female">여</label>
										</td>
									</tr>
									<tr>
										<td><label for=non_phonenumber>phone</label></td>
										<td><input type="text" name="non_phonenumber" id="non_phonenumber" placeholder="'-'를 제외하고 입력하세요" required="required"></td>
									</tr>
									<tr>
										<td><label for="non_email">email</label></td>
										<td><input type="text" name="non_email" id="non_email" required="required"></td>
									</tr>
									<tr>
										<td><label for="non_pass">password</label></td>
										<td><input type="password" name="non_pass" id="non_pass" required="required"><!-- <br><div id="passmsg"></div> --></td>
									</tr>
								</table>
								<input type="hidden" name="dep_date" value="${rdto.dep_date}">
								<input type="hidden" name="arv_date" value="${rdto.arv_date}">
								<input type="hidden" name="city_code_dep" value="${rdto.city_code_dep}">
								<input type="hidden" name="city_code_arv" value="${rdto.city_code_arv}">
								<input type="hidden" name="p_count" value="${rdto.p_count}">
							</form>
						</div>
						<footer>
							<ul class="actions">
								<li><button>전송</button></li>
							</ul>
						</footer>
					</article>
				</div>
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
			<script src="view/js/guestForm.js"></script>

	</body>
</html>