<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="view/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="view/css/scrolling-nav.css" rel="stylesheet">
<style type="text/css">
	div .mx-auto {
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
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

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<span>고객님의 예약번호는</span><br>
					<h4>${rv_code}</h4><span>입니다.</span><br>
					<a href="main.do" class="btn btn-primary">확인</a>
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
	<script src="view/vendor/jquery/jquery.min.js"></script>
	<script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="view/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom JavaScript for this theme -->
	<script src="view/js/scrolling-nav.js"></script>
</body>
</html>