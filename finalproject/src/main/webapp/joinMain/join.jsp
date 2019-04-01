<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Bare - Start Bootstrap Template</title>
<style type="text/css">

fieldset {
	border: none
}

.tbl_style_01 {
	width: 70%;	
	margin-left: 15%;
	margin-top:5%;
	border-collapse: collapse;
	border-spacing: 0;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
}

#errRePasswd {
	color: red;
	font-size: 11px;
}

#errCustNm {
	color: red;
	font-size: 11px;
}

#errCustID {
	color: red;
	font-size: 11px;
}

#errPasswd {
	color: red;
	font-size: 11px;
}
.need {
	background-color: #E6E6E6;
}

td {
	padding: 7px 15px;
	border-bottom: 1px solid #ddd

}
th  {
	padding: 7px 15px;
	border-bottom: 1px solid #ddd

}
.btn1 {
	margin-top: 5%;
	margin-left: 20%;
    padding: 2% 10% 2% 10%;
    text-align: center;
}

.btn2 {
	margin-top: 5%;
	margin-left: 7%;
    padding: 2% 10% 2% 10%;
    text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- Bootstrap core CSS -->
<link href="joinMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<meta charset="utf-8">
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="main.do">KH AIR</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
					<a class="nav-link" href="login.do">로그인
						<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="join.do">회원가입</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<form action="joinInsert.do" method="post">
	<div class="table_area">
	<fieldset>
	
		<h1 style="padding-left:40%; padding-top: 5%; color: orange;">KHPREMIUM</h1>
		<hr/>
		<h3 style="padding-left:43%;">회원가입</h3>
		<table class="tbl_style_01" summary="회원가입에 필요한 개인정보를 입력함">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="need">
						<label for="id">아이디</label>
					</th>
					<td>
						<div class="cell">
							<input type="text" id="id" name="id" class="inputText" onkeyup="idFunction()"  style="width:280px;" maxlength="15" ><span>&emsp;영/소문자 6자이상</span>
						</div>
						<p class="error_msg dp_none" id="errCustID"></p> <!-- DEV. dp_none 클래스 추가시 해당 부분 hide --> 
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="need">
						<label for="password">비밀번호</label>
					</th>
					<td>
						<div class="cell">
							<input type="password" id="password" name="pass" class="inputText" onkeyup="passwordCheckFunction()" maxlength="30">
							<p class="guide_txt_02" style="display:contents;">&emsp;비밀번호는 공백없이 8~15자 이내</p>
						</div>
						<p class="error_msg dp_none" id="errPasswd"></p> <!-- DEV. dp_none 클래스 추가시 해당 부분 hide -->
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="need">
						<label for="passwordCheck">비밀번호확인</label>
					</th>
					<td>
						<div class="cell">	
							<input type="password" id="passwordCheck" name="pass" class="inputText" onkeyup="passwordCheckFunction()" maxlength="30">
						</div>
						<p class="error_msg dp_none" id="errRePasswd"></p> <!-- DEV. dp_none 클래스 추가시 해당 부분 hide -->
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="need">
						<label for="custNm">이름</label>
					</th>
					<td>
						<div class="cell">	
							<input type="text" class="inputText" name="name" id="name" data-rule-required="true" maxlength="15" onkeyup="nameFunction()">
						</div>
						<p class="error_msg dp_none" id="errCustNm"></p> <!-- DEV. dp_none 클래스 추가시 해당 부분 hide -->
					</td>
				</tr>
				<!-- 
					■ 회원가입 화면 수정작업
					 -. 수정내용 : HSMALL-1914 통합멤버십 화면 변경 (2017.01.23 / 노경은계장 → 곽상은) 
					 -. 고객 클레임 방지를 위해 한샘몰 회원가입 화면의 휴대폰번호 인증부분을 상위로 옮김(멤버십 체크시에 하지 않음)
					 -. 휴대폰번호는 바로 입력이 가능하며, 인증번호 전송버튼을 누르면 해당 휴대폰번호로 인증번호 발송
					 -. 인증번호가 발송됨과 동시에 인증번호를 입력할 수 있는 박스 노출 >> certification_root
				-->
				<tr>
					<th scope="row" class="need">
						<label for="custPhone">휴대폰 번호</label>
					</th>
					<td>
						<div class="cell">
							<input type="tel" name="phonenum" id="phoneNum01"  class="inputText" maxlength="3" >-
							<input type="tel" name="phonenum" id="phoneNum02"  class="inputText" maxlength="4" >-
							<input type="tel" name="phonenum" id="phoneNum03" class="inputText"  maxlength="4" >
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="need">이메일</th>
					<td>
						<div class="cell">	
							<input type="text" name="email" id="email01" class="inputText" > @ <input type="text" name="email" id="email02" class="inputText" disabled value="naver.com">
							<select name="selectEmail" id="email" name="email" class="inputText">
								<option value="1">직접입력</option>
								<option value="naver.com" selected>naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>  
							<input type="button" id="checkbutton" value="전송">
						</div>
			
						<p class="error_msg" id="errMobileNo"></p> <!-- DEV. dp_none 클래스 추가시 해당 부분 hide -->
						
						<div>
							<input type="hidden" id="emma_cerf_num">
							
							<input type="text" name="inputCode" id="inputCode" class="inputText" placeholder="Enter code">
							<input type="button" value="확인" class="btn_check" id="checkcode" onclick="check_button()"/>
							
						<!-- 	<input type="text" placeholder="인증번호 입력" style="width:306px" id="cerfi_own_phone"> 
							<button type="button" class="botton_st_03 gray" onclick="certification.confirmCertification();">확인</button>
							<button type="button" class="botton_st_03 gray" onclick="certification.cerfi_trans_cancel();">취소</button>
							<button type="button" class="botton_st_03" onclick="certification.getNumber();">인증번호 재전송</button>
							<p class="space_02"><span class="point_txt" id="cerfi_err_msg" style="display:none;">인증번호를 정확히 입력해 주세요.</span></p> -->
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="need">성별</th>
					<td>
						<div class="cell">
							<select id="gender" name="gender" class="inputText">
								<option value="M">남</option>
								<option value="F">여</option>
							</select>
						</div>
					</td>
				</tr>
				
			</tbody>
		</table>
			<input type="button" class="btn1" id="joinBtn" value="회원가입">
			<input type="button" class="btn2" id="joinCancle" value="취소">
		</fieldset>
	</div>
	<br/><br/><br/><br/><br/>
	</form>
	
	
	<!-- Bootstrap core JavaScript -->
	<!-- <script src="joinMain/vendor/jquery/jquery.min.js"></script>
	<script src="joinMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<script src="joinMain/vendor/bootstrap/js/join.js"></script>
	<script src="joinMain/vendor/bootstrap/js/sendMail.js"></script>

</body>

</html>
