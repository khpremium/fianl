<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>KH AIR In My Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="view/assets/css/main.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/*레디*/
$(document).ready(function(){ 
	alert("${non_passsrc[1].name_kr}");
	
	
});/*레디 끝*/


</script>

<style type="text/css">



input{
	text-align: center;
	font: bold;
}
.passfir{
	 width : 30px;
	 text-align: left;
 	 margin-left: 3%;
}
.passsec{
	visibility: hidden;
}
.passsec{
	 width : 30px;
	 text-align: left;
 	 margin-left: 3%;
}
.del_none{
	visibility: hidden;
}
#savepass{
	margin-left: 45%;
	
}
</style>

</head>
<body>
		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="view/index.html">KH AIR<span> In My Page</span></a></div>
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
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
		<section id="two" class="wrapper post bg-img" data-bg="two1.jpg">
				<div class="inner" style="width:1400px;">
					<article class="box">
						<header>
							<h2>My Reservation</h2>
						</header>
						<form action="reservation_delete.do" method="post">	
						<div class="table-wrapper">
						
						<input type="hidden" name="cancel" value="${myreschkchk[1].rv_code}"/>
							<table class="alt">
							
								<thead>
								  <tr>
									<th>항공사</th>
									<th>편명</th>
									<th>출발지</th>
									<th>도착지</th>
									<th>출발시간</th>
									<th>도착시간</th>
									<th>성함</th>
									<th>예약번호</th>
									<th>탑승객수</th>
								 </tr>						
								</thead>
								
								<tbody>
								 <tr>
								 	<th>${myreschk[1].airline}</th>
									<th>${myreschk[1].airinfo_flight}</th>
									<th>${myreschk[1].city_name}</th>
									<th>${myreschk[0].city_name}</th>
									<th>
										<fmt:parseDate value="${myreschk[1].d_time}" var="dtime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${dtime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>
										<fmt:parseDate value="${myreschk[1].a_time}" var="atime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${atime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>${myreschk[1].name}</th>
									<th>${myreschk[1].rv_code}</th>
									<th>${myreschk[1].p_count}</th>
									
								 </tr>
								 
								 <tr>
								 	<th>${myreschk[0].airline}</th>
									<th>${myreschk[0].airinfo_flight}</th>
									<th>${myreschk[0].city_name}</th>
									<th>${myreschk[1].city_name}</th>
									<th>
										<fmt:parseDate value="${myreschk[0].d_time}" var="dtime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${dtime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>
										<fmt:parseDate value="${myreschk[0].a_time}" var="atime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${atime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>${myreschk[0].name}</th>
									<th>${myreschk[0].rv_code}</th>
									<th>${myreschk[0].p_count}</th>									
								 </tr>								 							 
								</tbody>																							
							</table>
							<c:choose>
							<c:when test="${myreschk[1].rv_code!=null}">
							<a href="#post">&#187;&nbsp;여권번호 입력 페이지<br/></a>
							</c:when>
							</c:choose>	
							</div>					
						</form>									
								<input type="text" class="del_chk del_none" placeholder="예약번호 입력">
								<br/>
								<input type="submit" id="reservationcanel" class="button alt" value="예약취소" />
								<footer>
							<br/>
						
	<p style="text-align: left;">&nbsp; &#187; 항공권 환불금액은 전구간과 부분사용의 환불규정 및 환불금액이 다르므로 환불 요청시 반드시 해당 요금의 환불 규정을 확인해주시기 바랍니다.</p>
    <p style="text-align: left;">&nbsp; &#187; 기상 또는 항공사 사정에 의하여 사전 통보없이 스케쥴 변동 및 취소가 발생할 수 있으므로 출/귀국시 72시간전 해당항공사로 재확인하여 주시기 바랍니다.</p>
    <p style="text-align: left;">&nbsp; &#187; 예약 재확인은 필수 사항이며 재확인하지 않아 발생되는 문제는 여행사에서 책임지지 않습니다.</p>
    <p style="text-align: left;">&nbsp; &#187; 천재지변,공항사정,항공사사정등에 의한 여행사 통제권한 밖의 모든 사안에 대한 손해배상 책임의무가 없습니다.</p>
    <p style="text-align: left;">&nbsp; &#187; 탑승객 영문이름은 반드시 여권상의 영문이름과 동일해야합니다.</p>
    <p style="text-align: left;">&nbsp; &#187; 중복(이중) 예약을 하는 경우 항공사에서 사전에 경고없이 모든 예약을 취소할 수 있으므로 주의하여 주시기 바랍니다</p>
    <p style="text-align: left;">&nbsp; &#187; 이중(중복) 예약후 이중결제로 인해 처리과정에서 발생되는 운임인상, 환불패널티 등 추가 비용은 고객님 부담입니다.</p>							
						</footer>
					</article>								
				</div>					
				<a href="#post" class="more">Learn More</a>
			</section>
			
			
			

		<!-- post -->
		
			<%-- <section id="post" class="wrapper bg-img" data-bg="four.jpg">
			
				<div class="inner" style="width:1200px;">
					<article class="box" >
					<form action="inspassport.do" method="post">
						<header>
							<h2>여권 정보</h2>
						</header>
					<c:forEach items="${alreadypass}" var="alreadypass" varStatus="status">	
					<header>
							<p>탑승객 ${status.index+1}번</p>
						</header>
						
						<div class="table-wrapper">
							<table class="alt">
								<thead>
						<tr>
							<th>한글 성명</th>
							<th>영문 성명</th>
							<th>성별</th>
							<th>법정 생년월일</th>
							<th>여권번호</th>
							<th>여권 만료일</th>
							<th>연락처</th>
							<th>발급 국가</th>
							
						</tr>	
							</thead>
							<tbody>
							<tr>
							
								<th>								
<input type="text" name="aList[${status.index}].name_kr" value="${alreadypass.name_kr}" style="text-align:center; width: 80px; font-size: small;">								
								</th>
								<th>
<input type="text" name="aList[${status.index}].name_en" value="${alreadypass.name_en}" placeholder="lastname/firstname" style="text-align:center; width: 140px; font-size: small;">
								</th>
								<th>
<input type="text" name="aList[${status.index}].gender" value="${alreadypass.gender}" placeholder="남성/여성" style="text-align:center; width: 90px; font-size: small;">
								</th>								
								<th>
<input type="text" name="aList[${status.index}].p_birth" value="${alreadypass.p_birth}" placeholder="ex)19910706" style="text-align:center; width: 120px; font-size: small;">														
								</th>
								<th>
<input type="text" name="aList[${status.index}].passport_num" value="${alreadypass.passport_num}" placeholder="9자리 번호" style="text-align:center; width: 100px; font-size: small;">
								</th>
								<th>
<input type="text" name="aList[${status.index}].exp_date" value="${alreadypass.exp_date}" style="text-align:center; width: 100px; font-size: small;">
								</th>
								<th>
<input type="text" name="aList[${status.index}].phonenum" value="${alreadypass.phonenum}" placeholder="연락처" style="text-align:center; width: 125px; font-size: small;">
								</th>								
								<th>
<input type="text" name="aList[${status.index}].p_country" value="${alreadypass.p_country}" placeholder="한글명" style="text-align:center; width: 65px; font-size: small;">
								</th>																
							  						  						
							</tr>	
							</tbody>				
					</table><input type="hidden" name="aList[${status.index}].reservation_rv_code" value="${pass_rvcode}"/>
					
				</div>									
					
					</c:forEach>
					--%>
			<c:forEach var="i" begin="${fn:length(non_pcount)+1}" end="${non_pcount}">
						<header>
							<p>탑승객 ${i}번</p>
						</header>
						
						<div class="table-wrapper">
							<table class="alt">
								<thead>
								  <tr>
									<th>한글 성명</th>
									<th>영문 성명</th>
									<th>성별</th>
									<th>법정 생년월일</th>
									<th>여권 번호</th>
									<th>여권 만료일</th>
									<th>연락처</th>
									<th>발급 국가</th>
									
								 </tr>						
								</thead>
								
								<tbody>
								
								 
								 
								  <tr>
								 	<th style="padding:11px;">
								 	<input name="aList[${i-1}].name_kr" type="text" style="text-align:center; width: 80px; font-size: small;" >
								 	</th>
									<th><input name="aList[${i-1}].name_en" type="text" style="text-align:center; width: 140px; font-size: small;" placeholder="lastname/firstname"></th>
									<th><input name="aList[${i-1}].gender" type="text" style="text-align:center; width: 90px; font-size: small;" placeholder="남성/여성"></th>
									<th><input name="aList[${i-1}].p_birth" type="text" style="text-align:center; width: 120px; font-size: small;" placeholder="ex)19910706"></th>
									<th><input name="aList[${i-1}].passport_num" type="text" style="text-align:center; width: 100px; font-size: small;" placeholder="9자리 번호"></th>
									<th><input name="aList[${i-1}].exp_date" type="text" style="text-align:center; width: 100px; font-size: small;"></th>
									<th><input name="aList[${i-1}].phonenum" type="text" style="text-align:center; width: 125px; font-size: small;"  placeholder="연락처"></th>
									<th><input name="aList[${i-1}].p_country" type="text" style="text-align:center; width: 65px; font-size: small;" placeholder="한글명"></th>
									
								 </tr>	 
								</tbody>								
							</table><input type="hidden" name="aList[${i-1}].reservation_rv_code" value="${pass_rvcode}"/>
						</div>						
				</c:forEach>
			</form>
						<footer>
							<input type="submit" class="button alt" id="savepass" value="저장하기">
							<br/>
							<br/>
	<p>&nbsp; &#187; 여권상의 영문 이름과 반드시 동일해야하며 불일치시 탑승이 거절될수있습니다.</p>
	<p>&nbsp; &#187; 여권번호와 만료일이 없을시 임의로 기입하신 후 출국 72시간전 까지 여권과 동일하게 변경해 주시고 영문이름은 변경 불가합니다.</p>
    <p>&nbsp; &#187; 여권만료일이 출발일로부터 6개월 미만인 경우 출발 전에 여권기간을 연장하시기 바랍니다.</p>
    <p>&nbsp; &#187; 여권유효기간이 6개월 미만인 경우 입국허가요건이 국가별로 상이 하므로 외교통상부 사이트에서 확인하시기 바랍니다.</p>
    <p>&nbsp; &#187; 등록하신 여권정보에 변동사항이 있을 경우 출국 72시간전 까지 재등록이 가능합니다.</p>
    <p>&nbsp; &#187; 여권정보가 다르거나 누락된 경우 항공편 탑승 및 현지 입국이 거절될 수 있습니다.</p>
    <p>&nbsp; &#187; 고객 상담 문의 처리 시간 : 평일기준 09:00~17:00 / 주말, 공휴일 제외&nbsp;&nbsp;<a href="helpMain.do">고객문의 게시판</a></p>
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