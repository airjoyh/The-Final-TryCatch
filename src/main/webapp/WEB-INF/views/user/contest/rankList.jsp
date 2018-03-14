<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>구직자 콘테스트 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%--C태그를 사용하기 위한 라이브러리 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>콘테스트 점수 순위 리스트</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.initial').hide();
		$('.tdTtl').mouseenter(function() {

		});
		
		

		$('#myTab a:last').tab('show');
		
		
		$('#searchBtn').on("click", function(event) {
		//검색(Search) 버튼을 클릭하면
			self.location = "rankList" //'list'
							+ '${pageMaker.makeQuery(1)}'
							  //'list?page=1&perPageNum=10'
							+ "&searchType="
							//'list?page=1&perPageNum=10&searchType='
							+ $("select option:selected").val()
							//'list?page=1&perPageNum=10&searchType=t'
							+ "&keyword=" + $('#keywordInput').val()
							//'list?page=1&perPageNum=10&searchType=t&keyword=�ㅻ뒛'
							+"&contest_id=${param.contest_id}";
		});

		
	});//document.ready
	/* 검색창 드롭다운 메뉴 */
	$('.taco').click(function(e) {
		var txt = $(e.target).text();
		$('.taco-input').val(txt);
	});

</script>

<link href="${initParam.rootPath }/resources/css/trycatch.css" rel="stylesheet">
</head>
<body style="background-color: #f4f4f4;">
<%@include file="../../userNavBar.jsp" %>
<div class="container" style="background-color: #ffffff;">
		<div class="row"
			style="padding-top: 3em; padding-left: 4em; padding-right: 4em; padding-bottom: 2em; margin-bottom: 1em;">
			<h3>콘테스트 순위</h3>
			<hr>
		</div>
		<div class="row" style="padding-left: 3em; padding-right: 3em;">
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 25%;">순위</th>
							<th style="width: 50%;">아이디</th>
							<th style="width: 25%;">점수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="contest_answer" varStatus="stat">
							<tr>
								<td style="width: 25%;">${contest_answer.rank }</td>
								<td style="width: 50%;">${contest_answer.user_id }</td>
								<td style="width: 25%;">${contest_answer.totalScore }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
			</div>
		</div>
		<div align="center">
		<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
		<li 
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="list${pageMaker.makeSearch(idx)}&company_id=${param.company_id }">${idx}</a>
		</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&company_id=${param.company_id }">&raquo;</a></li>
		</c:if>			
		</ul>
		</div>
		<div class='box-body'>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							검색조건</option>
						<option value="a"
							<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
							아이디</option>							
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>

				</div>
	</div>
</body>
</html>
