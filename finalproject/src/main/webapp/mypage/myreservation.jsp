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

$(document).ready(function(){
	$('input[type="submit"]').on('click',function(e){
		if($('input[name="cancel"]').val()==''){
			alert("예약된 내용이 없습니다.");
			return;
		}
		$('.del_chk').removeClass("del_none");
		e.preventDefault();
		$('input[type="submit"]').on('click',res_chk);
	});
	
	
});

function res_chk(){
	if($('.del_chk').val()=="${myres[1].rv_code}"){
		$('form').submit();
		
	alert("예약이 취소되었습니다.");
	}
	else if($('.del_chk').val()==null){
		alert("예약된 내용이 없습니다.");
	}
}

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

input[type="text"]{
	text-align: center;
}

.del_none{
	visibility: hidden;
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
       <!--  <button class="btn btn-primary" id="menu-toggle">전체메뉴 숨기기</button> -->

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
     
    <h2 align="center">My Reservation</h2>
	<br/>
				
				<h1>출국 항공기 예약 내용</h1>
				<form action="reservation_delete.do" method="post">				
				<!-- 출발비행기 -->
				<div id="dept">
				
					<table>
						<tr>
							<th>항공사</th>
							<th>편명</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>성함</th>
							<th>예약번호</th>
							<th>탑승객 수</th>
							
						</tr>
						
							<tr>
							
								<td>${myres[1].airline}</td>
								<td>${myres[1].airinfo_flight}</td>
								<td>${myres[1].city_name}</td>
								<td>${myres[0].city_name}</td>
								<td>
								<fmt:parseDate value="${myres[1].d_time}" var="dtime" pattern="yyyyMMddHHmm"/>
								<fmt:formatDate value="${dtime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>														
								</td>
								<td>
								<fmt:parseDate value="${myres[1].a_time}" var="atime" pattern="yyyyMMddHHmm"/>
								<fmt:formatDate value="${atime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
								</td>
								<td>${myres[1].name}</td>
								<td>${myres[1].rv_code}</td>
								<td>${myres[1].p_count}</td>								
							  							  						
							</tr>						
					</table>
					
				</div>
				<input type="hidden" name="cancel" value="${myres[1].rv_code}"/>
				<br/>
				<br/>
				
				<h1>귀국 항공기 예약 내역</h1>				
				<!-- 도착비행기 -->
				<div id="arrv">
					<table>
						<tr>
							<th>항공사</th>
							<th>편명</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>성함</th>
							<th>예약번호</th>
							<th>탑승객 수</th>
							
						</tr>
						
							<tr>
							
								<td>${myres[0].airline}</td>
								<td>${myres[0].airinfo_flight}</td>
								<td>${myres[0].city_name}</td>
								<td>${myres[1].city_name}</td>
								<td>
								<fmt:parseDate value="${myres[0].d_time}" var="dtime" pattern="yyyyMMddHHmm"/>
								<fmt:formatDate value="${dtime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
								</td>
								<td>
								<fmt:parseDate value="${myres[0].a_time}" var="atime" pattern="yyyyMMddHHmm"/>
								<fmt:formatDate value="${atime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
								</td>
								<td>${myres[0].name}</td>
								<td>${myres[0].rv_code}</td>
								<td>${myres[0].p_count}</td>
							  							  						
							</tr>
						
					</table>
					
				</div>
				
				 		
                </form>
                			
				<div class="button">
				<br/>
                <input type="submit" class="btn btn-primary btn-lg" value="예약취소" />
                <br/>
                
                <input type="text" class="del_chk del_none" placeholder="예약번호 입력">
                
                </div>
                <br/>
				<br/>
	<p>&nbsp; &#187; 항공권 환불금액은 전구간과 부분사용의 환불규정 및 환불금액이 다르므로 환불 요청시 반드시 해당 요금의 환불 규정을 확인해주시기 바랍니다.</p>
    <p>&nbsp; &#187; 기상 또는 항공사 사정에 의하여 사전 통보없이 스케쥴 변동 및 취소가 발생할 수 있으므로 출/귀국시 72시간전 해당항공사로 재확인하여 주시기 바랍니다.</p>
    <p>&nbsp; &#187; 예약 재확인은 필수 사항이며 재확인하지 않아 발생되는 문제는 여행사에서 책임지지 않습니다.</p>
    <p>&nbsp; &#187; 천재지변,공항사정,항공사사정등에 의한 여행사 통제권한 밖의 모든 사안에 대한 손해배상 책임의무가 없습니다.</p>
    <p>&nbsp; &#187; 탑승객 영문이름은 반드시 여권상의 영문이름과 동일해야합니다.</p>
    <p>&nbsp; &#187; 중복(이중)예약을 하는 경우 항공사에서 사전에 경고없이 모든 예약을 취소할 수 있으므로 주의하여 주시기 바랍니다</p>
    <p>&nbsp; &#187; 이중(중복)예약후 이중결제로 인해 처리과정에서 발생되는 운임인상, 환불패널티 등 추가 비용은 고객님 부담입니다.</p>
               
                
				</div>
				
    
       
    <!-- /#page-content-wrapper -->
	<!-- 페이지 내용 끝 -->
	
  </div>
  <!-- /#wrapper -->
	
	
	
	
  <!-- Bootstrap core JavaScript -->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>var menuChk = true;
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
