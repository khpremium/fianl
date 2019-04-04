<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>여행박사 손진호(주)</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="Son_cus/assets/css/main.css" />
		<script type="text/javascript">
		$(document).ready(function() {
			
			/* if('${pv.startPage}'>1){
				$('#preBtn').removeClass();
				$('#preBtn').addClass('button small');
			}else{
				$('#preBtn').removeClass();
				$('#preBtn').addClass('button alt small');
			};
			if('${pv.endPage}'<'${pv.totalPage}'){
				$('#nextBtn').removeClass();
				$('#nextBtn').addClass('button small');
			}else{
				$('#nextBtn').removeClass();
				$('#nextBtn').addClass('button alt small');
			}; */
			
			$('#sendmail').on('click',function(){
				if($('#subject').val()=='' || $('#from').val()=='' || $('#password').val()=='' || $('#contents').val()==''){
					alert('빈 칸이 있습니다.');
					return false;
				}
				var str = $('#from').val();
				var res = str.split("@");
				if(res[1] != 'gmail.com'){
					alert('gmail을 사용해주세요.');
					return false;
				}
				
				var maildata = 'subject='+$('#subject').val()+'&from='+$('#from').val()+'&password='+$('#password').val()+'&contents='+$('#contents').val();
				$.ajax({
					type:'POST',
					dataType:'text',
					url:'sendMail2.do',
					data:maildata,
					success:sendMail2,
					error:function(request,status,error){
						alert('PW확인해주세요.');
						alert('PW가 맞으면  https://myaccount.google.com/security > 보안 > 보안 수준이 낮은 앱의 액세스 > 사용 으로 변경해주세요.');
					}
				});
			});
		});
		
		function sendMail2(res){
			alert('메일전송 완료');
			$('#subject').val('');
			$('#from').val('');
			$('#password').val('');
			$('#contents').val('');
		}
		</script>
	</head>
	<body>
		
		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="helpMain.do">여행박사손진호 <span>(주)</span></a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="helpMain.do">Home</a></li>
					<li><a href="Son_cus/generic.html">Generic</a></li>
					<li><a href="Son_cus/elements.html">Elements</a></li>
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
			<section id="banner" class="bg-img" data-bg="../Son_cus/images/banner.jpg">
				<div class="inner">
					<header>
						<h1>About KHAir</h1>
					</header>
				</div>
				<a href="#one" class="more">Learn More</a>
			</section>

		<!-- One -->
			<section id="one" class="wrapper post bg-img" data-bg="../Son_cus/images/banner2.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>${bdto.title }</h2>
							<p>${bdto.upload_date }</p>
						</header>
						<div class="content">
							<p>${bdto.b_content }</p>
						</div>
						<footer>
							<a href="helpBoard.do?currentPage=1" class="button alt">공지사항 전체보기</a>
						</footer>
					</article>
				</div>
				<a href="#two" class="more">Learn More</a>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper post bg-img" data-bg="../Son_cus/images/banner5.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>실시간 문의</h2>
							<!-- <p>12.21.2016</p> -->
						</header>
						<div class="content">
							<p>여행박사손진호(주)는 채팅 상담 내용을 저장, 보관할 수 있고, 고객께서 유사 또는 동일한 내용으로 다시 상담하는 경우, 상담내용과 관련하여 관련 분쟁이 발생하는 경우 등 필요한 경우에 한하여 이를 열람할 수 있으며, 법령에서 정한 경우 외에는 이를 제3자에게 제공하지 않습니다.
								<br/>채팅 상담 내용 및 기록은 「개인정보 보호법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「부정경쟁방지 및 영업비밀보호에 관한 법률」의 적용을 받습니다.</p>
						</div>
						<footer>
							<!-- <a href="../Son_cus/generic.html" class="button alt">Learn More</a> -->
							<jsp:include page="helpchatOpen.jsp"></jsp:include>
						</footer>
					</article>
				</div>
				<a href="#three" class="more">Learn More</a>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper post bg-img" data-bg="../Son_cus/images/banner4.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>The way</h2>
							<!-- <p>11.11.2016</p> -->
						</header>
						<div class="content">
							<table>
								<tr>
									<th>주소</th>
									<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F (T: 1544-9970 / F: 02-562-2378)</td>
								</tr>
								<tr>
									<th rowspan="2" style="vertical-align:middle;">버스</th>
									<td>역삼역.포스코P&S타워 정류장</td>
								</tr>
								<tr>
									<td>지선 146 / 740 / 341 / 360  &nbsp;&nbsp;&nbsp; 간선 1100 / 1700 / 2000 / 7007 / 8001</td>
								</tr>
								<tr>
									<th>지하철</th>
									<td>지하철 2호선 역삼역 3번출구 100m</td>
								</tr>
							</table>
							<br/>
							<jsp:include page="map.jsp"></jsp:include>
						</div>
						<footer>
						</footer>
					</article>
				</div>
				<a href="#four" class="more">↓</a>
			</section>

		<!-- Four -->
			<section id="four" class="wrapper post bg-img" data-bg="../Son_cus/images/banner3.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>개인정보 처리 방침</h2>
							<p>최종 업데이트 2019-03-28</p>
						</header>
						<div class="content">
							<table style="margin-bottom: 0px; border-collapse: inherit;">
								<tr>
									<th style="text-align:center; opacity:0.5" ><img class="img-circle" alt="#" src="Son_cus/images/개인정보1.png"/></th>
									<th style="text-align:center; opacity:0.5"><img class="img-circle" alt="#" src="Son_cus/images/개인정보2.png" /></th>
									<th style="text-align:center; opacity:0.5"><img class="img-circle" alt="#" src="Son_cus/images/개인정보3.png" /></th>
								</tr>
								<tr>
									<th style="text-align:center;">문제가 발생할 일은 없습니다!</th>
									<th style="text-align:center;">고객 정보 보안을 유지합니다.</th>
									<th style="text-align:center;">항상 관리에 힘씁니다.</th>
								</tr>
								<tr>
									<td><p>당사는 본 처리방침에서 설명하는 방식에 한해서만 고객의 정보를 수집, 이용 및 공유합니다.</p></td>
									<td><p>고객이 제공한 개인 데이터의 기밀 유지 및 보안에 최선을 다합니다.</p></td>
									<td><p>언제든 고객 프로필 및 커뮤니케이션 기본 설정을 업데이트할 수 있습니다.</p></td>
								</tr>
							</table>
						</div>
						<footer>
							<a href="rodlswjdqh.do" class="button alt">Read More</a>
						</footer>
					</article>
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<jsp:include page="sendEmail.jsp"></jsp:include>
			</footer>

		<!-- Scripts -->
			<script src="Son_cus/assets/js/jquery.min.js"></script>
			<script src="Son_cus/assets/js/jquery.scrolly.min.js"></script>
			<script src="Son_cus/assets/js/jquery.scrollex.min.js"></script>
			<script src="Son_cus/assets/js/skel.min.js"></script>
			<script src="Son_cus/assets/js/util.js"></script>
			<script src="Son_cus/assets/js/main.js"></script>

	</body>
</html>