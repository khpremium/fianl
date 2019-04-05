<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Road Trip by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="view/assets/css/main.css" />
<meta charset="UTF-8">
<title>Insert title here</title> 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
/*레디*/
$(document).ready(function(){
	
	
	
	$('#reservationchk').click(function(){
		alert('dd');
		var postString = 'rv_code='+$('#rv_code').val()+'&non_pass=' + $('#non_pass').val();
	$.ajax({
		type:'POST',
		url:'resok.do',
		dataType : 'text',
		data : postString,
		success : pros,
		error : reserror
	});//ajax 
	
	});
	
   
    
       
    
});/*레디 끝*/

function pros(res){
	alert(res);
	
	location.href="rescheckok.do";
}

function reserror(){
	alert("에러다");
}
  
</script>
</head>
<body>
		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="view/index.html">Road Trip <span>by TEMPLATED</span></a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="main.do">Home</a></li>
					<li><a href="helpMain.do">Notice</a></li>
					<li><a href="join.do">Join Us</a></li>
					<li><a href="">Priview</a></li>					
					<li><a href="login.do">Login</a></li>
					<li><a href="profile.do">My Page</a></li>
					<li><a href="myreservation.do">Reservation Check</a></li>
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->			

		<!-- One -->
		 	<section id="one" class="wrapper post bg-img" data-bg="one.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>예약 확인</h2>
							<br/>
						</header>
						
						<div class="content"> 
							<input type="text" class="query" id="rv_code" name="rv_code" placeholder="예약 번호 입력">
							<input type="text" class="query" id="non_pass" name="non_pass" placeholder="비밀 번호 입력">
							<br/>
						</div>
						
						<footer>
							<input type="submit" id="reservationchk" class="button alt" value="Reservation Search" />
						</footer>
					</article>
				</div>
			</section> 

		
		
		

		<!-- Scripts -->
			<script src="view/assets/js/jquery.min.js"></script>
			<script src="view/assets/js/jquery.scrolly.min.js"></script>
			<script src="view/assets/js/jquery.scrollex.min.js"></script>
			<script src="view/assets/js/skel.min.js"></script>
			<script src="view/assets/js/util.js"></script>
			<script src="view/assets/js/main.js"></script>

</body>
</html>