<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<form action="selectFlight.do" method="get">
		<table>
			<tr>
				<td>name</td><td><input type="text" name="non_name"></td>
			</tr>
			<tr>
				<td>gender</td>
				<td>
					<input type="radio" name="non_gender" value="남">남
					<input type="radio" name="non_gender" value="여">여
				</td>
			</tr>
			<tr>
				<td>phone</td><td><input type="text" name="non_phone" placeholder="'-'를 제외하고 입력하세요"></td>
			</tr>
			<tr>
				<td>email</td><td><input type="text" name="non_email"></td>
			</tr>
			<tr>
				<td>password</td><td><input type="password" name="non_pass"></td>
			</tr>
			<tr><td><input type="submit" value="전송"></td></tr>
		</table>
		<input type="hidden" name="dep_date" value="${rdto.dep_date}">
		<input type="hidden" name="arv_date" value="${rdto.arv_date}">
		<input type="hidden" name="city_code_dep" value="${rdto.city_code_dep}">
		<input type="hidden" name="city_code_arv" value="${rdto.city_code_arv}">
		<input type="hidden" name="p_count" value="${rdto.p_count}">
		<input type="hidden" name="guestchk" value="${rdto.guestchk}">
	</form>
</body>
</html>