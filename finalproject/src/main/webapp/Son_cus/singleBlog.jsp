
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>고객센터-공지사항</title>
<!-- <link rel="stylesheet" href="Son_cus/assets/css/main.css" /> -->
<!-- Bootstrap core CSS -->
<link href="Son_cus/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="Son_cus/assets/css/main.css" /> -->
<!-- Custom styles for this template -->
<link href="Son_cus/css/blog-post.css" rel="stylesheet">
<style type="text/css">
body{
	background-color: white!important;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		<%-- <%session.setAttribute("id","test01");%> --%>
		
		$('#comIns').on('click', reply_list);

		/* 삭제버튼 */
		$('#delBtn').on('click', function() {
			$('#sbf').attr('action', 'blogDel.do');
			$('#sbf').submit();
		});

		/* 수정버튼 */
		$('#updBtn').on('click', function() {
			openWin = window.open("blogUpForm.do", "a", "width=506, height=546, left=150, top=100");
		});
		
		/*댓글삭제*/
		$(document).on("click", '[src="images/삭제.png"]', reply_del);
		
		/*댓글 수정폼*/
		$(document).on("click", '[src="images/수정.png"]', reply_updForm);
		
		/*댓글 수정Pro*/
		$(document).on("click", '[src="images/수정2.png"]', reply_updPro);
	});
	
	function reply_updForm(){
		var condiv = $(this).prev().prev().prev().children()[2];
		var context = $(condiv, 'div').text();
		
		var cm_num = $(this).prev().val();
		$(condiv).parent().append('<input type="text" id="comupText" name="cm_content">'
					+'<input type="hidden" name="cm_num" value="'+cm_num+'">'
					+'<input type="image" id="updProBtn" src="images/수정2.png" width="30px" height="32px">');
		$(condiv).next().val(context);
		$(condiv, 'div').remove();
		$('[src="images/수정.png"]').remove();
	}
	
	function reply_updPro(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'hComUpd.do?cm_num='+$('#updProBtn').prev().val()+'&cm_content='+$('#updProBtn').prev().prev().val()+'&board_b_num=${bdto.b_num}',
			success : reply_list_result
		});
	}
	
	function reply_del(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'hComDel.do?cm_num='+$(this).next().val()+'&b_num=${bdto.b_num}',
			success : reply_list_result
		});
		
	}
	
	function reply_list() {
		/* alert($('#comInsText').val());
		alert(bnumm); */
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'comInsertList.do?user_id='+'${sessionScope.id}'+'&cm_content='
					+ $('#comInsText').val() + '&board_b_num=${bdto.b_num}',
			success : reply_list_result
		});
	}

	function reply_list_result(res) {
		/* alert(res); */
		$('#comlist').empty();
		$.each(res, function(index, value) {
							var sdata = new Date(value.c_date);
							var sm = sdata.getFullYear()+"-";
							sm+=(sdata.getMonth()+1)+"-";
							sm+=sdata.getDate();
							var coment = '<div class="media mb-4"><img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">';
								coment	+='<div class="media-body"><h4 class="mt-0">';
								coment+= value.user_id;
								coment+= '</h4><h6 class="mt-0">';
								coment+= sm;
								coment+= '</h6><div id="cm_content">';
								coment+= value.cm_content;
								coment+= '</div></div>';
								if(value.user_id=='${sessionScope.id}'){
									coment+='<input type="image" src="images/삭제.png"  width="30px"	height="30px">'
									coment+='<input type="hidden" name="cm_num" value="'+value.cm_num+'">'
									coment+='<input type="image" src="images/수정.png" width="30px"	height="32px">'
									coment+'<input type="hidden" name="cm_content" value="'+value.cm_content +'"></div>';
								}				
							$('#comlist').append(coment);						
		});
		$('#comInsText').val('');
	}
</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<!-- Post Content Column -->
			<div class="col-lg-8">
				<!-- Title -->
				<h1 class="mt-4">${bdto.title }</h1>
				<!-- Author -->
				<p class="lead">
					by <a href="#">admin<%-- ${bdto.client_id } --%></a>
				</p>

				<hr>

				<!-- Date/Time -->
				<p>${bdto.upload_date }</p>
				<hr>

				<!-- Preview Image -->
				<c:if test="${bdto.filename!=null }">
					<img class="img-fluid rounded"
						src="images/${bdto.filename}"
						alt="#">
					<hr>
				</c:if>
				<!-- Post Content -->
				<p>${bdto.b_content }</p>

				<hr>
				<form method="get" id="sbf">
					<table>
						<tr>
							<td><a
								href="helpBoard.do?b_num=${bdto.b_num }&currentPage=${currentPage }">뒤로</a></td>
							<c:if test="${ admin==sessionScope.id}">
								<td>
									<input type="button" value="수정" class="pull-right" id="updBtn" style="text-align ': right" />
									<input type="button" value="삭제" class="pull-right" id="delBtn" style="text-align ': right" />
								</td>
							</c:if>
						</tr>
					</table>
					<input type="hidden" id="b_num" name="b_num" value="${bdto.b_num }">
					<input type="hidden" name="currentPage" value="${currentPage }">
					<input type="hidden" id="user_id" name="user_id" value="${bdto.user_id }">
					<input type="hidden" id="title" name="title" value="${bdto.title }">
					<input type="hidden" id="b_content" name="b_content" value="${bdto.b_content }">
					<input type="hidden" id="upload" name="upload" value="${bdto.upload }">
				</form>
				<hr>
				<!-- </article> -->
				<!-- Comments Form -->
				<div class="card my-4">
					<h5 class="card-header">Leave a Comment:</h5>

					<div class="card-body">

						<div class="form-group">
							<textarea class="form-control" rows="3" id="comInsText"></textarea>
						</div>
						<c:choose>
							<c:when test="${sessionScope.id!=null}">
								<button type="submit" class="btn btn-primary" id="comIns">Submit</button>
							</c:when>
							<c:otherwise>
								<div>로그인후 이용가능</div>
							</c:otherwise>
						</c:choose>
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
								<div id="cm_content">${cdto.cm_content } </div>
							</div>
							<c:if test="${cdto.user_id==sessionScope.id}">
								<input type="image" src="images/삭제.png" width="30px"	height="30px">
								<input type="hidden" name="cm_num" value="${cdto.cm_num }">
								<input type="image" src="images/수정.png" width="30px"	height="32px">
								<input type="hidden" name="cm_content" value="${cdto.cm_content }">
							</c:if>
						</div>
					</c:forEach>
					<!-- Comment with nested comments -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="./Son_cus/vendor/jquery/jquery.min.js"></script>
	<script src="./Son_cus/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>

</html>
