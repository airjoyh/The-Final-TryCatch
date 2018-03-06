<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 로그인 페이지</title>
</head>
<body>
	<h3>유저 로그인 페이지</h3>
	<hr>
	<form id="loginForm" action="/tcb/user/login">
		아이디: <input type="text" id="login_id" name="login_id"><br> 
		비밀번호: <input type="password" id="login_pass" name="login_pass">
		<input type="button" id="login" value="로그인"><br>
	</form>

</body>
</html>