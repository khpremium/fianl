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

	<link rel="stylesheet" href="css/reservation.css">

	<!-- 제이쿼리 -->
   <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

</head>



<script type="text/javascript">




</script>
<style type="text/css">
div.button
{

 text-align: center;

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
        <a href="#" class="list-group-item list-group-item-action bg-light">My Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">My Reservation</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">My Board</a>     
        <a href="#" class="list-group-item list-group-item-action bg-light">Passport Insert</a>
                     
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
    <%--  <h1>${passport}</h1>
     <p>
     <c:forEach var="i" begin="1" end="${passport}">
     	<input type="text" value="${i}"><br/>
     </c:forEach>
     </p>
      --%>
     
    
     
   <h2 align="center">Passport Insert</h2>
	<br/>
				<c:forEach var="i" begin="1" end="${passport}">
				<h1>탑승객 ${i}번 </h1>				
				<!-- 출발비행기 -->
				<div id="dept">
					<table>
						<tr>
							<th>한글 성명</th>
							<th>영문 성명</th>
							<th>법정 생년월일</th>
							<th>여권번호</th>
							<th>여권 만료일</th>
							<th>국가</th>
							<th>저장</th>
						</tr>						
							<tr>
							
								<td>								
								<input type="text" style="border:1px solid black;">								
								</td>
								<td>
								<input type="text" placeholder="lastname/firstname" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" placeholder="ex)1991.07.06" style="border:1px solid black;">														
								</td>
								<td>
								<input type="text" placeholder="9자리 여권번호" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" placeholder="한글로 입력해주세요" style="border:1px solid black;">
								</td>																
							  <td><input type="radio" name="cancel"/></td>							  						
							</tr>						
					</table>					
				</div>				
				<br/>
				<br/>
				</c:forEach>
							
				<div>				
				<div class="button">
				<br/>
                <input type="button" class="btn btn-primary btn-lg" value="저장하기" onclick=""/><br/>
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
