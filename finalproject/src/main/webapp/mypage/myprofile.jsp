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
  <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
  
  
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

 text-align: left;
 margin-left: 11%;

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
<script type="text/javascript">
 $(document).ready(function(){
	 $('#update').bind('click',updateRun);
	 $('#delete').bind('click',deleteRun);

	 
function updateRun(){
	alert("수정시작");
	$('#frm').attr('action','update.do').submit();	
	alert("수정완료");
}

function deleteRun(){
	alert("탈퇴시작");
	$('#frm').attr('action','delete.do').submit();
	alert("탈퇴가 완료 되었습니다.");
}


	
		/* alert("${pv.endRow}"); */


	 
 })//준비 

</script>


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
        <!-- <button class="btn btn-primary" id="menu-toggle">전체메뉴 숨기기</button> -->


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
        <form name="frm" id="frm" method="post">
        <!-- <div style="position:absolute; width:50%; right: 100px; left:250px; top: 150px; text-align: center;"> -->
     <table>
       
       <th>
          <h1>아이디 : ${myprofile.id} </h1>
          <h1>성함 : ${myprofile.name}</h1>
       <h1>비밀번호 : <input type="text" name="pass" value="${myprofile.pass}"></h1>       
       <h1>연락처 : <input type="text" name="phonenum" value="${myprofile.phonenum}"></h1>
       <h1>이메일 : <input type="text" name="email" value="${myprofile.email}">
       
       </h1>
       <h1>성별 : ${myprofile.gender}</h1>
       <h1>생년월일 :
        <fmt:parseDate value="${myprofile.birth}" var="birth" pattern="yyyyMMdd"/>
		<fmt:formatDate value="${birth}" pattern="yyyy년 MM월 dd일 "/>
	   </h1>
	   <h1>포인트 : ${myprofile.point}</h1>
	   <input type="hidden" name="id" value="${myprofile.id}"/> 
	   </th>     
	 <%--  <h1>My Information</h1>	  
     	<thead>
    <tr>
      <th scope="col">List</th>
      <th scope="col">Information</th>
    </tr>
   </thead>
   
	 <tbody>
	 
	 <tr class="table-active">	  
	 <th scope="row">아이디</th>
	 <td>${myprofile.id}</td>
	 </tr>
	 
	 <tr class="table-active">
	 <th scope="row">성함</th>
	 <td>
	 ${myprofile.name}
	 </td>
	 </tr>
	 
	 <tr class="table-active">
	 <th scope="row">비밀번호</th>
	 <td><input type="text" name="pass" value="${myprofile.pass}">
     </td>	 
	 </tr>
	 
	 <tr class="table-active">
	 <th scope="row">비밀번호 확인</th>
	 <td>
	 <input type="password" id="passwordCheck" class="inputText" maxlength="30">
	 </td>
	 </tr>
	 	 
	 <tr class="table-active">
	 <th scope="row">연락처</th>
	 <td>
	 <input type="text" name="phonenum" value="${myprofile.phonenum}">
     </td>
	 </tr>
	 
	 <tr class="table-active">
	 <th scope="row">E-MAIL</th>
	 <td>
	 <c:choose>
	 <c:when test="${myprofile.email==null}">
	 <input type="text" name="email" id="email01" class="inputText" > @ <input type="text" name="email" id="email02" class="inputText" disabled value="naver.com">
	<select name="selectEmail" id="email" name="email2" class="inputText">
	<option value="1">직접입력</option>
	<option value="naver.com" selected>naver.com</option>
	<option value="daum.net">daum.net</option>
	<option value="nate.com">nate.com</option>
	<option value="gmail.com">gmail.com</option>
	<option value="hanmail.net">hanmail.net</option>
	</select>		
	<input type="button" id="emailCheck" value="중복확인" onclick="emailFunction()">
	<input type="button" id="checkbutton" value="전송">
	</c:when>
	<c:otherwise>
		${myprofile.email}
		
	</c:otherwise>
	</c:choose>
	 </td>
	 </tr>
	 
	 <tr class="table-active">
	 <th scope="row">생년월일</th>
	 <td>
	 <fmt:parseDate value="${myprofile.birth}" var="birth" pattern="yyyyMMdd"/>
	 <fmt:formatDate value="${birth}" pattern="yyyy년 MM월 dd일 "/>
	 </td>
	 </tr>
	 
	 <tr class="table-active">
	 <th scope="row">성별</th>
	 <td>
	 ${myprofile.gender}
	 </td>
	 </tr>
	 
	 <tr class="table-active">
	 <th scope="row">마일리지</th>
	 <td>
	 ${myprofile.point}
	 </td>
	 </tr>
	 
	  </tbody>
	  
      </table>
    <br/>
    <hr/>
    <input type="button" id="update" class="btn btn-primary btn-lg" value="정보 수정"/>
    <input type="button" id="delete" class="btn btn-primary btn-lg" value="회원 탈퇴"/>
     --%>
    <!-- 정보수정 -->
      <!-- </div> -->
      </table>
     </form>
     <div style="position:absolute; right: 20px; left:950px; top: 150px; text-align: center;">
     <h1>Notice</h1>
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
  <c:forEach items="${aList}" var="aList">
  <tr class="table-active">
  	 <th scope="row" onclick="">${aList.b_num}</th>
      <td>${aList.title}</td>
      <td>${aList.user_id}</td>
      <td>${aList.upload_date}</td>
      
    </tr>
   </c:forEach>
 
    
  </tbody>
  
     </table><!-- 윗줄까지 -->
     <br/>
   <div class="btn-group mr-2" role="group" aria-label="First group">
   <c:if test="${pv.startPage>1}">
			<a href="profile.do?currentPage=${pv.startPage-pv.blockPage}">이전</a>
		  </c:if>
   <!-- <button type="button" class="btn btn-secondary">1</button>
   <button type="button" class="btn btn-secondary">2</button>
   <button type="button" class="btn btn-secondary">3</button>
   <button type="button" class="btn btn-secondary">4</button> -->
   <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<span>
			  <c:url var="currPage" value="profile.do">			
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
     </div> 
    
     
     <div class="button" >
     	
     <br/>
     <input type="button" id="update" class="btn btn-primary btn-lg" value="정보 수정"/>
    <input type="button" id="delete" class="btn btn-primary btn-lg" value="회원 탈퇴"/>
        
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
