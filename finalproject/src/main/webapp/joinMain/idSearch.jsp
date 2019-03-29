<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Bare - Start Bootstrap Template</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$("#findBtn2").click(function() {
	$.ajax({
		url:"/myfinal/find_pw.do",
		type: "POST",
		data: {
			id: $("#id").val(),
			email: $("#email").val(),
		},
		success:function(res) {
			alert(res);
		},
	})
});
</script>
<!-- Bootstrap core CSS -->

<link href="joinMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="joinMain/vendor/bootstrap/css/idSearch.css" rel="stylesheet"> -->
<style type="text/css">
#div1 {
	margin-top: 8% ;
}

#div2 {
	margin-top: 8% ;
}
fieldset {
    border: 1px solid black;
	width: 40%;
	background-color: #FAFAFA; 
	padding: 4%;
	float:left; 
	margin-right: 5%; 
	margin-left:5%;
}

hr {
	color: blue;
	width: 80%;
}
#nana {
	 margin-left:18%;
	 
}

</style>
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
	<div id="div1">
			<fieldset >
				<h5>아이디 찾기</h5>	
				<hr/>
				<br/>
				<div>
					이메일&emsp;&emsp;<input type="text" name="email1" id="email1" style="width: 50%;">	
				</div>
				<br/>
				<br/>
					<p id="nana"></p>
				<br/>
				<br/>
				<div style="margin-left: 27%;">
					<button type="button" id="findBtn">찾기</button>&emsp;
					<button type="button" onclick="history.go(-1);">취소</button>
				</div>
			
			</fieldset>

		<form action="find_pw.do" method="post">
		<fieldset>
			<h5>비밀번호 찾기</h5>
			<hr/>
			<br/>
			<div>
				아이디&emsp;&emsp;<input type="text" id="id" name="id" style="width: 50%;"/>
			</div>
			<br/>
			<div>
				이메일&emsp;&emsp;<input type="text" id="email" name="email" style="width: 50%;"/>
			</div>
			<br/>
			<p id="test"></p>
			<br/>
			<div style="margin-left: 27%;">
				<button type="submit" id="findBtn2" >찾기</button>&emsp;
				<button type="button" onclick="history.go(-1);">취소</button>
			</div>
		</fieldset>
		</form>
	</div>

	
	
   <!-- Bootstrap core JavaScript -->
   <script src="joinMain/vendor/jquery/jquery.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/idSearch.js"></script>
  
</body>

</html>