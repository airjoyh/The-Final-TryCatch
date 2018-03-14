<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>최종 합산 점수</title>
</head>
<body>
	<h3>${user_login_id }님의 ${contest.company_name } 기업 콘테스트 점수입니다.</h3>
	<hr>
	주최 기업 : ${contest.company_name }<br>
	콘테스트명 : ${contest.contest_title }<br>
	최종 점수 : ${scoreSum }
</body>
</html>