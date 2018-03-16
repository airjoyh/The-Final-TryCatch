<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- C태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>그리드 테스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/blist_sw.css" rel="stylesheet" type="text/css">

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
		
			<div class='section_main1'>
					<div class="content1">
							<section class="elem elem-yellow" id="com-search" style="width: 740px;height: 50px;">
								<div id="title"></div>
								<!-- <div class="com-select">
								<select class="com-rank"></select>
								</div> -->
							</section>
							<section class="elem elem-yellow" id="com-searchList" style="width: 740px;height: 500px;">
								<div class='company-contest-table'>
									<div class='wrapper'>
										<table cellspacing='0'>
									<tr>
										<th style="width: 5%;">순위</th>
										<th style="width: 60%;">기업명</th>
										<th style="width: 18%;">기업규모</th>
										<th style="width: 12%;">매출액</th>
										<th style="width: 5%;">댓글</th>

									</tr>
									<c:forEach items="${list }" var="avgScore" varStatus="stat">
											<tr>
												<td style="width: 10%;">${avgScore.rank }</td>
												<td>
													<div style="display: flex;">
														<img alt="이미지" src="resources/company/img/ksd.jpg" style="width: 50px; height: 50px;">
														<div style="flex-direction: column;">
															<div style="height: 50%;">
															<a href="${initParam.rootPath }/user/review/list?company_id=${avgScore.company_id }">${avgScore.company_name }</a>	
															</div>
															<div style="height: 50%;">
															<span style="border-radius: 10px; background-color: darkgray;">${avgScore.company_line }</span>
															</div>
														</div>
													</div>
												</td>
												<td style="width: 20%;">${avgScore.company_size }</td>
												<td style="width: 20%;">${avgScore.company_turnover }</td>
												<td><span class="badge">${review_cnt.get(stat.index) }</span></td>
											</tr>
									</c:forEach>
										</table>
									</div>
								</div>
							</section>
							<section class="elem elem-yellow" id="paging" style="width: 740px;height: 100px;">
								<div class="com-contest-paging">
									<div class="cont-qna-page">
									      <ul class="pagination">
									      <c:if test="${pageMaker.prev}">
									         <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
									      </c:if >
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
								    <div class='cont-qna-search'>
								               <select name="searchType">
								                  <option value="n"
								                     <c:out value="${cri.searchType == null?'selected':''}"/>>
                    					 검색조건</option>
								                  <option value="t"
								                     <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                     					제목</option>                  
								                  <option value="w"
								                     <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                    					 작성자</option>
								                  <option value="tw"
								                     <c:out value="${cri.searchType eq 'tw'?'selected':''}"/>>
                    					 제목+작성자</option>
								               </select> <input type="text" name='keyword' id="keywordInput"
								                  value='${cri.keyword }'>
								               <button id='searchBtn'>검색</button>
								               <!-- <button id='registBtn'>글쓰기</button> -->
								
								   </div>
								</div><!-- com-contest-paging -->
							</section>
					</div>
					<!-- content1 -->
				</div><!-- section_main1 -->
				
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
