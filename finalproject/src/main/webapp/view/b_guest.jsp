<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="view/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="view/css/scrolling-nav.css" rel="stylesheet">
<link href="view/css/guestForm.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	/* var passchk = 0; */
	$(document).ready(function() {
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var phoneRule = /^[0-9]{10,11}$/;
		$('button').on('click', function() {
			if(!emailRule.test($('#non_email').val())) {
				alert('이메일을 확인해주세요.');
				return false;
			} else if(!phoneRule.test($('#non_phonenumber').val())) {
				alert('전화번호를 확인해주세요.');
				return false;
			} else {
				alert('테스트');
				$('#frm0').submit();
			}
		});
		
		$('#non_phonenumber').on('keyup', function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		/* $('#non_pass').on('keyup', function() {
			if(!/^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test($(this).val())) {
				$('#passmsg').text('안됩니다.');
				passchk = 0;
			} else {
				$('#passmsg').text('');
				passchk = 1;
			}
		}); */
	});
</script>
</head>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a>
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
					<h1 class="display-4 text-white mt-5 mb-2">Business Name or Tagline</h1>
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
					<form action="selectFlight.do" id="frm0" method="post">
						<table>
							<tr>
								<th colspan="2">정보입력</th>
							</tr>
							<tr>
								<td><label for="non_name">name</label></td>
								<td><input type="text" name="non_name" id="non_name" required="required"></td>
							</tr>
							<tr>
								<td>gender</td>
								<td><input type="radio" name="non_gender" value="남" checked="checked" required="required">남
								<input type="radio" name="non_gender" value="여" required="required">여</td>
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
						<input type="hidden" name="guestchk" value="${rdto.guestchk}">
					</form>
					<button >전송</button>
				</div>
			</div>
		</div>
	</section>

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

	<!-- Plugin JavaScript -->
	<script src="view/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom JavaScript for this theme -->
	<script src="view/js/scrolling-nav.js"></script>
</body>
</html>