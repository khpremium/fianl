<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Road Trip by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="view/assets/css/main.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
    
    $('form').on('submit', function() {
    	// alert($('input[name="guestchk"]:checked').val());
    	if($('input[name="guestchk"]:checked').val() == 'guest')
    		$('form').attr('action', 'guestInfo.do');
    	else if('${id}' == '') {
    		// alert('${empty id}');
    		$(location).attr('href','login.do');
        	return false;
    	}
    });
    
       
    
});/*레디 끝*/
function chkProcess() {
	
	if($("#city_code_arv option:selected").text()=='도시 선택' ||
			$("#city_code_dep option:selected").text()=='도시 선택') {
		alert('도시를 선택해주세요.');
	} else if($("#arv_date").val() == '') {
		alert('귀국일을 선택해주세요.');
	} else {
		// alert("됫음");
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
</head>
<body>
		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="view/index.html">Road Trip <span>by TEMPLATED</span></a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="main.do">Home</a></li>
					<li><a href="helpMain.do">Notice</a></li>
					<li><a href="join.do">Join Us</a></li>
					<li><a href="">Priview</a></li>					
					<li><a href="login.do">Login</a></li>
					<li><a href="profile.do">My Page</a></li>
					<li><a href="myreservation.do">Reservation Check</a></li>
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->			

		<!-- One -->
		 	<section id="one" class="wrapper post bg-img" data-bg="one.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>예약 확인</h2>
							<br/>
						</header>
						
						<div class="content"> 
							<input type="text" class="query" id="query" placeholder="예약 번호 입력">
							<input type="text" class="query" id="query" placeholder="비밀 번호 입력">
							<c:forEach items="${myreschk}" var="myreschk">
							<input type="text" readonly value="${myreschk.airinfo_flight}">
							</c:forEach>
							<br/>
						</div>
						<footer>
							<input type="submit" id="reservationchk" class="button alt" value="Reservation Search" />
						</footer>
					</article>
				</div>
			</section> 

		
		
		

		<!-- Scripts -->
			<script src="view/assets/js/jquery.min.js"></script>
			<script src="view/assets/js/jquery.scrolly.min.js"></script>
			<script src="view/assets/js/jquery.scrollex.min.js"></script>
			<script src="view/assets/js/skel.min.js"></script>
			<script src="view/assets/js/util.js"></script>
			<script src="view/assets/js/main.js"></script>

</body>
</html>