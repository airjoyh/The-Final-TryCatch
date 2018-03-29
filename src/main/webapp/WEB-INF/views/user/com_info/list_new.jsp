<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>그리드 테스트</title>

<style type="text/css">
.simple-table{
	position: relative;
	text-align: left;
	font-size: 15px;
	border-bottom: 1px solid #bbb;
}
.simple-table .tbl-h1{
	width: 80%;
}
.simple-table .tbl-h2{
	width: 20%;
}
</style>

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	<%@ include file="../../user-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>

			<div class='section_main_com'>
				<div class='title-wrapper'>
					<div id="title" class="column-title"></div>
				</div>

				<!-- <div class="com-contest-box"> -->
				<div class='wrapper'>
					<div class='company-contest-table'>
						<table cellspacing='0'>
							<tr>
								<th style="padding-left: 5px;">순위</th>
								<th style="width: 372px;">기업명</th>
								<th style="width: 155px;">기업규모</th>
								<th style="width: 110px;">매출액</th>
							</tr>
							<c:forEach items="${list }" var="avgScore" varStatus="stat">
								<tr>
									<td>${avgScore.rank }</td>
									<td style="width: 372px;text-align: left;">
										<div style="display: flex;">
											<!-- <img alt="이미지" src="resources/company/img/ksd.jpg" style="width: 50px; height: 50px;"> -->
											<div style="flex-direction: column;">
												<div style="height: 50%;">
													<a
														href="${initParam.rootPath }/user/review/list?company_id=${avgScore.company_id }">${avgScore.company_name }</a>
												</div>
												<div style="height: 50%;">
													<span>${avgScore.company_line }</span>
												</div>
											</div>
										</div>
									</td>
									<td style="width: 155px;">${avgScore.company_size }</td>
									<td style="width: 110px;">${avgScore.company_turnover }</td>
								</tr>
							</c:forEach>
						</table>
						<div class="board-paging">
							<div class="board-pageline" align="center">
								<ul class="board-pagination">
									<c:if test="${pageMaker.prev}">
										<li><a
											href="${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a
											href="${pageMaker.makeSearch(idx)}&company_id=${param.company_id }">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="${pageMaker.makeSearch(pageMaker.endPage +1) }&company_id=${param.company_id }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
							<div class='board-search' align="center">
								<select name="searchType" class="baord_select">
									<option value="n"
										<c:out value="${cri.searchType == null?'selected':''}"/>>
                   					 검색조건</option>
									<option value="t"
										<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                    					기업명</option>
									<option value="w"
										<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                   					 기업 규모</option>
								</select> <input type="text" name='keyword' id="keywordInput"
									value='${cri.keyword }'>
								<button class="board-btn" id='searchBtn'>검색</button>
							</div>
						</div>



					</div>
				</div>
			</div>
			<!-- section_main1 -->
				
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



		
	<!-- modal 코드 --> 
	<%@ include file="../user_modals_new.jsp" %>

</div>
	
<!-- select -->
<script type="text/javascript">
$(function(){
	var action='${action }';
	var msg = '';
	var title = document.getElementById('title');
	//alert(action);
	if(action=='totalRank'){
		msg= '총 평점';
		//alert(msg);
	}else if(action=='possibilityRank'){
		msg='승진 기회 및 가능성';
	}else if(action=='welSalRank'){
		msg='복지 및 급여';
	}else if(action=='balanceRank'){
		msg='업무와 삶의 균형';
	}else if(action=='cultureRank'){
		msg='사내문화';
	}else if(action=='managerRank'){
		msg='경영진';
	}
	title.innerHTML='기업 '+msg+' 순위 게시판';
	
	$('#searchBtn').on("click", function(event) {
		//검색(Search) 버튼을 클릭하면
			self.location = "${action}" //'list'
							+ '${pageMaker.makeQuery(1)}'
							  //'list?page=1&perPageNum=10'
							+ "&searchType="
							//'list?page=1&perPageNum=10&searchType='
							+ $("select option:selected").val()
							//'list?page=1&perPageNum=10&searchType=t'
							+ "&keyword=" + $('#keywordInput').val()
							//'list?page=1&perPageNum=10&searchType=t&keyword=�ㅻ뒛'
							+"&company_id=${param.company_id}";
		});
});
</script>
</body>
</html>
