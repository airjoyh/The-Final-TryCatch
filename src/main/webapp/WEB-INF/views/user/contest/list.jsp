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

<title>구직자 콘테스트 리스트</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.initial').hide();
		$('.tdTtl').mouseenter(function() {

		
		

		$('#myTab a:last').tab('show');
		
		
		$('#searchBtn').on("click", function(event) {
		//검색(Search) 버튼을 클릭하면
			self.location = "list" //'list'
							+ '${pageMaker.makeQuery(1)}'
							  //'list?page=1&perPageNum=10'
							+ "&searchType="
							//'list?page=1&perPageNum=10&searchType='
							+ $("select option:selected").val()
							//'list?page=1&perPageNum=10&searchType=t'
							+ "&keyword=" + $('#keywordInput').val()
							//'list?page=1&perPageNum=10&searchType=t&keyword=�ㅻ뒛'
							+"&company_id=${company_login_company_id}";
		});

		$('#newBtn').on("click", function(evt) {//글쓰기(New Board) 버튼을 클릭하면

			self.location = "register";//입력폼으로 이동

		});
		
	});//document.ready
	/* 검색창 드롭다운 메뉴 */
	$('.taco').click(function(e) {
		var txt = $(e.target).text();
		$('.taco-input').val(txt);
	});
});

	function loginCheck() {

		var loginState = '${company_loginState }';
		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
		} else {
			location.href = '${initParam.rootPath }/company/contest/register';
			//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
		}
	}
</script>

<link href="${initParam.rootPath }/resources/css/trycatch.css" rel="stylesheet">
</head>
<body style="background-color: #f4f4f4;">
<%@include file="../../userNavBar.jsp" %>
<div class="container" style="background-color: #ffffff;">
		<div class="row"
			style="padding-top: 3em; padding-left: 4em; padding-right: 4em; padding-bottom: 2em; margin-bottom: 1em;">
			<h3>구직자 콘테스트 게시판</h3>
			<hr>
		</div>
		<div class="row" style="padding-left: 3em; padding-right: 3em;">
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 15%;">기업명</th>
							<th style="width: 15%;">분야</th>
							<th style="width: 30%;">제목</th>
							<th style="width: 20%;">시작 날짜</th>
							<th style="width: 20%;">끝 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="contest" varStatus="stat">
							<tr>
								<td style="width: 15%;">${contest.company_name }</td>
								<td style="width: 15%;">${contest.contest_field }</td>
								<td style="width: 30%;"><a
									href="${initParam.rootPath }/user/contest/read${pageMaker.makeSearch(pageMaker.cri.page)}&contest_id=${contest.contest_id }">${contest.contest_title }</a></td>
								<td style="width: 20%;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${contest.contest_startDate}" /></td>
								<td style="width: 20%;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${contest.contest_endDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
			</div>
		</div>
		<div align="right">
			<a class="btn btn-default pull-right" href="javascript:loginCheck()"
				id="write">글쓰기</a>
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
						<option value="e"
							<c:out value="${cri.searchType eq 'e'?'selected':''}"/>>
							기업명</option>						
						<option value="f"
							<c:out value="${cri.searchType eq 'f'?'selected':''}"/>>
							분야</option>
						<option value="a"
							<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
							제목</option>	
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>

				</div>
	</div>
</body>
</html>
