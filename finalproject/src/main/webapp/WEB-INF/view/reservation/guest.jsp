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
	<form>
		<table>
			<tr>
				<td>name</td><td><input type="text" name="rdto.non_name"></td>
			</tr>
			<tr>
				<td>gender</td>
				<td>
					<input type="radio" name="non_gender" value="남">남
					<input type="radio" name="non_gender" value="여">여
				</td>
			</tr>
			<tr>
				<td>phone</td><td><input type="text" name="rdto.non_phonenumber"></td>
			</tr>
			<tr>
				<td>email</td><td><input type="text" name="rdto.non_email"></td>
			</tr>
			<tr>
				<td>password</td><td><input type="text" name="rdto.non_password"></td>
			</tr>
		</table>
		<input type="hidden" name="rdto" value="${rdto}">
	</form>
</body>
</html>