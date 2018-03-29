<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업 콘테스트 개최 리스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/community_list_sw.css" rel="stylesheet" type="text/css">

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- com-nav -->
	<%@include file="../../company-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main_community'>

					<div class='title-wrapper'>
						<div class='column-title'>인재검색 리스트</div>
					</div>
					
					<div class='company-contest-table'>
						<table cellspacing='0'>
							<tr>
								<th style=" text-align: center;">아이디</th>
								<th style="width: 100%">기술</th>
								<th style="width: 30%">자격증</th>
							</tr>
							<c:forEach items="${list }" var="portfolio" varStatus="stat">
								<tr>
									<td  style="width: 20%"><a
										href="${initParam.rootPath }/company/personSearch/read${pageMaker.makeSearch(pageMaker.cri.page)}&port_id=${portfolio.port_id }">${portfolio.user_id }</a></td>
									<td style="width: 100%">${portfolio.port_skill }</td>
									<td >${portfolio.port_license }</td>
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
								<option value="a"
									<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
                    					기술</option>
								<option value="b"
									<c:out value="${cri.searchType eq 'b'?'selected':''}"/>>
                   					 자격증</option>
							</select> <input type="text" name='keyword' id="keywordInput"
								value='${cri.keyword }'>
							<button class="board-btn" id='searchBtn'>검색</button>								
						</div>
					</div>
					<!-- com-contest-paging -->

			</div><!-- section_main_community -->

		</div><!-- column-left -->
		
				
		
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../com_login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../com_login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->
		
		<!-- modal import -->
		<%@ include file="../company_modal_new.jsp" %>

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
							+"&port_id=${param.port_id}";
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
