<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
	<form action="find_pw.do" method="post">
			<fieldset>
				<p>비밀번호 찾기</p>
				<div>
					<input type="text" id="id" name="id" />
				</div>
				<div>
					<input type="text" id="email" name="email" />
				</div>
				<div>
					<button type="submit" id="findBtn2">find</button>
					<button type="button" onclick="history.go(-1);">cancle</button>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>