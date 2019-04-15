<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>KH Air</title>
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

#errCustID2 {
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
#joinBtn {
	margin-top: 5%;
	margin-left: 20%;
    padding: 2% 10% 2% 10%;
    text-align: center;
}

#joinCancle {
	margin-top: 5%;
	margin-left: 12%;
    padding: 2% 10% 2% 10%;
    text-align: center;
}
body.subpage {
		padding-top: 3.125em;
	}

	@-moz-keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

	@-webkit-keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

	@-ms-keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

	@keyframes reveal-header {
		0% {
			top: -4em;
			opacity: 0;
		}

		100% {
			top: 0;
			opacity: 1;
		}
	}

	#header {
		background-color: transparent;
		color: #fdd1d1;
		cursor: default;
		height: 3.25em;
		left: 0;
		line-height: 3.25em;
		position: fixed;
		text-align: right;
		top: 1em;
		width: 100%;
		z-index: 10001;
		padding: 0 1.5em;
	}

		#header.alt {
			top: 0;
			background: #F64747;
		}

		#header .logo {
			display: inline-block;
			height: inherit;
			left: 1.5em;
			line-height: inherit;
			margin: 0;
			padding: 0;
			position: absolute;
			top: 0;
		}

			#header .logo a {
				font-size: 1.25em;
				color: black;
				font-weight: 600;
				text-decoration: none;
			}

				#header .logo a:hover {
					color: black;
				}

			#header .logo span {
				font-weight: 300;
				font-size: .8em;
				color: black;
			}

		#header > a {
			-moz-transition: color 0.2s ease-in-out;
			-webkit-transition: color 0.2s ease-in-out;
			-ms-transition: color 0.2s ease-in-out;
			transition: color 0.2s ease-in-out;
			display: inline-block;
			color: inherit;
			text-decoration: none;
		}

			#header > a[href="#menu"] {
				text-decoration: none;
				-webkit-tap-highlight-color: transparent;
				background: rgba(255, 255, 255, 0.15);
				border-radius: 100%;
				height: 2.5em;
				width: 2.5em;
				line-height: 2.5em;
				color: #FFF;
				text-align: center;
			}

				#header > a[href="#menu"]:before {
					content: "";
					-moz-osx-font-smoothing: grayscale;
					-webkit-font-smoothing: antialiased;
					font-family: FontAwesome;
					font-style: normal;
					font-weight: normal;
					text-transform: none !important;
				}

				#header > a[href="#menu"]:hover {
					color: rgba(255, 255, 255, 0.25);
					background: none;
					box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.25);
				}

				#header > a[href="#menu"]:before {
					margin: 0;
				}

				#header > a[href="#menu"] span {
					display: none;
				}

			@media screen and (max-width: 736px) {

				#header > a {
					padding: 0 0.5em;
				}

			}

	@media screen and (max-width: 980px) {

		body.subpage {
			padding-top: 50px;
		}

		#header {
			height: 50px;
			line-height: 50px;
		}

			#header > h1 {
				left: 1em;
			}

				#header > h1 a {
					font-size: 1em;
				}

	}

	@media screen and (max-width: 480px) {

		#header {
			min-width: 320px;
			top: 0;
			font-size: .9em;
			background: rgba(0, 0, 0, 0.9);
		}

	}
h2 {
	text-align: center;
}
.container2 {
	font-family: sans-serif;
	width: 70%;
	padding-left: 30%;
    padding-top: 7%;
}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- Bootstrap core CSS -->
<link href="joinMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<meta charset="utf-8">
</head>
<body>
	<!-- Header -->
	<header id="header">
		<div class="logo"><a href="main.do">KH AIR <span>(주)</span></a></div>
		<a href="#menu"><span>Menu</span></a>
	</header>
	

	<!-- Page Content -->
	<form action="/myfinal/joinInsert.do" method="post" id="joinForm">
	<div class="table_area">
	
		
		<br/><br/><br/><br/><br/>
			<h2>회원가입</h2>
			<br/>
			<hr/>
			<fieldset>
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
						<p class="error_msg dp_none" id="errCustID2"></p> 
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="need">
						<label for="password">비밀번호</label>
					</th>
					<td>
						<div class="cell">
							<input type="password" id="password" name="pass" class="inputText" maxlength="15">
							<p class="guide_txt_02" style="display:contents;">&emsp;비밀번호는 공백없이 6~15자 이내</p>
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
							<input type="password" id="passwordCheck" class="inputText" maxlength="15"><span><h7 id="passwdCheckMessage" style="font-color: red;"></h7></span>
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
							<input type="text" class="inputText" name="name" id="name" data-rule-required="true" maxlength="4" onkeyup="nameFunction()">
						</div>
						<p class="error_msg dp_none" id="errCustNm"></p> <!-- DEV. dp_none 클래스 추가시 해당 부분 hide -->
					</td>
				</tr>

				<tr>
					<th scope="row" class="need">
						<label for="custPhone">휴대폰 번호</label>
					</th>
					<td>
						<div class="cell">
							<input type="tel" name="phonenum" id="phoneNum01"  class="inputText">
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="need">이메일</th>
					<td>
					
						<div class="cell">   
						   <input type="text" name="email" id="email01" class="inputText" > @ <input type="text" name="email2" id="email02" class="inputText">
						      <select id="email" name="selectEmail" class="inputText">
						         <option value="1" selected>직접입력</option>
						         <option value="naver.com" >naver.com</option>
						         <option value="daum.net">daum.net</option>
						         <option value="nate.com">nate.com</option>
						         <option value="gmail.com">gmail.com</option>
						         <option value="hanmail.net">hanmail.net</option>
						      </select>  
						   <input type="button" id="emailCheck" value="중복확인" onclick="emailFunction()">
						   <input type="button" id="checkbutton" value="전송">
						</div>

			
						<p class="error_msg" id="errMobileNo"></p> <!-- DEV. dp_none 클래스 추가시 해당 부분 hide -->
						
						<div>
							<input type="hidden" id="emma_cerf_num">
							
							<input type="text" name="inputCode" id="inputCode" class="inputText" placeholder="Enter code">
							<input type="button" value="확인" class="btn_check" id="checkcode" onclick="check_button()"/>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="need">성별</th>
					<td>
						<div class="cell">
							<select id="gender" name="gender" class="inputText">
								<option value="남">남</option>
								<option value="여">여</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="need">생년월일</th>
					<td>
						<div class="cell" style="padding-top: 15px;">
							<select name="birth01">
						       <option value="2007">2007</option>
						       <option value="2006">2006</option>
						       <option value="2005">2005</option>
						       <option value="2004">2004</option>
						       <option value="2003">2003</option>
						       <option value="2002">2002</option>
						       <option value="2001">2001</option>
						       <option value="2000">2000</option>
						       <option value="2013">1999</option>
						       <option value="2012">1998</option>
						       <option value="2011">1997</option>
						       <option value="2010">1996</option>
						       <option value="2009">1995</option>
						       <option value="2008">1994</option>
						       <option value="2013">1993</option>
						       <option value="2012">1992</option>
						       <option value="2011">1991</option>
						       <option value="2010">1990</option>
						       <option value="2009">1989</option>
						       <option value="2008">1988</option>
						       <option value="2008">1987</option>
						       <option value="2013">1986</option>
						       <option value="2012">1985</option>
						       <option value="2011">1984</option>
						       <option value="2010">1983</option>
						       <option value="2009">1982</option>
						       <option value="2008">1981</option>
						     </select>년&nbsp;
						     <select name="birth02">
						       <option value="1">01</option>
						       <option value="2">02</option>
						       <option value="3">03</option>
						       <option value="4">04</option>
						       <option value="5">05</option>
						       <option value="6">06</option>
						       <option value="7">07</option>
						       <option value="8">08</option>
						       <option value="9">09</option>
						       <option value="10">10</option>
						       <option value="11">11</option>
						       <option value="12">12</option>
						     </select>
						     <select name="birth03">
						       <option value="1">01</option>
						       <option value="2">02</option>
						       <option value="3">03</option>
						       <option value="4">04</option>
						       <option value="5">05</option>
						       <option value="6">06</option>
						       <option value="7">07</option>
						       <option value="8">08</option>
						       <option value="9">09</option>
						       <option value="10">10</option>
						       <option value="11">11</option>
						       <option value="12">12</option>
						       <option value="13">13</option>
						       <option value="14">14</option>
						       <option value="15">15</option>
						       <option value="16">16</option>
						       <option value="17">17</option>
						       <option value="18">18</option>
						       <option value="19">19</option>
						       <option value="20">20</option>
						       <option value="21">21</option>
						       <option value="22">22</option>
						       <option value="23">23</option>
						       <option value="24">24</option>
						       <option value="25">25</option>
						       <option value="26">26</option>
						       <option value="27">27</option>
						       <option value="28">28</option>
						       <option value="29">29</option>
						       <option value="30">30</option>
						       <option value="31">31</option>
					     </select>일<br><br>
						</div>
					</td>
				</tr>
				
			</tbody>
		</table>
			<input type="button" class="btn btn-secondary" id="joinBtn" value="회원가입">
			<input type="button" class="btn btn-secondary" id="joinCancle" value="취소">
		</fieldset>
	</div>
	<br/><br/><br/><br/><br/>
	</form>
	
	
	<script src="joinMain/vendor/bootstrap/js/join.js"></script>
	<script src="joinMain/vendor/bootstrap/js/sendMail.js"></script>

</body>

</html>
