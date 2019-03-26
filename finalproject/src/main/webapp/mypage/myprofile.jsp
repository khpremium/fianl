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
<style>
table.type09 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
	height: 60%;
	width: 100%;
}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    /* width: 350px; */
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

div.button
{

 text-align: center;

}

h1 {
        margin: 5px;
        border: 10px solid #dddddd;
        padding: 5px;
      }

      
h2 {
        margin: 5px;
        border: 10px solid #dddddd;
        padding: 5px;
      } 



</style>


<body>

	<!-- 옆 각 메뉴 태그 -->
 	 <div class="d-flex" id="wrapper">
    <!-- Sidebar -->
   	 <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Start Airline </div>
      <div class="list-group list-group-flush">
        <a href="profile.do" class="list-group-item list-group-item-action bg-light">My Profile</a>
        <a href="myreservation.do" class="list-group-item list-group-item-action bg-light">My Reservation</a>            
        <a href="passport.do" class="list-group-item list-group-item-action bg-light">Passport Insert</a> 
        <a href="#" class="list-group-item list-group-item-action bg-light">My Board</a>     
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
              <a class="nav-link" href="main.do">Home <span class="sr-only">(current)</span></a>
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
     
        <h2 align="center">My Profile</h2>
        
      <%--   <table class="type09">
    <thead>
    <tr>
        <th scope="cols">타이틀</th>
        <th scope="cols">내용</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">아이디</th>
        <td>${myprofile.id}</td>
    </tr>
    <tr>
        <th scope="row">비밀번호</th>
        <td>${myprofile.pass}</td>
    </tr>
    <tr>
        <th scope="row">성함</th>
        <td>${myprofile.name}</td>
    </tr>
    <tr>
        <th scope="row">연락처</th>
        <td>${myprofile.phonenum}</td>
    </tr>
    <tr>
        <th scope="row">포인트</th>
        <td>${myprofile.point}</td>
    </tr>
    <tr>
        <th scope="row">성별</th>
        <td>${myprofile.gender}</td>
    </tr> 
    <tr>
        <th scope="row">생년월일</th>
        <td>
        <fmt:parseDate value="${myprofile.birth}" var="birth" pattern="yyyyMMdd"/>
		<fmt:formatDate value="${birth}" pattern="yyyy년 MM월 dd일 "/>
        </td>
    </tr>    
    </tbody>
</table> --%>
          <h1>아이디 : ${myprofile.id}</h1>
       <h1>비밀번호 : ${myprofile.pass}</h1>
       <h1>성함 : ${myprofile.name}</h1>
       <h1>연락처 : ${myprofile.phonenum}</h1>
       <h1>이메일 : ${myprofile.email}</h1>       
       <h1>성별 : ${myprofile.gender}</h1>
       <h1>생년월일 :
        <fmt:parseDate value="${myprofile.birth}" var="birth" pattern="yyyyMMdd"/>
		<fmt:formatDate value="${birth}" pattern="yyyy년 MM월 dd일 "/>
	   </h1>
	   <h1>포인트 : ${myprofile.point}</h1>       
      
     
     <div class="button">
     <br/>
    <input type="button" class="btn btn-primary btn-lg" value="정보 수정" onclick=""/>
    <input type="button" class="btn btn-primary btn-lg" value="회원 탈퇴" onclick=""/>
	</div>
       
        
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
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>
