<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Road Trip by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Road Trip by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" href="Son_cus/assets/css/main.css" />
		<link href="Son_cus/vendor/bootstrap/css/index.css" rel="stylesheet">
		<style type="text/css">
			.idSave{
				color: black !important;
				margin-top:5%;
			}
			.logout{
				text-decoration: none;
				cursor: pointer;
				color: #fff !important;
			}
			.login{
				cursor: pointer;
				text-decoration: none;
				color: #fff !important;
			}
			#login{
				margin-left: 30%; 
				background-color:#f64242 !important;
				height: 95px !important;
			}
			#naver_id_login {
				margin-top: -110px;
				margin-left: 185px;
			}
		</style>
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="helpMain.do">Road Trip <span>by TEMPLATED</span></a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
			<p>
				<c:if test="${!empty sessionScope.id}">
                 	${sessionScope.id}님 환영합니다
                 	<a href="/myfinal/newIndex.do" class="logout">로그아웃</a>
                </c:if>
            </p>
            <p class="login_wrap">
                <c:if test="${empty sessionScope.id}">
					<a class="login">로그인</a>
                </c:if>
                   <!-- 로그인 폼 -->
						<form name="log_f" id="login_f" method="post" action="/myfinal/loginCheck.do">
						<fieldset>

 						<legend style="color:black ;">로그인</legend>
							<p class="user_id">
							    <input type="text" name="id" id="id" placeholder="아이디" style="width:60%; color: black;">
							</p>
							<p class="user_pw">
							    <input type="password" name="pass" id="pass" placeholder="비밀번호"  style="width:60%; color: black;">
							</p>
							<p class="idSave">
							    <input type="checkbox" name="idSave" id="idSave">아이디 저장
							</p>
							<p class="log_btn">
							    <input type="button" id="login" value="로그인" />
							</p>
							
							<p class="join_btn_wrap">
							    <a href="/myfinal/join.do" style="padding-right:25px; text-decoration:none;">회원가입</a>
								<a href="/myfinal/idSearch.do" class="sch_id_btn" style="text-decoration:none;">아이디/비밀번호찾기</a>
							</p>
							<div>
								
							</div>
							<br/>
								<p class="login_close_btn">
								    <a href="#">
								   	 <img src="img/login_close_btn.gif" alt="닫기버튼" />
								    </a>
								</p>
							
							<div id="naver_id_login"></div>

							
							<script type="text/javascript">
							var naver_id_login = new naver_id_login("sKTdXgHmzw9vu1NzZSKv", "http://localhost:8090/myfinal/newIndex.do?");
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("white", 2,40);
							naver_id_login.setDomain("https://nid.naver.com/oauth2.0/authorize");
							naver_id_login.setState(state);
							naver_id_login.init_naver_id_login();
							// 접근 토큰 값 출력
						  /*alert(naver_id_login.oauthParams.access_token); */
							// 네이버 사용자 프로필 조회
							naver_id_login.get_naver_userprofile("naverSignInCallback()");
							// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
							function naverSignInCallback() {
								/* alert(naver_id_login.getProfileData('email'));
								alert(naver_id_login.getProfileData('name')); */
								var email = naver_id_login.getProfileData('email');
								var name = naver_id_login.getProfileData('name');
 									
   								location.href="http://localhost:8090/myfinal/naverJoin.do?email="+email+"&name="+name;
							 };

							</script>
           			</fieldset>
         		</form>
         		
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="/myfinal/join.do">회원가입</a></li>
					<li><a href="elements.html">Elements</a></li>
					<!-- <li style="color: rgba(255,255,255,.5);"></li> -->
                 	<li class="login_wrap"></li>
				</ul>
			</nav>


		<!-- Scripts --><!-- Bootstrap core JavaScript -->
  <script src="joinMain/vendor/jquery/jquery.min.js"></script>
  <script src="joinMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="joinMain/vendor/bootstrap/js/login.js"></script>
  <script src="joinMain/vendor/bootstrap/js/join.js"></script>
  <script type="text/javascript">
  $(document).ready(
		function() {
			 $("#login_f").css({ display: "none" });

			/* 로그인 닫기 */
			$('#login_f .login_close_btn>a, input[alt="로그인버튼"]').on('click',
					function() {
						$('#login_f').animate({
							top : '-500px'
						}, 500);
						$('.links').animate({'margin-top': '0'},400);
						return false;
					});
			
			/* 로그인 버튼 */
			$('.login_wrap>a').on('click', function() {
				 $("#login_f").css({ display: "inline" });
				$('#login_f').animate({
					top : '85px'
				}, 500);
				$('.links').animate({'margin-top': '300px'},600);
				return false;
			});
		});
  </script>
			<script src="Son_cus/assets/js/jquery.min.js"></script>
			<script src="Son_cus/assets/js/jquery.scrolly.min.js"></script>
			<script src="Son_cus/assets/js/jquery.scrollex.min.js"></script>
			<script src="Son_cus/assets/js/skel.min.js"></script>
			<script src="Son_cus/assets/js/util.js"></script>
			<script src="Son_cus/assets/js/main.js"></script>

	</body>
</html>