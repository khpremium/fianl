<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>고객센터-공지사항</title>

<!-- Bootstrap core CSS -->
<link href="Son_cus/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="Son_cus/css/blog-post.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#comIns').on('click', reply_list);

	});

function reply_list(){
	alert($('#comInsText').val());
	
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'comInsertList.do?user_id=test01&cm_content='+$('#comInsText').val()+'&board_b_num=${bdto.b_num}',
		success:reply_list_result
	});
	
}

function reply_list_result(res){
	alert(res);
	$('#comlist').empty();
	
	$.each(res, function(index, value){
		$('#comlist').append('<div class="media mb-4"><img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""><div class="media-body"><h4 class="mt-0">'+
				value.user_id+'</h4><h6 class="mt-0">'+value.c_date+'</h6>'+value.cm_content+'</div></div>');
	});
	alert("reply_list_result end!");
	$('#comInsText').val('');
	/* <div class="media mb-4"><img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""><div class="media-body"><h4 class="mt-0">${cdto.user_id }</h4><h6 class="mt-0">${cdto.c_date }</h6>${cdto.cm_content }</div></div> */
}
</script>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Start Bootstrap</a>
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

			<!-- Post Content Column -->
			<div class="col-lg-8">

				<!-- Title -->
				<h1 class="mt-4">${bdto.title }</h1>
				<%-- <input type="hidden" value="${bdto.b_num }" id="bnum"> --%>
				
				<!-- Author -->
				<p class="lead">
					by <a href="#">admin<%-- ${bdto.client_id } --%></a>
				</p>

				<hr>

				<!-- Date/Time -->
				<p>${bdto.upload_date }</p>
				<hr>

				<!-- Preview Image -->
				<img class="img-fluid rounded" src="http://placehold.it/900x300"
					alt="">

				<hr>

				<!-- Post Content -->
				<p>${bdto.b_content }</p>

				<hr>

				<!-- Comments Form -->
				<div class="card my-4">
					<h5 class="card-header">Leave a Comment:</h5>
					<form action=""></form>
					<div class="card-body">
						<form>
							<div class="form-group">
								<textarea class="form-control" rows="3" id="comInsText"></textarea>
							</div>
							<button type="submit" class="btn btn-primary" id="comIns">Submit</button>
						</form>
					</div>
				</div>

				<div id="comlist">
					<!-- Single Comment -->
					<c:forEach var="cdto" items="${cList }">
						<div class="media mb-4">
							<img class="d-flex mr-3 rounded-circle"
								src="http://placehold.it/50x50" alt="">
							<div class="media-body">
								<h4 class="mt-0">${cdto.user_id }</h4>
								<h6 class="mt-0">${cdto.c_date }</h6>
								${cdto.cm_content }
							</div>
						</div>
					</c:forEach>
					<!-- Comment with nested comments -->
				</div>

			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..." > <span
								class="input-group-btn">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">Categories</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">Web Design</a></li>
									<li><a href="#">HTML</a></li>
									<li><a href="#">Freebies</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorials</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">1:1 고객상담센터</h5>
					<div class="card-body" style="height: 150px;">
						<div id="chatMessageArea"></div>
					</div>
					<div>
						<input type="text" style="width: 85%;" /><input type="button"
							value="전송" style="width: 15%;">
					</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="Son_cus/vendor/jquery/jquery.min.js"></script>
	<script src="Son_cus/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
