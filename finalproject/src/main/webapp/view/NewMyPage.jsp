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
		
	/* $('#update').bind('click',updateRun); */
	$(document).on('click','#update',updateRun);
	$('#delete').bind('click',deleteRun);
	$('input[type="submit"]').on('click',function(e){
		if($('input[name="cancel"]').val()==''){
			alert("예약된 내용이 없습니다..");
			return;
		}
		$('.del_chk').removeClass("del_none");
		e.preventDefault();
		$('input[type="submit"]').on('click',res_chk);
	});
	$('#savepass').click(function(e){
		
		e.preventDefault();
		if(!confirm('입력 된 정보를 저장 하시겠습니까?')) return;		
		$('#passins').submit();
		alert("저장 되었습니다.");
	});
	
});/*레디 끝*/
function updateRun(e){
	$('.passfir').removeClass("passsec");
	e.preventDefault();
	$('#update').on('click',passtest);
}// updaterun
function passtest(){
	alert("수정을 시작합니다.");
	if($('.passfir').val()=="${myprofile.pass}"){		
		if(!/^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test($("#mypass").val())){
			alert('숫자와 영문자 특수문자 포함 조합으로 10~15자리를 사용해야 합니다.');
			return false;
		}else{			
			$('#frm').attr('action','update.do').submit();	
			alert("수정완료");
			return false;
		}
	} else{
		alert("비밀번호가 틀립니다.");
		return false;
	}
}//passtest



function deleteRun(e){	
	$('.passfir').removeClass("passsec");
	e.preventDefault();
	$('#delete').on('click',deltest);
} // deleterun
function deltest(){
	if($('.passfir').val()=="${myprofile.pass}"){
		if(!confirm('작성한 글이 모두 지워집니다')) return;
		if(!confirm('탈퇴 하시겠습니까?')) return;
		$('#frm').attr('action','delete.do').submit();
		alert("탈퇴가 완료되었습니다.");		
	}else{
		alert("비밀번호가 틀립니다.");
		return location.reload();
	}
}
function res_chk(){
	if($('.del_chk').val()=="${myres[1].rv_code}"){
		alert("예약이 취소되었습니다.");
		$('#fdelete').submit();    	
	}else if($('.del_chk').val()==null){
		alert("예약된 내용이 없습니다.");
	}else if($('.del_chk').val()!="${myres[1].rv_code}"){
		alert("예약번호가 틀립니다.")
	}
}//end res_chk

function myres(){
	$(location).attr("href","#two");
	
}

function mybod(){
	$(location).attr("href","#one");
}


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
			<jsp:include page="../joinMain/newIndex.jsp"></jsp:include>

		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
		

		<!-- profile -->
	<section id="banner" class="bg-img" data-bg="one.jpg">
		<div class="inner">
			<article class="box">
				<header>
							<h1>My Profile</h1>
			</header>
			<div class="content">
				<form name="frm" id="frm" method="post">
						
				<div class="row uniform" style="padding:10px;">
				
					<div class="6u 12u$(xsmall)">
							<label for="myid">아이디</label>
						<input name="id" id="myid" type="text" readonly value="${myprofile.id}">
					</div>
						
					<div class="6u$ 12u$(xsmall)">
						<label for="name">성함</label>
						<input name="name" id="name" type="text" readonly value="${myprofile.name}">
					</div>
						
						
						
					<div class="6u 12u$(xsmall)">
						<label for="mypass">비밀번호</label>
						<input name="pass" id="mypass" type="text" placeholder="수정할 비밀번호를 입력해주세요">

					</div>
						
					<div class="6u$ 12u$(xsmall)">
						<label for="phonenum">연락처</label>
						<input name="phonenum" id="phonenum" type="text" placeholder="수정할 연락처를 입력해주세요" value="${myprofile.phonenum}">
					</div>
							
					<div class="6u 12u$(xsmall)">
						<label for="email">E-MAIL</label>
						<input name="email" id="email" type="email" placeholder="수정할 이메일을 입력해주세요" value="${myprofile.email}">
					</div>
						
					<div class="6u$ 12u$(xsmall)">
						<label for="gender">성별</label>
						<input name="gender" id="gender" type="text"  readonly value="${myprofile.gender}">
					</div>
							
					<div class="6u 12u$(xsmall)">
						<label for="birth">생년월일</label>						
       					 	<fmt:parseDate value="${myprofile.birth}" var="birth" pattern="yyyyMMdd"/>							
						<input name="birth" id="birth" type="text" readonly value='<fmt:formatDate value="${birth}" pattern="yyyy년 MM월 dd일"/>'>
					</div>
					
					<div class="6u$ 12u$(xsmall)">
						<label for="point">포인트</label>
						<input name="point" id="point" type="text" readonly value="${myprofile.point}">
					</div>
					
					<div class="6u 12u$(xsmall)">
						<label for="#one">${myprofile.name} 님의 예약 내역</label>
						<c:choose>
							<c:when test="${myres[1].rv_code!=null}">
								<input type="text" readonly value="1건" onclick="myres();">
							</c:when>
							<c:otherwise>
								<input type="text" readonly value="0 건">
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="6u$ 12u$(xsmall)">
						<label>${myprofile.name} 님이 작성한 글</label>						
						<c:choose>						
						<c:when test="${empty pv.totalCount}">
						<input type="text" readonly value="0건">
						</c:when>
						<c:otherwise>
						<input type="text" readonly value="${pv.totalCount}건" onclick="mybod();">
						</c:otherwise>
						</c:choose>
					</div>
							
				</div>
				</form>
				<br/>
					<footer>
					<input type="hidden" name="id" value="${myprofile.id}"/>							
							<input type="text" class="passfir passsec" placeholder="변경 전 비밀번호 확인">
							<br/>						
							<input type="button" id="update" class="button alt small" value="수정"/>&nbsp;&nbsp;
    						<input type="button" id="delete" class="button alt small" value="탈퇴"/>
					</footer>
				</div>
			</article>
		</div>
				<a href="#one" class="more">Learn More</a>
	</section>
	<!-- one -->
		<section id="one" class="wrapper post bg-img" data-bg="three.jpg">
				<div class="inner">
				
					<article class="box">
						<header>
							<h2>${myprofile.name} 님이 작성 한 글</h2>
						</header>
						<div class="table-wrapper">						
							<table class="alt">
						<thead>
							<tr>
								<th style="text-align: center;">Board Number</th>
								<th style="text-align: center;">Title</th>
								<th style="text-align: center;">Writer Id</th>
								<th style="text-align: center;">Write Date</th>									
							</tr>						
						</thead>
								
						<tbody>
							<c:forEach items="${myblist}" var="myblist">
								<tr>
									<td>${myblist.b_num}</td>
									<td>${myblist.title}</td>
									<td>${myblist.user_id}</td>
									<td>${myblist.upload_date}</td>
								</tr>							
							</c:forEach>	 
						</tbody>
					</table>
				<c:if test="${pv.startPage>1}">
					<a href="profile.do?currentPage=${pv.startPage-pv.blockPage}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
					<span>
						<c:url var="currPage" value="profile.do?#one">			
							<c:param name="currentPage" value="${i}"/>
						</c:url>
					<c:choose>
						<c:when test="${i==pv.currentPage}">
							<a href="${currPage}"> <c:out value="${i}" /></a>
						</c:when> 
						<c:otherwise>	
							<a href="${currPage}"> <c:out value="${i}" /></a>
						</c:otherwise>			
					</c:choose>
					</span>
				</c:forEach>
			</div>	
					<footer>					
							<br/>
							<!-- footer 내용 -->
						</footer>
					</article>	
												
				</div>
				<a href="#two" class="more">Learn More</a>
			</section>
	
	
	
	

		<!-- two -->
			<section id="two" class="wrapper post bg-img" data-bg="two1.jpg">
				<div class="inner" style="width:1400px;">
					<article class="box">
						<header>
							<h2>My Reservation</h2>
						</header>
						<form id="fdelete" action="reservation_delete.do" method="post">	
						<div class="table-wrapper">
						
						<input type="hidden" name="cancel" value="${myres[1].rv_code}"/>
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
								 	<th>${myres[1].airline}</th>
									<th>${myres[1].airinfo_flight}</th>
									<th>${myres[1].city_name}</th>
									<th>${myres[0].city_name}</th>
									<th>
										<fmt:parseDate value="${myres[1].d_time}" var="dtime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${dtime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>
										<fmt:parseDate value="${myres[1].a_time}" var="atime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${atime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>${myres[1].name}</th>
									<th>${myres[1].rv_code}</th>
									<th>${myres[1].p_count}</th>
									
								 </tr>
								 
								 <tr>
								 	<th>${myres[0].airline}</th>
									<th>${myres[0].airinfo_flight}</th>
									<th>${myres[0].city_name}</th>
									<th>${myres[1].city_name}</th>
									<th>
										<fmt:parseDate value="${myres[0].d_time}" var="dtime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${dtime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>
										<fmt:parseDate value="${myres[0].a_time}" var="atime" pattern="yyyyMMddHHmm"/>
										<fmt:formatDate value="${atime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
									</th>
									<th>${myres[0].name}</th>
									<th>${myres[0].rv_code}</th>
									<th>${myres[0].p_count}</th>									
								 </tr>								 							 
								</tbody>																							
							</table>
							<c:choose>
							<c:when test="${myres[1].rv_code!=null}">
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
		
			<section id="post" class="wrapper bg-img" data-bg="four.jpg">
			
				<div class="inner" style="width:1200px;">
					<article class="box" >
					<form id="passins" action="inspassport.do" method="post">
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
					</table><input type="hidden" id="Mpasschk" name="aList[${status.index}].reservation_rv_code" value="${pass_rvcode}"/>
					
				</div>									
					
					</c:forEach>
			<c:forEach var="i" begin="${fn:length(alreadypass)+1}" end="${passport}">
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
							</table><input type="hidden" id="Mpasschk" name="aList[${i-1}].reservation_rv_code" value="${pass_rvcode}"/>
						</div>						
				</c:forEach>
			</form>
						<footer>
						<c:choose>
						<c:when test="${!empty myres[1].rv_code}">
							<input type="submit" class="button alt" id="savepass" value="저장하기">
							</c:when>
							<c:otherwise>
							<p>예약하신 내용이 없습니다.</p>
							</c:otherwise>
							</c:choose>
							<br/>
							<br/>
	<p>&nbsp; &#187; 여권상의 영문 이름과 반드시 동일해야하며 불일치시 탑승이 거절될수있습니다.</p>
	<p>&nbsp; &#187; 여권번호와 만료일이 없을시 임의로 기입하신 후 출국 72시간전 까지 여권과 동일하게 변경해 주시고 영문이름은 변경 불가합니다.</p>
    <p>&nbsp; &#187; 여권만료일이 출발일로부터 6개월 미만인 경우 출발 전에 여권기간을 연장하시기 바랍니다.</p>
    <p>&nbsp; &#187; 여권유효기간이 6개월 미만인 경우 입국허가요건이 국가별로 상이 하므로 외교통상부 사이트에서 확인하시기 바랍니다.</p>
    <p>&nbsp; &#187; 등록하신 여권정보에 변동사항이 있을 경우 출국 72시간전 까지 재등록이 가능합니다.</p>
    <p>&nbsp; &#187; 여권정보가 다르거나 누락된 경우 항공편 탑승 및 현지 입국이 거절될 수 있습니다.</p>
    <p>&nbsp; &#187; 고객 상담 문의 처리 시간 : 평일기준 09:00~17:00 / 주말, 공휴일 제외&nbsp;&nbsp;<a href="helpMain.do">고객문의 게시판</a>&nbsp;&nbsp;<a href="#banner">마이 페이지 홈으로</a></p>
						</footer>
					</article>
				</div>
			</section>
			
			
			
			

		<!-- Footer -->
			 <footer id="footer">
				
					<ul class="icons">
						<li><a href="#" class="icon round fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon round fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon round fa-instagram"><span class="label">Instagram</span></a></li>
					</ul>
					<div class="copyright">
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
					</div>
			</footer> 

		<!-- Scripts -->
			<script src="view/assets/js/jquery.min.js"></script>
			<script src="view/assets/js/jquery.scrolly.min.js"></script>
			<script src="view/assets/js/jquery.scrollex.min.js"></script>
			<script src="view/assets/js/skel.min.js"></script>
			<script src="view/assets/js/util.js"></script>
			<script src="view/assets/js/main.js"></script>

</body>
</html>