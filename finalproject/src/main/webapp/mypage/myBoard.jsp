<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

$(document).ready(function(){
	
	
});



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
        <a href="profile.do" class="list-group-item list-group-item-action bg-light">My Profile</a>
        <a href="myreservation.do" class="list-group-item list-group-item-action bg-light">My Reservation</a>
        <a href="passport.do" class="list-group-item list-group-item-action bg-light">Passport Insert</a>
        <a href="myboard.do" class="list-group-item list-group-item-action bg-light">My Board</a>
                     
      </div>
    </div>
    <!-- /#sidebar-wrapper -->
	<!-- 옆 각 메뉴 태그 끝 -->
	
  
     <div id="page-content-wrapper">
		<!--  하얀색 헤더 -->
       <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <!-- <button class="btn btn-primary" id="menu-toggle">전체메뉴 숨기기</button> -->

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
    <div>
     <h1 style="text-align: center;">My Boad</h1>
     <table style="width:100%; text-align: center;" ><!--밑줄부터-->
     	<thead>
    <tr>
      <th scope="col">number</th>
      <th scope="col">Title</th>
      <th scope="col">Writer</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${myblist}" var="myblist">
  <tr class="table-active">  
  	 <th scope="row" onclick="">${myblist.b_num}</th>
  	 
      <td>${myblist.title}</td>      
      <td>${myblist.user_id}</td>
      <td>${myblist.upload_date}</td>
      </tr>
   </c:forEach>    
   </tbody>   
   </table>
    </div>
    
    <div class="btn-group mr-2" role="group" aria-label="First group">
   <c:if test="${pv.startPage>1}">
			<a href="myboard.do?currentPage=${pv.startPage-pv.blockPage}">이전</a>
		  </c:if>
   <!-- <button type="button" class="btn btn-secondary">1</button>
   <button type="button" class="btn btn-secondary">2</button>
   <button type="button" class="btn btn-secondary">3</button>
   <button type="button" class="btn btn-secondary">4</button> -->
   <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<span>
			  <c:url var="currPage" value="myboard.do">			
				<c:param name="currentPage" value="${i}"/>
			  </c:url>
              <c:choose>
                <c:when test="${i==pv.currentPage}">
                   <a href="${currPage}" class="btn btn-secondary"> <c:out value="${i}" /></a>
                </c:when> 
			    <c:otherwise>	
			       <a href="${currPage}" class="btn btn-secondary" > <c:out value="${i}" /></a>
			     </c:otherwise>			
			  </c:choose>
			</span>
		</c:forEach>
   
   </div>
     
    
    
    
 
	<!-- 페이지 내용 끝 -->
	
  </div>
  <!-- /#wrapper -->
	
	
	
	
  <!-- Bootstrap core JavaScript -->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
  var menuChk = true;
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    if(menuChk){
    $("#menu-toggle").text("전체메뉴 보기");
    menuChk = false;
    }else{
  	  $("#menu-toggle").text("전체메뉴 숨기기");
  	  menuChk = true;
    }
    $("#wrapper").toggleClass("toggled");
  });
  </script>

</body>

</html>
