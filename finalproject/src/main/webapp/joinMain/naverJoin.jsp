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
	<form action="/myfinal/joinInsert.do" method="post">
		<input type="text" id="id" name="id"/>
		<input type="password" id="pass" name="pass"/>
		<input type="hidden" id="email" name="email" value="${email}">
		<input type="hidden" id="name" name="name" value="${name}">
		<button type="submit">회원가입</button>
	</form>
</body>
</html>