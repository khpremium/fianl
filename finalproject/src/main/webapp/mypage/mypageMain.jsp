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
