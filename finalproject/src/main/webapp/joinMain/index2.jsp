<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	${sessionScope.id }님 환영합니다.
	${sessionScope.token}이야~~~~~~~
	<a href="./joinMain/logout.jsp">로그아웃</a>
</div>
</body>
</html>