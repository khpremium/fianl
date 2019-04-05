<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>고객센터</title>

<!-- Bootstrap core CSS -->
<link href="Son_cus/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="Son_cus/assets/css/main.css" />
<style> 
/* 마스크 뛰우기 */
#mask2 {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window2{
    display: none;
    position:absolute;  
    left:50%;
    top:50px;
    margin-left: -500px;
    width:500px;
    height:400px;
    background-color:#FFF;
    z-index:10000;   
 }
 
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if('${pv.startPage}'>1){
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
		};
		
	});
	function showPopup() { window.open("boardWirete.do", "a", "width=506, height=546, left=150, top=100"); }

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
	
	<section id="one" class="wrapper post bg-img" data-bg="../Son_cus/images/backg6.jpg">
	
	<!-- Page Content -->
		<div class="inner">
			<article class="box">
			<!-- <article class="box"> -->
				<header>
					<h2 >공지사항</h2><p>
						<c:if test="${pv.searchWord!=null }">
							<h4 style="color:white;">"${pv.searchWord }" 검색결과</h4>
						</c:if>
						<jsp:include page="helpCsearch.jsp"></jsp:include>
					</p>
				</header>
				<!-- Blog Post -->
				<div class="content">
					<table >
						<tr>
							<th style="width: 10%; text-align: center;">Num</th>
							<th style="width: 50%; text-align: center;">Title</th>
							<th style="width: 10%; text-align: center;">Count</th>
							<th style="width: 30%; text-align: center;">Date</th>
						</tr>
						<c:forEach var="dto" items="${HList}">
							<tr>
								<td style="text-align: center;"><a
									href="helpBlog.do?b_num=${dto.b_num}&currentPage=${pv.currentPage}">${dto.b_num }</a></td>
								<td><a
									href="helpBlog.do?b_num=${dto.b_num}&currentPage=${pv.currentPage}">${dto.title }</a></td>
								<td style="text-align: center;"><p style="color:white;">${dto.viewcount }</p></td>
								<td style="text-align: center;"><p style="color:white;">${dto.upload_date }</p></td>
							</tr>
						</c:forEach>
					</table>
				</div>
					<footer>
					<%-- login --%>
					<c:if test="admin==(String)session.getAttribute('id')">
					<span class="input-group-btn">
						<input type="submit" class="button" id="bwriteBtn" value="글쓰기" onclick="showPopup();"/>
					</span>
					</c:if>
					<!-- Pagination -->
							<c:if test="${pv.searchWord != null }">
								<a id="preBtn" class="button alt small"
									href="blogSearch.do?currentPage=${pv.currentPage-1 }&searchWord=${pv.searchWord}">&larr;Newer</a>
							</c:if> 
							<c:if  test="${pv.searchWord == null }">
								<a id="preBtn" class="button alt small" href="helpBoard.do?currentPage=${pv.currentPage-1 }">&larr;Newer</a>
							</c:if>
							<c:if test="${pv.searchWord != null }">
								<a id="nextBtn" class="button small" href="blogSearch.do?currentPage=${pv.currentPage+1 }&searchWord=${pv.searchWord}">Older&rarr;</a>
							</c:if> 
							<c:if test="${pv.searchWord == null }">
								<a id="nextBtn" class="button small" href="helpBoard.do?currentPage=${pv.currentPage+1 }">Older&rarr;</a>
							</c:if>
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
