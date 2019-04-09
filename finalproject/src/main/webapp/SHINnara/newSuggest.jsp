<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="SHINnara/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="SHINnara/assets/js/jquery.min.js"></script>
<script src="SHINnara/assets/js/jquery.scrolly.min.js"></script>
<script src="SHINnara/assets/js/jquery.scrollex.min.js"></script>
<script src="SHINnara/assets/js/skel.min.js"></script>
<script src="SHINnara/assets/js/util.js"></script>
<script src="SHINnara/assets/js/main.js"></script>
<style type="text/css">
 .box{
    width: auto !important;
    height: 350px !important;
    float: left;
    margin-left: 3px !important;

    
 }
</style>
</head>
<body>
			<section id="two" class="wrapper post bg-img" data-bg="../SHINnara/assets/images/banner5.jpg">
				
				<div class="inner">
				<c:forEach var="boardDTO" items="${bList}" end="2">
					<article class="box" >
					 <img data-bg="../SHINnara/images/busan.jpg">
						<header>
							<h2>${boardDTO.title }</h2>
							<p></p>
						</header>
						<div class="content">
							<p>${boardDTO.b_content}</p>
						</div>
						<footer>
					<c:url var="path" value="suggestView.do">
					<c:param name="currentPage" value="${pv.currentPage}" />
					<c:param name="b_num" value="${boardDTO.b_num}" />
				    </c:url>
							<a href="${path }" class="button alt">게시물로 가기</a>
						</footer>
					</article>
				</c:forEach>
				
				</div>
				<a href="#three" class="more">게시판으로 가기</a>
				
			</section>
</body>
</html>