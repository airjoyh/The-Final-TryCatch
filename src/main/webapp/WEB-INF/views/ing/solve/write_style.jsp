<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class='example-write'>
	<c:forEach begin="1" end="5" var="index">
		<input type="text" id='solve-${index}' placeholder="${index}번 빈칸의 정답을 입력하세요.">
	</c:forEach>
</div>
<!-- example-write -->