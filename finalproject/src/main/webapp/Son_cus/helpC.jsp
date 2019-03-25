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
		
		if('${pv.currentPage==1}'){
			$('#preBtn').removeClass();
			$('#preBtn').addClass('page-item disabled');
		}else{
			$('#preBtn').removeClass();
			$('#preBtn').addClass('page-item');
		};
		if('${pv.currentPage==pv.totalPage}'){
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
			<a class="navbar-brand" href="#">Start Bootstrap</a>
			<jsp:include page="kakaoLogin.jsp"></jsp:include>
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
					고객센터 
					<c:if test="${pv.searchWord!=null }">
					<small>"${pv.searchWord }" 검색결과</small>
					</c:if>
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<table cellspacing='0'>
						<tr>
							<th>Num</th>
							<th>Title</th>
							<th>Count</th>
							<th>Date</th>
						</tr>

						<c:forEach var="dto" items="${HList}">
							<tr>
								<td><a
									href="helpBlog.do?b_num=${dto.b_num}&currentPage=${pv.currentPage}">${dto.b_num }</a></td>
								<td><a
									href="helpBlog.do?b_num=${dto.b_num}&currentPage=${pv.currentPage}">${dto.title }</a></td>
								<td>${dto.viewcount }</td>
								<td>${dto.upload_date }</td>
							</tr>
						</c:forEach>
					</table>

				</div>
				<%-- login
				<c:if test="test01==(String)session.getAttribute('id')"></c:if> --%>
				<form action="boardWirete.do" method="post">
					<input type="submit" id="bwriteBtn" value="글쓰기" />
				</form>
				
				<!-- Blog Post -->
				<!-- <div class="card mb-4">
					<img class="card-img-top" src="http://placehold.it/750x300"
						alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
							quis soluta, a laboriosam. Dicta expedita corporis animi vero
							voluptate voluptatibus possimus, veniam magni quis!</p>
						<a href="#" class="btn btn-primary">Read More &rarr;</a>
					</div>
					<div class="card-footer text-muted">
						Posted on January 1, 2017 by <a href="#">Start Bootstrap</a>
					</div>
				</div> -->

				<!-- Blog Post -->
				<!-- <div class="card mb-4">
					<img class="card-img-top" src="http://placehold.it/750x300"
						alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
							quis soluta, a laboriosam. Dicta expedita corporis animi vero
							voluptate voluptatibus possimus, veniam magni quis!</p>
						<a href="#" class="btn btn-primary">Read More &rarr;</a>
					</div>
					<div class="card-footer text-muted">
						Posted on January 1, 2017 by <a href="#">Start Bootstrap</a>
					</div>
				</div> -->

				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">

					<li id="preBtn">
						<c:if test="${pv.searchWord != null }">
						<a class="page-link" href="blogSearch.do?currentPage=${pv.currentPage-1 }&searchWord=${pv.searchWord}">&larr;Newer</a>
						</c:if>
						<c:if test="${pv.searchWord == null }">
						<a class="page-link" href="helpMain.do?currentPage=${pv.currentPage-1 }">&larr;Newer</a>
						</c:if>
					</li>

					<li id="nextBtn">
						<c:if test="${pv.searchWord != null }">
						<a class="page-link" href="blogSearch.do?currentPage=${pv.currentPage+1 }&searchWord=${pv.searchWord}">Older&rarr;</a>
						</c:if>
						<c:if test="${pv.searchWord == null }">
						<a class="page-link" href="helpMain.do?currentPage=${pv.currentPage+1 }">Older&rarr;</a>
						</c:if>
					</li>

				</ul>

			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Title Search</h5>
					<div class="card-body">
						<div class="input-group">
							<form action="blogSearch.do" method="get">
								<input name="searchWord" type="text" class="form-control" placeholder="Search for...">
								<span class="input-group-btn">
									<input type="submit" class="btn btn-secondary" value="Go!"></input>
								</span>
							</form>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<jsp:include page="map.jsp"></jsp:include>
								<!-- <ul class="list-unstyled mb-0">
									<li><a href="http://map.daum.net/link/to/케이에이치에어,35.587951,127.087007">지도보기</a></li>
									<li><a href="#">HTML</a></li>
									<li><a href="#">Freebies</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorials</a></li>
								</ul> -->
				<!-- Side Widget -->
				</div>

				<div class="card my-4">
					<jsp:include page="helpchatOpen.jsp"></jsp:include>
					<!-- <h5 class="card-header">1:1 고객상담센터</h5>
					<div class="card-body" style="height:150px;">
						<div id="chatMessageArea"></div>
					</div>
					<div><input type="text" style="width:85%;"/><input type="button" value="전송" style="width:15%;"></div> -->
				</div>

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	</div>
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<!-- <div class="container"> -->
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		<!-- </div> -->
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./Son_cus/vendor/jquery/jquery.min.js"></script>
	<script src="./Son_cus/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
