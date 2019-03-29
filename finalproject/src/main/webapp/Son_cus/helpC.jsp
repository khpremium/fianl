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

<!-- Custom styles for this template -->
<link href="Son_cus/css/blog-home.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		if(${(pv.totalPage-pv.currentPage)!=0}){
			$('#preBtn').removeClass();
			$('#preBtn').addClass('page-item disabled');
		}else{
			$('#preBtn').removeClass();
			$('#preBtn').addClass('page-item');
		};
		if(${pv.currentPage==pv.totalPage}){
			$('#nextBtn').removeClass();
			$('#nextBtn').addClass('page-item disabled');
		}else{
			$('#nextBtn').removeClass();
			$('#nextBtn').addClass('page-item');
		};
	});
</script>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="helpMain.do">KH Air</a>
			<jsp:include page="kakaoLogin.jsp"></jsp:include>
			<jsp:include page="naverLogin.jsp"></jsp:include>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<h1 class="my-4">
					고객센터<small>-공지사항</small>
					<c:if test="${pv.searchWord!=null }">
						<form action="helpBoard.do" method="get">
							<span class="input-group-btn">
								<button class="btn btn-secondary" type="submit" id="returnBtn"
									style="float: right;">목록으로</button>
							</span>
						</form>
					</c:if>
					<c:if test="${pv.searchWord!=null }">
						<small>"${pv.searchWord }" 검색결과</small>
					</c:if>
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<table cellspacing='0'>
						<tr>
							<th style="width: 15%; text-align: center;">Num</th>
							<th style="width: 40%; text-align: center;">Title</th>
							<th style="width: 15%; text-align: center;">Count</th>
							<th style="width: 30%; text-align: center;">Date</th>
						</tr>
						<c:forEach var="dto" items="${HList}">
							<tr>
								<td style="text-align: center;"><a
									href="helpBlog.do?b_num=${dto.b_num}&currentPage=${pv.currentPage}">${dto.b_num }</a></td>
								<td><a
									href="helpBlog.do?b_num=${dto.b_num}&currentPage=${pv.currentPage}">${dto.title }</a></td>
								<td style="text-align: center;">${dto.viewcount }</td>
								<td style="text-align: center;">${dto.upload_date }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<%-- login
				<c:if test="admin==(String)session.getAttribute('id')"> --%>
				<form action="boardWirete.do" method="post">
				<span class="input-group-btn">
					<input type="submit" id="bwriteBtn" value="글쓰기" />
				</span>
				</form>
				<%-- </c:if> --%>
				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">

					<li id="preBtn"><c:if test="${pv.searchWord != null }">
							<a class="page-link"
								href="blogSearch.do?currentPage=${pv.currentPage-1 }&searchWord=${pv.searchWord}">&larr;Newer</a>
						</c:if> <c:if test="${pv.searchWord == null }">
							<a class="page-link"
								href="helpBoard.do?currentPage=${pv.currentPage-1 }">&larr;Newer</a>
						</c:if></li>

					<li id="nextBtn"><c:if test="${pv.searchWord != null }">
							<a class="page-link"
								href="blogSearch.do?currentPage=${pv.currentPage+1 }&searchWord=${pv.searchWord}">Older&rarr;</a>
						</c:if> <c:if test="${pv.searchWord == null }">
							<a class="page-link"
								href="helpBoard.do?currentPage=${pv.currentPage+1 }">Older&rarr;</a>
						</c:if></li>
				</ul>
				
				
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4" style="margin-top: 75px!important;">
				<!-- Search Widget -->
				<div class="card my-4">
					<jsp:include page="helpCsearch.jsp"></jsp:include>
				</div>
				<!-- Map Widget -->
				<%-- <div class="card my-4">
					<jsp:include page="map.jsp"></jsp:include>
				</div> --%>
				
				<!-- Chat Widget -->
				<%-- <div class="card my-4">
					<jsp:include page="helpchatOpen.jsp"></jsp:include>
				</div> --%>

			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- Footer -->
	<!-- 링크 -->
				<!-- <div class="card my-4" style="margin-bottom:0px!important; background-color: #343a40;">
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="helpBoard.do" style="color: white;">공지사항</a>
                  </li>
                  <li>
                    <a href="#">HTML</a>
                  </li>
                  <li>
                    <a href="#">Freebies</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div> -->
			<!-- 링크끝 -->
	<footer class="py-5 bg-dark" style="position: fixed;bottom: 0;width: 100%;">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2019</p>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./Son_cus/vendor/jquery/jquery.min.js"></script>
	<script src="./Son_cus/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
