<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http=equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NaverLoginSDK</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<!-- LoginWithNaverId Javascript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	
	<!-- LoginWithNaverId 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{sKTdXgHmzw9vu1NzZSKv}",
				callbackUrl: "{http://localhost:8090/myfinal/naverJoin.do}",
				isPopup: false,
				callbackHandle: true
			}		
		);
		
		/* 네이버 아이디 로그인 초기화 위해 init를 호출 */
		naverLogin.init();
	  	
       	$.ajax({
      		type: 'GET',
      		url: '/myfinal/naverJoin.do?' ,
      		data: {'email' :email, 'name':name},
      		success:(res){
      			alert(res);
      		}, 
      		error:(err){
      			alert(err);
      		}
      	}); 
        	
		/* callback처리 정상적으로 완료될 경우 main page로 redirect */
		window.addEventListener('load', function() {
			naverLogin.getLoginStatus(function(status){
				if(status) {
					/* 필수적으로 받아야하는 정보 있으면 callback처리 */
					var email = naverLogin.user.getEmail();
					if(email == undefined || email == null){
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* 사용자 정보 재동의를 위해 다시 동의페이지로 이동 */
						naverLogin.reprompt();
						return;
					}
					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/myfinal/index.do");
				}else {
					console.log("처리에 실패하였습니다");
				}
			});
		
		naverLogin.getLoginStatus(function(status) {
			if(status) {
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getNickName();
				var gender = naverLogin.user.getGender();
			}else {
				console.log("올바르지 않습니다");
			}
		});
	});
	</script>
</body>
</html>