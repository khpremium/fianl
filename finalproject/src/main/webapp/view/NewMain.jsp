<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>KH Air</title>
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
    
    $('#resForm').on('submit', function() {
    	// alert($('input[name="guestchk"]:checked').val());
    	if($('input[name="guestchk"]:checked').val() == 'guest')
    		$('#resForm').attr('action', 'guestInfo.do');
    	else if('${sessionScope.id}' == '') {
    		alert('로그인 해 주세요');
    		// alert('${empty id}');
    		/* $(location).attr('href','login.do'); */
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
		$("#resForm").submit();
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
		<c:import url="../joinMain/newIndex.jsp"></c:import>
		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
			<section id="banner" class="bg-img" data-bg="one.jpg">
				<div class="inner">
				<article class="box">
					<header>
						<h1>KH Start Air
						    Reservation Now</h1>						
					</header>
					<form id="resForm" action="selectFlight.do" method="post">
					<div class="content"><!-- 예약 div  -->
		<!-- <label>출발지 선택 </label> -->
        <select name="city_code_dep" id="city_code_dep" >        
        <option style="color: white; font-weight:bold; background-color: black;">출발지 도시 선택</option>        
        <c:forEach items="${aList}" var="dto">
        <option value="${dto.city_code}" style="color: white; font-weight:bold; background-color: black;">${dto.city_name}</option>
        </c:forEach>
        </select>   
        <br/>     
       <!--  <label>도착지 선택 </label> -->
        <select name="city_code_arv" id="city_code_arv" >        
        <option style="color: white; font-weight:bold; background-color: black;">도착지 도시 선택</option>
        <c:forEach items="${aList}" var="dto">
        <option value="${dto.city_code}" style="color: white; font-weight:bold; background-color: black;">${dto.city_name}</option>
        </c:forEach>
        </select>   
        
        <br/>            
        <label>인원 수 &nbsp;</label>
		<input class="count" value="1" readonly="readonly" name="p_count" style="color: white; font-weight:bold; background-color:transparent; border: black;" > &nbsp;
		<input class="test1 alt" value="-" type="button" count_range="m">
		<input class="test1 alt" value="+" type="button" count_range="p">
		<br/>
		<br/>       
        <label for="priority-low">출국일 &nbsp;</label><input type="date" class="date" id="dep_date" name="dep_date" style="color: white; font-weight:bold; background-color:transparent; border:gray; ">       
        <label for="priority-low">&nbsp;귀국일 &nbsp;</label><input type="date" class="date" id="arv_date" name="arv_date" style="color: white; font-weight:bold; background-color:transparent; border:gray;">
        <br/>
        <br/>
        
        
        <input type="radio" id="priority-low" name="guestchk" class="guestpro" value="noguest" checked="checked">
		<label for="priority-low">회원</label>
		&nbsp;<input type="radio" id="priority-normal" name="guestchk" class="guestpro" value="guest">
		<label for="priority-normal">비회원</label>
		
						</div>
						<footer>
							<input type="button" id="orgbutton" class="button alt" value="Reservation &raquo;">
						</footer>
						</form>
				</article>	
				</div>
				<a href="#two" class="more">Learn More</a>
			</section>

		<!-- One -->
		 	<!-- <section id="one" class="wrapper post bg-img" data-bg="two.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>공지사항ㅋㅋ</h2>
							<br/>
						</header>
						
									
						<div class="content">
					<table>
						<tr>
							<th style="width: 10%; text-align: center;">Num</th>
							<th style="width: 50%; text-align: center;">Title</th>
							<th style="width: 10%; text-align: center;">Count</th>
							<th style="width: 30%; text-align: center;">Date</th>
						</tr>
						
							<tr>
								<td style="text-align: center;"><p style="color:white;"
									>239</p></td>
								<td><a
									href="helpBlog.do?b_num=239&currentPage=1">탑승구(GATE) 수하물 위탁불가 안내</a></td>
								<td style="text-align: center;"><p style="color:white;">1</p></td>
								<td style="text-align: center;"><p style="color:white;">2019-04-11</p></td>
							</tr>
						
							<tr>
								<td style="text-align: center;"><p style="color:white;"
									>223</p></td>
								<td><a
									href="helpBlog.do?b_num=223&currentPage=1">[항공권소식] [2019년 4월 부 유류할증료 안내]</a></td>
								<td style="text-align: center;"><p style="color:white;">9</p></td>
								<td style="text-align: center;"><p style="color:white;">2019-04-05</p></td>
							</tr>
						
							<tr>
								<td style="text-align: center;"><p style="color:white;"
									>222</p></td>
								<td><a
									href="helpBlog.do?b_num=222&currentPage=1">[해외항공] 여행사 재발행 대행수수료 변경안내</a></td>
								<td style="text-align: center;"><p style="color:white;">4</p></td>
								<td style="text-align: center;"><p style="color:white;">2019-04-05</p></td>
							</tr>
						
							<tr>
								<td style="text-align: center;"><p style="color:white;"
									>221</p></td>
								<td><a
									href="helpBlog.do?b_num=221&currentPage=1">[공지사항] 'KH Air' 고객서비스 실시간 채팅 오픈</a></td>
								<td style="text-align: center;"><p style="color:white;">27</p></td>
								<td style="text-align: center;"><p style="color:white;">2019-04-05</p></td>
							</tr>
						
							<tr>
								<td style="text-align: center;"><p style="color:white;"
									>220</p></td>
								<td><a
									href="helpBlog.do?b_num=220&currentPage=1">[국내] 국내선 이용시 신분증 필수 지참 안내</a></td>
								<td style="text-align: center;"><p style="color:white;">2</p></td>
								<td style="text-align: center;"><p style="color:white;">2019-04-05</p></td>
							</tr>
						
					</table>
				</div>

				
						
						 
						<footer>
							
						</footer>
					</article>
				</div>
				
				<a href="#two" class="more">Learn More</a>
				
			</section> --> 

		<!-- Two -->
		 <section id="two" class="wrapper post bg-img" data-bg="three.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>관리자 추천 게시물</h2>
							<p>여행지 추천</p>
						</header>
						<div class="content">
					<table>
						<tr>
							<th style="text-align: center;"><img src="SHINnara/images/9e76a52f-436b-4bd5-b2ea-d374bd5b1706_만리장성001.jpg"  style="width: 400px; height: 237.59px;"/></th>
							<th style="text-align: center;"><img src="SHINnara/images/1dc3b9c0-65ff-4764-8fc7-80d1a3b12965_도쿄타워.png"  style="width: 400px; height: 237.59px;"/>
</th>
							
							
						</tr>
						
							<tr>
								<td style="text-align: center;">
								<a style="color:white" href="suggestView.do?currentPage=1&amp;b_num=232">만리장성</a>
								</td>
								
								<td style="text-align: center;">
								<a style="color:white" href="suggestView.do?currentPage=1&amp;b_num=231">도쿄타워</a>
								</td>
								
								
								
							</tr>
						
							
						<tr>
								<td style="text-align: center;">
								<p>운영시간<br/>월 - 금 오전 7:30 - 오후 5:00<br/>토 - 일 오전 7:30 - 오후 6:00<br/>“경사진 곳을 많이 걷지만 한번 가보시길..”<br/></p>
								</td>
								
								<td style="text-align: center;">
								<p>운영시간 <br/>일 - 토 오전 9:00 - 오후 11:00<br/></p>
								</td>
								
								
								
							</tr>
							
						
							
						
							
						
					</table>
				</div>
						
						
						
						
						
						
						<footer>
							<a href="List.do" class="button alt">게시물 전체보기</a>
						</footer>
					</article>
				</div>
			</section> 

		<!-- Three -->
			<!-- <section id="three" class="wrapper post bg-img" data-bg="banner4.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Varius a cursus aliquet</h2>
							<p>11.11.2016</p>
						</header>
						<div class="content">
							<p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
						</div>
						<footer>
							<a href="generic.html" class="button alt">Learn More</a>
						</footer>
					</article>
				</div>
				<a href="#four" class="more">Learn More</a>
			</section> -->

		<!-- Four -->
			<!-- <section id="four" class="wrapper post bg-img" data-bg="banner3.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Luctus blandit mi lectus in nascetur</h2>
							<p>10.30.2016</p>
						</header>
						<div class="content">
							<p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
						</div>
						<footer>
							<a href="generic.html" class="button alt">Learn More</a>
						</footer>
					</article>
				</div>
			</section> -->

		<!-- Footer -->
			<!-- <footer id="footer">
				<div class="inner">
					<h2>Contact Me</h2>
					<form action="#" method="post">
						<div class="field half first">
							<label for="name">Name</label>
							<input name="name" id="name" type="text" placeholder="Name">
						</div>
						<div class="field half">
							<label for="email">Email</label>
							<input name="email" id="email" type="email" placeholder="Email">
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
						</div>
						<ul class="actions">
							<li><input value="Send Message" class="button alt" type="submit"></li>
						</ul>
					</form>
					<ul class="icons">
						<li><a href="#" class="icon round fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon round fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon round fa-instagram"><span class="label">Instagram</span></a></li>
					</ul>
					<div class="copyright">
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
					</div>
				</div>
			</footer> -->

		<!-- Scripts -->
			<script src="view/assets/js/jquery.min.js"></script>
			<script src="view/assets/js/jquery.scrolly.min.js"></script>
			<script src="view/assets/js/jquery.scrollex.min.js"></script>
			<script src="view/assets/js/skel.min.js"></script>
			<script src="view/assets/js/util.js"></script>
			<script src="view/assets/js/main.js"></script>

</body>
</html>