<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업 콘테스트 개최 리스트</title>
<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/contest_qna_sw.css" rel="stylesheet" type="text/css">

</head>

<body>
	<!-- com-nav -->
	<%@include file="../../user-nav_new.jsp"%>

	<div class='container'>
		<!-- left section!!************************************************************** -->
		<div class='column-left'>

			
			<div class="section_contestqna ">

					<div class='title-wrapper'>
						<div class='column-title'>콘테스트 게시판</div>
					</div>
					
					<div class='company-contest-table'>
							<table cellspacing='0'>
								<tr>
									<th style="text-align: center;">기업</th>
									<th>콘테스트명</th>
									<th>분야</th>
									<th>시작 날짜</th>
									<th>끝 날짜</th>
								</tr>
								<c:forEach items="${list }" var="contest" varStatus="stat">
									<tr>
										<td>${contest.company_name }</td>
										<td style="width: 300px; display: table-cell;"><a
											href="${initParam.rootPath }/user/contest/read${pageMaker.makeSearch(pageMaker.cri.page)}&contest_id=${contest.contest_id }">${contest.contest_title }</a></td>
										<td>${contest.contest_field }</td>
										<td>${contest.contest_startDate}</td>
										<td>${contest.contest_endDate}</td>
									</tr>
								</c:forEach>
							</table>
					</div>
					
					<div class="board-paging" >
						<div class="board-pageline" align="center">
							<ul class="board-pagination" >
								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a
										href="list${pageMaker.makeSearch(idx)}&company_id=${param.company_id }">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&company_id=${param.company_id }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
						<div class='board-search'align="center">
							<select name="searchType" class="board_select">
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
					<button class="board-btn" id='searchBtn'>검색</button>
						</div>
					</div>
					<!-- com-contest-paging -->
		</div>
		<!-- section_main2 -->
		</div>
		



		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../login_after_new.jsp"%>
			</div>
		</div>
		<!-- column-right -->

		<!-- modal import -->
		<%@ include file="../user_modals_new.jsp"%>

		<!-- frame -->
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

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
						+ "&company_id=${company_login_company_id}";
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
	</script>
</body>
</html>
