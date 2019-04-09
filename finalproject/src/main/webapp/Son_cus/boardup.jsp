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

<title>고객센터-공지사항</title>
<style type="text/css">
body {
	padding-top: 0px!important;
}
</style>
<!-- Bootstrap core CSS -->
<link href="Son_cus/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="Son_cus/css/blog-post.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#returnBtn').bind('click', function() {
			window.close();
		});
		
		//리셋버튼누르면 원래 자료로 되돌림
		$('#resetBtn').on('click', function() {
			$('#title').val(opener.document.getElementById("title").value);
			document.getElementById("b_content").value = opener.document.getElementById("b_content").value;
			document.getElementById("upload").value = opener.document.getElementById("upload").value;
		});
		
		$('#writeBtn').on('click', update);
		
		//부모창의 값가져와서 현제페이지에 듸움
		$('#title').val(opener.document.getElementById("title").value);
		document.getElementById("b_num").value = opener.document.getElementById("b_num").value;
		document.getElementById("b_content").value = opener.document.getElementById("b_content").value;
		document.getElementById("upload").value = opener.document.getElementById("upload").value;
		document.getElementById("user_id").value = opener.document.getElementById("user_id").value;
		
	});
	
	//업데이트처리
	function update(){
		var form = $('#frm')[0];
	    var data = new FormData(form);
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'blogUpPro.do',
			data : data,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			cache: false,
			success : blogUpPro()
		});
	}
	//업데이트 끝나면 부모창 새로고침하고 창을 닫음
	function blogUpPro() {
		opener.parent.location.reload();
		window.close();
	}
</script>

<style type="text/css">
</style>
</head>

<body>
	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-8">
			<h2 style="text-align: center;">공지사항 글수정</h2>
				<div class="container">
					<form id="frm" method="post" encType="multipart/form-data">
						<table class="table table-bordered">
							<tr>
								<th>제목:</th>
								<td><input id="title" type="text" placeholder="제목을 입력하세요. " 
									name="title" class="form-control" /></td>
							</tr>
							<tr>
								<th>내용:</th>
								<td><textarea id="b_content" cols="10"
										placeholder="내용을 입력하세요. " name="b_content" 
										class="form-control" style="height: 300px;"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일:</th>
								<td><input id="upload" type="file"
									placeholder="파일을 선택하세요. " name="upload" class="form-control" />
									<%-- <c:if test="${bdto.filename }!=null"></c:if> --%>
								</td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" value="수정"
									class="pull-right" id="writeBtn" /> <input type="button"
									value="reset" class="pull-left" id="resetBtn" /> <input
									type="button" value="닫기 " class="pull-right"
									id="returnBtn" />
								</td>
							</tr>
						</table>
						<input type="hidden" id="user_id" name="user_id"  />
						<input type="hidden" id="b_num" name="b_num" />
					</form>
				</div>
			</div>
	</div>
	<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="Son_cus/vendor/jquery/jquery.min.js"></script>
	<script src="Son_cus/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
