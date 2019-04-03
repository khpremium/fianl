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
	$('input[type="submit"]').click(function(e){
		e.preventDefault();
		if(!confirm('정말로 여권번호 확실허냐?')) return;
		$('form').submit();
	});
	
	
});//ready


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
    <%--  <h1>${passport}</h1>
     <p>
     <c:forEach var="i" begin="1" end="${passport}">
     	<input type="text" value="${i}"><br/>
     </c:forEach>
     </p>
      --%>
     
    
     
    <form action="inspassport.do" method="post">
   <h2 align="center">Passport Insert</h2>
	<br/>
				
				 <c:forEach items="${alreadypass}" var="alreadypass" varStatus="status">				 
				<%-- <c:forEach var="i" begin="1" end="${passport}"> --%>
				
				<h1>탑승객 ${status.index+1}번</h1>				
				<!-- 출발비행기 -->
				<div id="dept">
				
					<table>
					
						<tr>
							<th>한글 성명</th>
							<th>영문 성명</th>
							<th>성별</th>
							<th>법정 생년월일</th>
							<th>여권번호</th>
							<th>여권 만료일</th>
							<th>연락처</th>
							<th>국가</th>
							
						</tr>	
							
							<tr>
							
								<td>								
								<input type="text" name="aList[${status.index}].name_kr" value="${alreadypass.name_kr}" style="border:1px solid black;">								
								</td>
								<td>
								<input type="text" name="aList[${status.index}].name_en" value="${alreadypass.name_en}" placeholder="lastname/firstname" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" name="aList[${status.index}].gender" value="${alreadypass.gender}" placeholder="남성 혹은 여성" style="border:1px solid black;">
								</td>								
								<td>
								<input type="text" name="aList[${status.index}].p_birth" value="${alreadypass.p_birth}" placeholder="ex)1991.07.06" style="border:1px solid black;">														
								</td>
								<td>
								<input type="text" name="aList[${status.index}].passport_num" value="${alreadypass.passport_num}" placeholder="9자리 여권번호" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" name="aList[${status.index}].exp_date" value="${alreadypass.exp_date}" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" name="aList[${status.index}].phonenum" value="${alreadypass.phonenum}" placeholder="연락처" style="border:1px solid black;">
								</td>								
								<td>
								<input type="text" name="aList[${status.index}].p_country" value="${alreadypass.p_country}" placeholder="한글로 입력해주세요" style="border:1px solid black;">
								</td>																
							  						  						
							</tr>	
											
					</table><input type="hidden" name="aList[${status.index}].reservation_rv_code" value="${pass_rvcode}"/>
					
				</div>
				<br/>
				<br/>
				</c:forEach>
				<!-- 여기부터 -->
				<c:forEach var="i" begin="${fn:length(alreadypass)+1}" end="${passport}">
				<h1>탑승객 ${i}번</h1>				
				<!-- 출발비행기 -->
				<div id="dept">
				
					<table>
					
						<tr>
							<th>한글 성명</th>
							<th>영문 성명</th>
							<th>성별</th>
							<th>법정 생년월일</th>
							<th>여권번호</th>
							<th>여권 만료일</th>
							<th>연락처</th>
							<th>국가</th>
							
						</tr>						
							<tr>
							
								<td>								
								<input type="text" name="aList[${i-1}].name_kr" style="border:1px solid black;">								
								</td>
								<td>
								<input type="text" name="aList[${i-1}].name_en" placeholder="lastname/firstname" style="border:1px solid black;">
								</td>
								
								<td>
								<input type="text" name="aList[${i-1}].gender" placeholder="남성 혹은 여성" style="border:1px solid black;">
								</td>								
								<td>
								<input type="text" name="aList[${i-1}].p_birth" placeholder="ex)1991.07.06" style="border:1px solid black;">														
								</td>
								<td>
								<input type="text" name="aList[${i-1}].passport_num" placeholder="9자리 여권번호" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" name="aList[${i-1}].exp_date" style="border:1px solid black;">
								</td>
								<td>
								<input type="text" name="aList[${i-1}].phonenum" placeholder="연락처" style="border:1px solid black;">
								</td>								
								<td>
								<input type="text" name="aList[${i-1}].p_country" placeholder="한글로 입력해주세요" style="border:1px solid black;">
								</td>																
							  						  						
							</tr>	
											
					</table><input type="hidden" name="aList[${i-1}].reservation_rv_code" value="${pass_rvcode}"/>
					
				</div>
				<br/>
				<br/>
				</c:forEach>
				 <%-- </c:forEach> --%>
				</form>
													
				<div class="button">
				<br/>
                <input type="submit" class="btn btn-primary btn-lg" value="저장하기" /><br/>
				</div> 
				<br/>
				<br/>
    <p>&nbsp; &#187; 여권상의 영문 이름과 반드시 동일해야하며 불일치시 탑승이 거절될수있습니다.</p>
	<p>&nbsp; &#187; 여권번호와 만료일이 없을시 임의로 기입하신 후 출국 72시간전 까지 여권과 동일하게 변경해 주시고 영문이름은 변경 불가합니다.</p>
    <p>&nbsp; &#187; 여권만료일이 출발일로부터 6개월 미만인 경우 출발 전에 여권기간을 연장하시기 바랍니다.</p>
    <p>&nbsp; &#187; 여권유효기간이 6개월 미만인 경우 입국허가요건이 국가별로 상이 하므로 외교통상부 사이트에서 확인하시기 바랍니다.</p>
    <p>&nbsp; &#187; 등록하신 여권정보에 변동사항이 있을 경우 출국 72시간전 까지 재등록이 가능합니다. (단, 러시아항공 이용시 정확한 여권번호 입력 후 결제 가능)</p>
    <p>&nbsp; &#187; 여권정보가 다르거나 누락된 경우 항공편 탑승 및 현지 입국이 거절될 수 있습니다.</p>
    <p>&nbsp; &#187; 고객 상담 문의 처리 시간 : 평일기준 09:00~17:00 / 주말, 공휴일 제외</p>
    
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
