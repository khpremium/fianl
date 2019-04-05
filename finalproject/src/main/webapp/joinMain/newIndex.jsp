<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Road Trip by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" href="joinMain/assets/css/main.css" />
		<link href="joinMain/vendor/bootstrap/css/index.css" rel="stylesheet">
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
				<div class="logo"><a href="index.html">Road Trip <span>by TEMPLATED</span></a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
			<p>
				<c:if test="${!empty sessionScope.id}">
                 	${sessionScope.id}님 환영합니다
                 	<a href="/myfinal/newIndex.do" class="logout">로그아웃</a>
                </c:if>
                <form id="seIdfrm" action="/myfinal/setSession.do" method="get">
                	<input type="hidden" id="seId" name="seId">
                </form>
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
 								
   								/* location.href="http://localhost:8090/myfinal/naverJoin.do?email="+email+"&name="+name; */
   								
   								window.open("/myfinal/naverJoin.do?email=" +email + "&name=" + name, "naverJoin", 'width=506, height=580, left=150, top=100');
   								
							 };

							</script>
           			</fieldset>
         		</form>
         		</p>
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="/myfinal/join.do">회원가입</a></li>
					<li><a href="elements.html">Elements</a></li>
					<li style="color: rgba(255,255,255,.5);"></li>
                 	<li class="login_wrap"></li>
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
			<section id="banner" class="bg-img" data-bg="banner.jpg">
				<div class="inner">
					<header>
						<h1>This is Road Trip</h1>
					</header>
				</div>
				<a href="#one" class="more">Learn More</a>
			</section>

		<!-- One -->
			<section id="one" class="wrapper post bg-img" data-bg="banner2.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Nibh non lobortis mus nibh</h2>
							<p>01.01.2017</p>
						</header>
						<div class="content">
							<p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
						</div>
						
						<footer>
							<a href="generic.jsp" class="button alt">Learn More</a>
						</footer>
					</article>
				</div>
				<a href="#two" class="more">Learn More</a>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper post bg-img" data-bg="banner5.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Mus elit a ultricies at</h2>
							<p>12.21.2016</p>
						</header>
						<div class="content">
							<p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
						</div>
						<footer>
							<a href="generic.html" class="button alt">Learn More</a>
						</footer>
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
			<footer id="footer">
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
			</footer>

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
  
  		function setSession(id){
  			$('#seIdfrm').submit();
  		}
  </script>
			<script src="joinMain/assets/js/jquery.min.js"></script>
			<script src="joinMain/assets/js/jquery.scrolly.min.js"></script>
			<script src="joinMain/assets/js/jquery.scrollex.min.js"></script>
			<script src="joinMain/assets/js/skel.min.js"></script>
			<script src="joinMain/assets/js/util.js"></script>
			<script src="joinMain/assets/js/main.js"></script>

	</body>
</html>