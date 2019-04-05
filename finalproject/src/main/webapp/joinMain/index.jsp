<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Bare - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
<link href="joinMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="joinMain/vendor/bootstrap/css/index.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
      <a class="navbar-brand" href="index.do">KH AIR</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        		<li style="color: rgba(255,255,255,.5);">
        			<c:if test="${!empty sessionScope.id}">
	                 	${sessionScope.id}님 환영합니다
	                 	<a href="/myfinal/index.do">로그아웃</a>
	                 </c:if>
        		</li>
                 <li class="login_wrap">
	                 
	                 <c:if test="${empty sessionScope.id}">
					 	<a href="/myfinal/login.do">로그인</a>
	                 </c:if>
		          
		             <!-- 로그인 폼 -->
		               <form name="log_f" id="login_f" method="post" action="/myfinal/loginCheck.do">
		               <fieldset>
		               
		                 <legend>로그인</legend>
		                 <p class="user_id">
		                    <input type="text" name="id" id="id" placeholder="아이디" >
		                 </p>
		                 <p class="user_pw">
		                      <input type="password" name="pass" id="pass" placeholder="비밀번호">
		                 <p>
		                     <input type="checkbox" name="idSave" id="idSave" >아이디 저장
		                 </p>
		                 <p class="log_btn">
		                    <input type="button" id="login" value="로그인" style="padding: 50% 30% 50% 30%;"/>
		                 </p>
		                 
		                 <p class="join_btn_wrap">
		                     <a href="/myfinal/join.do" style="padding-right:25px; color:black; text-decoration:none;">회원가입</a>
		                     <a href="/myfinal/idSearch.do" class="sch_id_btn" style="color: black; text-decoration:none;">아이디/비밀번호찾기</a>
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
		                 
		                <!-- 네이버아이디로로그인 버튼 노출 영역 -->
						<script type="text/javascript">
							var naver_id_login = new naver_id_login("sKTdXgHmzw9vu1NzZSKv", "http://localhost:8090/myfinal/index.do?");
							var state = naver_id_login.getUniqState();
							
							naver_id_login.setButton("white", 2,40);
							naver_id_login.setDomain("https://nid.naver.com/oauth2.0/authorize");
							naver_id_login.setState(state);
							naver_id_login.init_naver_id_login();
							
							// 접근 토큰 값 출력
							alert(naver_id_login.oauthParams.access_token);
							// 네이버 사용자 프로필 조회
							naver_id_login.get_naver_userprofile("naverSignInCallback()");
							// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
							function naverSignInCallback() {
								alert(naver_id_login.getProfileData('email'));
								alert(naver_id_login.getProfileData('name')); 
								var email = naver_id_login.getProfileData('email');
								var name= naver_id_login.getProfileData('name');
								
								location.href="http://localhost:8090/myfinal/naverJoin.do?email="+email+"&name="+name;
							};
						</script>
		               </fieldset>
		             </form>
		           </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
		

  <!-- Bootstrap core JavaScript -->
  <script src="joinMain/vendor/jquery/jquery.min.js"></script>
  <script src="joinMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="joinMain/vendor/bootstrap/js/login.js"></script>
  <script src="joinMain/vendor/bootstrap/js/join.js"></script>
  <script type="text/javascript">
  $(document).ready(
		function() {
			/* 로그인 버튼 */
			$('.login_wrap>a').on('click', function() {
				$('#login_f').animate({
					top : '20px'
				}, 500);
				return false;
			});

			/* 로그인 닫기 */
			$('#login_f .login_close_btn>a, input[alt="로그인버튼"]').on('click',
				function() {
					$('#login_f').animate({
						top : '-600px'
					}, 500);
					return false;
				});
		});
  </script>
</body>
</html>
