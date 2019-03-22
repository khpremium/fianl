<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Bare - Start Bootstrap Template</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<!-- Bootstrap core CSS -->
<link href="joinMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="joinMain/vendor/bootstrap/css/idSearch.css" rel="stylesheet">

<meta charset="utf-8">

</head>
<body>

 <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
         <a class="navbar-brand" href="#">Start Bootstrap</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" 
               aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active">
                  <a class="nav-link" href="login.do">로그인
                     <span class="sr-only">(current)</span>
               </a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="join.do">회원가입</a>
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
	<div style="width:50%; margin-top: 8%;">
		<form action="/idSearch.do">
			<fieldset style="border: 1px solid grey">
				<p>아이디 찾기</p>
				<div>
					<input type="text" name="name" id="name" placeholder="이름">
				</div>
				<div>
					<input type="text" name="email" id="email01" class="inputText" > @ <input type="text" name="email" id="email02" class="inputText" disabled value="naver.com">
					<select name="selectEmail" id="email" name="email" class="inputText">
						<option value="1">직접입력</option>
						<option value="naver.com" selected>naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>  
				</div>
				<br/>
				<div>
					<input type="button" value="확인" onclick="check_ok()">
				</div>
				
			</fieldset>
		</form>
		
		<form>
			<fieldset>
				<p>비밀번호 찾기</p>
			</fieldset>
		</form>
	</div>
   <!-- Bootstrap core JavaScript -->
   <script src="joinMain/vendor/jquery/jquery.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/idSearch.js"></script>
  
</body>

</html>