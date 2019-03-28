<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Simple Sidebar - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="mypage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="mypage/css/simple-sidebar.css" rel="stylesheet">

</head>
<style type="text/css">
.section_home .column+.column {
	float: none;
	overflow: hidden;
	width: auto;
}

.section_home .column {
	float: left;
	width: 50%;
}

#content.section_home {
	line-height: 14px;
	zoom: 1;
	padding: 16px 12px 94px;
}

.sh_group {
	min-height: 185px;
}

.sh_group, .sh_group2, .sh_group3, .sh_group4 {
	margin: 16px 8px 0;
	padding: 32px 29px 32px;
	text-align: left;
	border: 1px solid #dadada;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background: #fff;
}
</style>


<body>

	<!-- 옆 각 메뉴 태그 -->
 	 <div class="d-flex" id="wrapper">
    <!-- Sidebar -->
   	 <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Start Airline </div>
      <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action bg-light">My Reservation</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">My Board</a>        
        <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Passport</a> 
              
      </div>
    </div>
    <!-- /#sidebar-wrapper -->
	<!-- 옆 각 메뉴 태그 끝 -->
	
  
    <div id="page-content-wrapper">
		<!--  하얀색 헤더 -->
      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Total screen</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Notice</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Board</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Priview</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">My Page</a>
            </li>            
          </ul>
        </div>
      </nav>
      <!--하얀색 헤더 끝-->

	<!-- 페이지 내용 시작 -->
     <%--  <div class="container-fluid">
        <h2 class="mt-4" align="center">My Profile</h2>
        
      
       <h1>아이디 : ${myprofile.id}</h1>
       <h1>비밀번호 : ${myprofile.pass}</h1>
       <h1>성함 : ${myprofile.name}</h1>
       <h1>연락처 : ${myprofile.phonenum}</h1>
       <h1>포인트 : ${myprofile.point}</h1>
       <h1>성별 : ${myprofile.gender}</h1>
       <h1>생년월일 :
        <fmt:parseDate value="${myprofile.birth}" var="birth" pattern="yyyyMMdd"/>
		<fmt:formatDate value="${birth}" pattern="yyyy년 MM월 dd일 "/>
	   </h1>       
      </div>
         --%><div class="column">

								<!-- 프로필 설정 -->
								<div class="sh_group">
									<div class="sh_header">
										<h2>KH AIR Profile</h2>
										<!-- 	<a href="javascript:toggle('profile');"
											onclick="clickcr(this,'imn.prfhelp','','',event);"
											class="link_help"><i id="i_profile"
											class="spico ico_arr3_up">도움말</i></a> -->
										<!-- [D] 감추기 보이기 dislay:none/block -->
										<p id="p_profile" class="contxt" style="display: block;">
											고객님의 <em>'나'를 표현하는 프로필</em> 정보입니다.
										</p>

									</div>
									<div class="sh_content">
										<dl class="sh_lst">
											<dt class="nic_tit">아이디</dt>
											<dd class="nic_desc">${myprofile.id}</dd>											
											<dt>패스워드</dt>
											<dd>${myprofile.pass}</dd>
											<dt>이름</dt>
											<dd>${myprofile.name}</dd>
											<dt>성별</dt>
											<dd>${myprofile.gender}</dd>
											<dt>연락처 이메일</dt>
											<dd>${myprofile.email}</dd>
											<dt>생년월일</dt>
											<dd>
											<fmt:parseDate value="${myprofile.birth}" var="birth" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${birth}" pattern="yyyy년 MM월 dd일 "/></dd>
											<dt>포인트</dt>
											<dd>${myprofile.point}</dd>
										</dl>
									</div>
									<p class="btn_area_btm">
										<a href="membermodify.do"
											onclick="changeImage();clickcr(this,'imn.prfmodify','','',event);"
											class="btn_model"><b class="btn2">회원정보 변경</b></a>
									</p>
									<p>더이상 수컷을 사용하지 않는다면</p>
									<a href="#">회원탈퇴</a>
								</div>
								<!-- 예약관리  -->
								<%-- <div class="sh_group ">
									<div class="sh_header">
										<h2>예약 관리</h2>
										<!-- 		<a href="javascript:toggle('userInfo');"
											onclick="clickcr(this,'imn.cnthelp','','',event);"
											class="link_help"><i id="i_userInfo"
											class="spico ico_arr3_dn">도움말</i></a> -->
										<p id="p_userInfo" class="contxt" style="display: none">
											수컷 서비스중 <em>병원 예약 서비스 내역</em>입니다.
										</p>
									</div>
									<div class="sh_content">
										<dl class="sh_lst2">
											<dt>예약 내용</dt>
											<dd>${requestScope.dto.email}</dd>
										</dl>
									</div>
									<p class="btn_area_btm">
										<a
											href="/user2/help/changeUserInfo.nhn?menu=nid&amp;lang=ko_KR"
											onclick="clickcr(this,'imn.cntmodify','','',event);"
											class="btn_model"><b class="btn2">수정</b></a>
									</p>
								</div> --%>
							</div>
<form action="/myfinal/joinInsert.do" method="post">
	<div class="table_area">
	<fieldset>
	
		<table class="tbl_style_01" summary="회원가입에 필요한 개인정보를 입력함">
			<h1 style="padding-left:40%; padding-top: 5%; color: orange;">KHPREMIUM</h1>
			<hr/>
			<h3 style="padding-left:43%;">회원가입</h3>
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
							<input type="password" id="password" name="pass" class="inputText" maxlength="30">
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
							<input type="password" id="passwordCheck" class="inputText" maxlength="30"><span><h7 id="passwdCheckMessage" style="font-color: red;"></h7></span>
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
							<!-- <select id="gender" name="gender" class="inputText">
								<option value="M">남</option>
								<option value="F">여</option>
							</select> -->
						</div>
					</td>
				</tr>
				
			</tbody>
		</table>
			<input type="submit" class="btn1" id="joinBtn" value="회원가입">
			<input type="button" class="btn2" id="joinCancle" value="취소">
		</fieldset>
	</div>
	<br/><br/><br/><br/><br/>
	</form>
	
	





     <div class="button">
     <br/>
    <input type="button" class="btn btn-primary btn-lg" value="회원 정보수정" onclick=""/>
	</div> 
    </div>
    
    
       
    <!-- /#page-content-wrapper -->
	<!-- 페이지 내용 끝 -->
	
  </div>
  <!-- /#wrapper -->
	
	
	
	
  <!-- Bootstrap core JavaScript -->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#menu-toggle").text("메뉴보기");
      $("#wrapper").toggleClass("toggled");
      
    });
  </script>

</body>

</html>
