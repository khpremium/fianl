<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">



/*레디*/
$(document).ready(function(){ 
	 
	 $('#update').bind('click',updateRun);
	 $('#delete').bind('click',deleteRun);

	 
function updateRun(e){
	$('.passfir').removeClass("passsec");
	e.preventDefault();
	$('#update').on('click',passtest);
}// updaterun

function passtest(){
	alert("테스트시작");
	if($('.passfir').val()=="${myprofile.pass}"){
		alert("수정시작");
		if(!/^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test($("#pass").val())){
			alert('숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
			return false;
		}else{
			$('#frm').attr('action','update.do').submit();	
			alert("수정완료");
			return false;
		}
	} else{
		alert("비밀번호가 틀립니다.");
		return false;
	}

}//passtest

function deleteRun(e){	
	$('.passfir').removeClass("passsec");
	e.preventDefault();
	$('#delete').on('click',deltest);
} // deleterun

function deltest(){
	if($('.passfir').val()=="${myprofile.pass}"){
		alert("탈퇴시작");
		$('#frm').attr('action','delete.do').submit();
		alert("탈퇴가 완료되었습니다.");		
	}else{
		alert("비밀번호가 틀립니다.");
		return location.reload();
	}
}
	
	
	
    
});/*레디 끝*/


  
</script>
<style type="text/css">
input{
	text-align: center;
	font: bold;
}

.passfir{
	 width : 30px;
	 text-align: left;
 	 margin-left: 3%;
}

.passsec{
	visibility: hidden;
}

.passsec{
	 width : 30px;
	 text-align: left;
 	 margin-left: 3%;
}

</style>

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
					<li><a href="view/index.html">Home</a></li>
					<li><a href="view/generic.html">Join Us</a></li>
					<li><a href="view/elements.html">Priview</a></li>
					<li><a href="">Board</a></li>
					<li><a href="">My Page</a></li>
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
		

		<!-- Two -->
	<section id="two" class="wrapper post bg-img" data-bg="three.jpg">
		<div class="inner">
			<article class="box">
				<header>
							<h2>회원 정보</h2>
							<p>회원 정보 확인 및 수정</p>
			</header>
				<form name="frm" id="frm" method="post">
						
				<div class="row uniform" style="padding:10px;">
				
					<div class="6u 12u$(xsmall)">
							<label for="id">아이디</label>
						<input name="id" id="id" type="text" readonly value="${myprofile.id}">
					</div>
						
					<div class="6u$ 12u$(xsmall)">
						<label for="name">이름</label>
						<input name="name" id="name" type="text" readonly value="${myprofile.name}">
					</div>
						
						
						
					<div class="6u 12u$(xsmall)">
						<label for="pass">비밀번호 수정</label>
						<input name="pass" id="pass" type="password" placeholder="수정할 비밀번호">

					</div>
						
					<div class="6u$ 12u$(xsmall)">
						<label for="phonenum">연락처 수정</label>
						<input name="phonenum" id="phonenum" type="text" placeholder="수정할 전화번호" value="${myprofile.phonenum}">
					</div>
							
					<div class="6u 12u$(xsmall)">
						<label for="email">이메일 수정</label>
						<input name="email" id="email" type="email" placeholder="수정할 이메일" value="${myprofile.email}">
					</div>
						
					<div class="6u$ 12u$(xsmall)">
						<label for="gender">성별</label>
						<input name="gender" id="gender" type="text"  readonly value="${myprofile.gender}">
					</div>
							
					<div class="6u 12u$(xsmall)">
						<label for="birth">생년월일</label>
						<input name="birth" id="birth" type="text" readonly value="${myprofile.birth}">
					</div>
					
					<div class="6u$ 12u$(xsmall)">
						<label for="point">포인트</label>
						<input name="point" id="point" type="text" readonly value="${myprofile.point}">
					</div>
							
				</div>
				<br/>
					<footer>
					<input type="hidden" name="id" value="${myprofile.id}"/>
							<!-- <a href="generic.html" class="button">수정</a>&nbsp;
							<a href="generic.html" class="button special">회원 탈퇴</a> -->
							<input type="text" class="passfir passsec" placeholder="변경 전 비밀번호">
							<br/>
							<br/>
							<input type="button" id="update" class="btn btn-primary btn-lg" value="정보 수정"/>
    						<input type="button" id="delete" class="btn btn-primary btn-lg" value="회원 탈퇴"/>
					</footer>
				</form>
			</article>
		</div>
				<a href="#three" class="more">Learn More</a>
	</section>

		<!-- Three -->
			<section id="three" class="wrapper post bg-img" data-bg="banner4.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Varius a cursus aliquet</h2>
							<p>11.11.2016</p>
						</header>
						<div class="content">
							<p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
						</div>
						<footer>
							<a href="generic.html" class="button alt">Learn More</a>
						</footer>
					</article>
				</div>
				<a href="#four" class="more">Learn More</a>
			</section>

		<!-- Four -->
			<section id="four" class="wrapper post bg-img" data-bg="banner3.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Luctus blandit mi lectus in nascetur</h2>
							<p>10.30.2016</p>
						</header>
						<div class="content">
							<p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
						</div>
						<footer>
							<a href="generic.html" class="button alt">Learn More</a>
						</footer>
					</article>
				</div>
			</section>

		<!-- Footer -->
			<!-- <footer id="footer">
				<div class="inner">

					<h2>Contact Me</h2>

					<form action="#" method="post">

						<div class="field half first">
							<label for="name">Name</label>
							<input name="name" id="name" type="text" placeholder="Name">
						</div>
						<div class="field half">
							<label for="email">Email</label>
							<input name="email" id="email" type="email" placeholder="Email">
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
						</div>
						<ul class="actions">
							<li><input value="Send Message" class="button alt" type="submit"></li>
						</ul>
					</form>

					<ul class="icons">
						<li><a href="#" class="icon round fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon round fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon round fa-instagram"><span class="label">Instagram</span></a></li>
					</ul>

					<div class="copyright">
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
					</div>

				</div>
			</footer> -->

		<!-- Scripts -->
			<script src="view/assets/js/jquery.min.js"></script>
			<script src="view/assets/js/jquery.scrolly.min.js"></script>
			<script src="view/assets/js/jquery.scrollex.min.js"></script>
			<script src="view/assets/js/skel.min.js"></script>
			<script src="view/assets/js/util.js"></script>
			<script src="view/assets/js/main.js"></script>

</body>
</html>