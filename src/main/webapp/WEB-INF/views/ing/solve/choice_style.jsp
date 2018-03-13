<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class='example-choice'>
	<ul class="example-list">
	
		<c:forEach begin="1" end="5" var="index">
			<li>
				<div class="pure-radiobutton">
					<input id="radio${index}" name="radio" type="radio" class="radio">
					<label for="radio${index}">ⓐ 문제내용 ⓑ 문제내용</label>
				</div>
			</li>
		</c:forEach>

	</ul>
</div>