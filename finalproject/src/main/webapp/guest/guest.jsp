<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/scrolling-nav.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Start
				Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">Services</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header class="bg-primary text-white">
		<div class="container text-center">
			<h1>Welcome to Scrolling Nav</h1>
			<p class="lead">A landing page template freshly redesigned for
				Bootstrap 4</p>
		</div>
	</header>

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">

					<form action="selectFlight.do" method="get">
						<table>
							<tr>
								<td>name</td>
								<td><input type="text" name="non_name"></td>
							</tr>
							<tr>
								<td>gender</td>
								<td><input type="radio" name="non_gender" value="남">남
									<input type="radio" name="non_gender" value="여">여</td>
							</tr>
							<tr>
								<td>phone</td>
								<td><input type="text" name="non_phone"
									placeholder="'-'를 제외하고 입력하세요"></td>
							</tr>
							<tr>
								<td>email</td>
								<td><input type="text" name="non_email"></td>
							</tr>
							<tr>
								<td>password</td>
								<td><input type="password" name="non_pass"></td>
							</tr>
							<tr>
								<td><input type="submit" value="전송"></td>
							</tr>
						</table>
						<input type="hidden" name="dep_date" value="${rdto.dep_date}">
						<input type="hidden" name="arv_date" value="${rdto.arv_date}">
						<input type="hidden" name="city_code_dep"
							value="${rdto.city_code_dep}"> <input type="hidden"
							name="city_code_arv" value="${rdto.city_code_arv}"> <input
							type="hidden" name="p_count" value="${rdto.p_count}"> <input
							type="hidden" name="guestchk" value="${rdto.guestchk}">
					</form>
				</div>
			</div>
		</div>
	</section>
	
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

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom JavaScript for this theme -->
	<script src="js/scrolling-nav.js"></script>
</body>
</html>