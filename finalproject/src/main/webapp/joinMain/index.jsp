<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>

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
		                    <input type="image" src="img/login_btn.gif" id="login" alt="로그인버튼" />
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
							top : '-500px'
						}, 500);
						return false;
					});
		});
  </script>
</body>
</html>
