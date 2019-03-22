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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#login').on('click',function(){
		$('#login_f').attr('action', 'loginCheck.do').submit();
		
	}); 
});

$(document).ready(function() {
	$('#btn').click(function(){
		$.ajax({
			type: 'GET',
			dataType: 'text',
			url:'searchOpen.do?search=' +$('#search').val(),
			success:viewMessage
		});
	});
});

function viewMessage(res) {
	alert(res);
}


</script>
<!-- Bootstrap core CSS -->
<link href="joinMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="joinMain/vendor/bootstrap/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="utf-8">
<style>
input[type=text], select {
  width: 70%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=button]{
  width: 70%;
  background-color:#848484;
  color: white;
  padding: 14px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #848484;
}

body {
	
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}

</style>

</head>
<body>

 <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
         <a class="navbar-brand" href="index.do">KH AIR</a>
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

    <div style="margin-top:5%; padding-left: 12%;" class="form">
      <form name="loginFrm" id="loginFrm" method="post" >
	      <div>
	         <input type="text" name="id" id="id" placeholder="아이디" >
	      </div>
	      <div>
	         <input type="password" name="pass" id="pass" placeholder="비밀번호">
	      </div>
      </form>
      <div>
      
         <input type="button" id="login"  value="로그인">
       
      </div>
      
      <div>
         <input type="checkbox" name="idSave" id="idSave" >아이디 저장
      </div>
      <hr style="width:55%"/>
      <div>
         &nbsp;&emsp;<a href="idSearch.do">아이디찾기</a>&nbsp;&emsp;&emsp;&emsp;|&nbsp;&emsp;&emsp;&emsp;<a href="#">비밀번호 찾기</a>
      </div>
      <br/>
    
    
      <form action="kakaologin.do" method="get">
      <div>
      	<a id="kakao-login-btn"></a>
      	<a href="http://developers.kakao.com/logout"></a>
      </div>
      
      <div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
	</form>
      
   </div>



   <!-- Bootstrap core JavaScript -->
   <script src="joinMain/vendor/jquery/jquery.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="joinMain/vendor/bootstrap/js/login.js"></script>
   <script>

 //카카오 로그인
  //<![CDATA[
     // 사용할 앱의 JavaScript 키를 설정해 주세요.
     Kakao.init('6e45410a007c16fac29658edd3ec88db');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
     // 카카오 로그인 버튼을 생성합니다.
     Kakao.Auth.createLoginButton({ 
     	container: '#kakao-login-btn', 
     	success: function(authObj) { 
     		alert(JSON.stringify(authObj)); 
     	},
     	fail: function(err) { 
     		alert(JSON.stringify(err)); 
     	}
     })
 	
     $(document).ready(function(){
     	$('#kakao-login-btn').on('click', function(){
     		Kakao.Auth.login({
     			success: function(authObj){
     				// alert(JSON.stringify(authObj));
     				Kakao.API.request({
     					url:'/v2/user/me',
     					success: function(res){
     							alert(res);
     							alert(JSON.stringify(res)); 
     						location.href='/myjoin/kakaologin.do';
     					}
     				});
     			}
     		});
     	});
     });
   //]]>
   </script>
</body>

</html>