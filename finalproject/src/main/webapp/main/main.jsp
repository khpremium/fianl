<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- 제목 부분 -->
  <title>Business Frontpage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="main/css/business-frontpage.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript">



/*레디*/
$(document).ready(function(){
		
	
	
	/* 인원 수량 증가 감소  */
	
    $('input[count_range]').click(countprocess);/* 인원 수량 증가 감소 끝  */ 
    
      /*출발지 도착지 비교*/
      $('select').change(function(){   
     if($("#city_code_arv option:selected").text()!='도시 선택'){
       if($("#city_code_dep option:selected").text()==$("#city_code_arv option:selected").text()){
    	   /* $("#city_code_arv").prop('disabled',true); */
    	   alert("출발지와 도착지가 같을 수 없습니다."); 
    	 $("#city_code_arv").val('도시 선택');	  
    	}
    	  }
      })/*출발지 도착지 비교 끝*/
    
    
    $("#dep_date").val(new Date().toISOString().substring(0,10));//초기값 = 오늘날짜
        
    $('.date').change(function(){//날짜 변경 jquery    
   
    if($("#dep_date").val() < new Date().toISOString().substring(0,10)){
    		alert("지나간 날짜는 선택할 수 없습니다. ");
    		$("#dep_date").val(new Date().toISOString().substring(0,10));
    		$("#arv_date").val('');    		
   		 } //선택날짜 < 오늘 날짜
    
    if($("#dep_date").val() != '' && $("#arv_date").val() != ''){//출발일, 도착일 빈칸 설정
    	
    	if($("#dep_date").val()==$("#arv_date").val()){//출발일과 도착일이 같을 수는 없다.    		
    		alert("출발일과 도착일이 같을 수는 없습니다.");
    		$("#dep_date").val(new Date().toISOString().substring(0,10));
    		$("#arv_date").val('');
    		return;
    	}else if($("#dep_date").val() >= $("#arv_date").val()){//출발일이 도착일보다 크거나 같을순 없다.
    		alert("출발일이 도착일보다 크거나 같을 수는 없습니다.");
    		$("#dep_date").val(new Date().toISOString().substring(0,10));
    		$("#arv_date").val('');
    		
    	  }
    }// 빈칸설정 if 끝
    
   }) //date change
   
    $('#orgbutton').on('click',chkProcess);
    
});/*레디 끝*/

function chkProcess() {
	
	if($("#city_code_arv option:selected").text()=='도시 선택' ||
			$("#city_code_dep option:selected").text()=='도시 선택') {
		alert('nono');
	} else if($("#arv_date").val() == '') {
		alert('nono');
	} else {
		alert("됫음");
		$("form").submit();
	}
}

function countprocess(e){
    e.preventDefault();
    var type = $(this).attr('count_range');
    var $count = $(this).parent().children('input.count');
    var count_val = $count.val(); // min 1
    if(type=='m'){
        if(parseInt(count_val)<=1){
        	
        	$count.val(1);
        	alert("1보다 작을순 없습니다.");        	
            return;
        }
        $count.val(parseInt(count_val)-1);
    }else if(type=='p'){
        $count.val(parseInt(count_val)+1);
    }
}

function cityprocess(){    	
    if($("#city_code_dep option:selected").text()==$("#city_code_arv option:selected").text()){
 	   /* $("#city_code_arv").prop('disabled',true); */
 	   alert("출발지와 도착지가 같을 수 없습니다."); 
 	   $("#city_code_arv").val('도시 선택');
 	}
}
  
</script>
<style type="text/css"> 
 /*화살표  */
 span{height:40px; width:40px; display:block; position:relative; float: right; margin-right: 50%; margin-top: 4%} 

.demoSpan1{width:30px;}

.demoSpan1:before{content:''; height:0; width:0; display:block; border:15px transparent solid; border-bottom-width:0; border-top-color:#333; position:absolute; bottom:0px; left:0px; }

.demoSpan1:after{content:''; height:25px; width:10px; display:block; background:#333; position:absolute; top:0px; left:10px;}
/*화살표 끝 */

</style>
</head>
<body>

  <!-- 헤더 메뉴부분 끝 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Start Airline</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Join us</a>
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
            <a class="nav-link" href="#">MyPage</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- 헤더 메뉴부분 끝 -->
  
  <!-- Header --><!-- 회식 바탕 부분 -->
  <header class="bg-primary py-5 mb-5">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">Travel Reservation or Information</h1>
          <p class="lead mb-5 text-white-50">
			Life is short and the world is wide. Therefore,
		 	it is good to start exploring the world quickly,<br/>		 	
		 	Go when you are worried about going !
			</p>
        </div>
      </div>
    </div>
  </header>
  <!-- 회색 바탕 부분끝 -->

  <!-- Page Content -->
  <div class="container">

	<!-- 예약하기  -->
    <div class="row">
    
      <div class="col-md-8 mb-5">
      	<form action="selectFlight.do" method="get">
        <h2>Reservaion now</h2>
        <hr/>
        
        <label>출발지</label>
        <select name="city_code_dep" id="city_code_dep">        
        <option>도시 선택</option>        
        <c:forEach items="${aList}" var="dto">
        <option value="${dto.city_code}">${dto.city_name}</option>
        </c:forEach>
        </select>   
             
        <label>도착지</label>
        <select name="city_code_arv" id="city_code_arv">        
        <option>도시 선택</option>
        <c:forEach items="${aList}" var="dto">
        <option value="${dto.city_code}">${dto.city_name}</option>
        </c:forEach>
        </select>   
             
        <label>인원 수</label>
		<input class="count" value="1" readonly="" name="">
		<input class="test1" value="-" type="button" count_range="m">
		<input class="test1" value="+" type="button" count_range="p">	
			
        <br/>
        <br/>
        <label>출국일</label><input type="date" class="date" id="dep_date">       
        <label>귀국일</label><input type="date" class="date" id="arv_date">
        <br/>
        <br/>
        
        <input type="radio" name="guestchk" class="guestpro" value="noguest" checked="checked">
		<label>회원</label> 
		&nbsp;<input type="radio" name="guestchk" class="guestpro" value="guest">
		<label>비회원</label>       
        <br/>
        <br/>
        
        <!-- 예약버튼 -->
        <input type="button" class="btn btn-primary btn-lg" id="orgbutton" value="Reservation &raquo;"><!-- Reservation &raquo; -->
        <hr/>  
        </form>      
      </div> 
           
      <!-- 예약하기 끝 -->
      
      
      <!-- 컨택트 부분 -->
      <div class="col-md-4 mb-5">
        <h2>Contact Us</h2>
        <hr>
        <address>
          <strong>Start Airline</strong>
          <br>823-24 역삼동 
          <br>서울 강남구 테헤란로14길 6 남도빌딩 2층          
        </address>
        <address>
          <abbr title="Phone">P:</abbr>
          (02) 1544-9970
          <br>
          <abbr title="Email">E:</abbr>
          <a href="mailto:#">Airline@gmail.com</a>
        </address>
        <hr/>
        <hr/>
        <hr/>        
        <h1>Preview ↓</h1>
      </div>
      
      <!-- 컨택트 부분끝 -->
      
    </div>
    <!-- /.row -->    

	<!-- 여행 미리보기 시작 -->
    <div class="row">
      <div class="col-md-4 mb-5">
      <c:forEach var="rdto" items="${rList}">
        <div class="card h-100">
          <img class="card-img-top" src="main/images/오사카.jpg" alt="">
          <div class="card-body">
            <h4 class="card-title">${rdto.title}</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus.</p>
          </div>
          
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
        </c:forEach>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus totam ut praesentium aut.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
    </div>
    <!-- 여행 미리보기 끝 -->
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="main/vendor/jquery/jquery.min.js"></script>
  <script src="main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
