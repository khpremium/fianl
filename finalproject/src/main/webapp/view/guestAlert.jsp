<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" href="view/assets/css/main.css" />
		<script type="text/javascript">
			$(document).ready(function() {
				$('#copyBtn').on('click', function() {
					// 클립보드에 복사
					var copyText = $('#rv_code');
					copyText.select();
					document.execCommand("copy");
					alert("클립보드에 복사되었습니다.");
					return false;
				});
			});
		</script>
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="index.html">KH Air<sup>™</sup></a></div>
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
			<section id="banner" class="wrapper bg-img" data-bg="banner5.jpg">
				<div class="inner">
					<header>
						<h1>KH Air</h1>
					</header>
					<article class="box">
						<header>
							<h2>예약번호 안내</h2>
						</header>
						<div class="content">
							<span>고객님의 예약번호는</span><br><br>
							<h3>${rv_code}</h3>
							<input type="text" id="rv_code" value="${rv_code}" style="left: 50000px; position: absolute;">
							<span>입니다.</span><br><br>
						</div>
						<footer>
							<ul class="actions">
								<li><a href="#" class="button" id="copyBtn">복사</a>
									<a href="main.do" class="button">확인</a></li>
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

	</body>
</html>