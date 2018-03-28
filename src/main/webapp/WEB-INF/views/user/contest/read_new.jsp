<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 게시판</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/user_contest_read.css" rel="stylesheet" type="text/css">



<script type="text/javascript">

</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
  <%@ include file="../../user-nav_new.jsp" %>
	
	<div class='container'>
	
	<form id="readForm" name="readForm" method="POST">
	  	<input type="hidden" id="contest_id" name="contest_id" value="${contest.contest_id }">
	  	<input type='hidden' name='page' value="${cri.page}"> 
	  	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
	</form>
	
	<!-- left section!!************************************************************** -->
		<div class='column-left'>

			<div class='user-contest-read'>

				<div class='title-wrapper'>
					<div class='column-title'>콘테스트 상세정보</div>
				</div>
				<div class="tabs effect-3">

					<input type="radio" id="tab-1" name="tab" checked="checked">
					<span href="#tab-item-1">콘테스트 내용</span> <input type="radio"
						id="tab-2" name="tab"> <span href="#tab-item-2">콘테스트
						참가</span>
					<div class="line ease"></div>

					<div class="tab-content">

						<section id="tab-item-1">
							<div class='read-title'></div>
							<div class='text-contents'></div>
							<div class='contest-info'></div>
							
						</section>

						<section id="tab-item-2">

							<div class='contest-start-info'>
								- 콘테스트 시작 가능 시각은 ${contest.contest_startDate} 입니다.<br> -
								콘테스트 시작 시각 이후 5분까지 참가 가능합니다.
							</div>
							<div class='contest-start-btn' id="startContestBtn"
								style="border-bottom: 1px solid #ddd">
								<div>콘테스트 시작</div>
							</div>
							<div class='contest-start-btn' id="goRankListBtn">
								<div>점수 보러가기</div>
							</div>

						</section>

					</div>
				</div>
				<!-- tab -->


				<!--  내용    -->
				<%-- 
				
	  	 		<div id="board" align="center">

	  	 			<table id="tdetail" border="3" bordercolor="lightgray" style="width:100% height: 90%">
	  	 				<tr style="height: 50px">
	  	 					<td style="text-align: center; font-weight: bold;">글번호</td>
	  	 					<!-- 컨트롤러에서 받아온 ArrayList detailAll에서 정보를 뽑는다. -->
	  	 					<td style="text-align: center;">${contest.contest_id }</td>
	  	 				</tr>
	  	 				<tr style="height: 50px">
	  	 					<td style="text-align: center; font-weight: bold;">제목</td>
	  	 					<td id="title" style="text-align: center;">${contest.contest_title }</td>
	  	 				</tr>
				        <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">개최 기업명</td>
				            <td style="text-align: center;" >${contest.company_name }</td>
				        </tr>
				        <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">콘테스트 시작날짜</td>
				            <td style="text-align: center;">${contest.contest_startDate}</td>
				        </tr>
				         <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">콘테스트 끝날짜</td>
				            <td style="text-align: center;">${contest.contest_endDate}</td>
				        </tr>
				        <tr style="height: 50px">
				        	<td style="text-align: center; font-weight: bold;">콘테스트 분야</td>
            				<td style="text-align: center;">${contest.contest_field }</td>		        	
				        </tr>	  	 				
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">채용할 인원 수</td>
            				<td style="text-align: center;">${contest.contest_hireNumber }</td>		        	
				        </tr>	  	 				
				        <tr style="height: 300">
				        	<td style="text-align: center; font-weight: bold;">콘테스트 내용</td>
            				<td style="text-align: center;">${contest.contest_contents }</td>		        	
				        </tr>
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당 소속</td>
            				<td style="text-align: center;">${contest.team_name }</td>		        	
				        </tr>	
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당자</td>
            				<td style="text-align: center;">${contest.manager_name }</td>		        	
				        </tr>	
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당자 이메일</td>
            				<td style="text-align: center;">${contest.manager_email }</td>		        	
				        </tr>	
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당자 이메일</td>
            				<td style="text-align: center;">${contest.manager_tel }</td>		        	
				        </tr>
				        <tr style="height: 50px">
				        	<td></td>
				        	<td align="center">			
							<button type="button" id="goList">목록보기</button>

							</td>
				        </tr>
				        	  	 				
	  	 			</table>
	  	 			<div>

	  	 			</div>
	  	 		</div>	 --%>


			</div>
			<!-- section_main_community -->

			<div class='contest-qna'>

				<div class='title-wrapper'>
					<div class='column-title'>콘테스트 QnA</div>
				</div>

				<div class='company-contest-table'>
					<table cellspacing='0'>
						<tr>
							<th>글번호</th>
							<th class="community_secth">제목</th>
							<th class="community_thirth">작성자</th>
							<th class="community_fourth">작성일</th>
							<th class="community_fiveth">조회수</th>
							<th class="community_sixth">댓글</th>
						</tr>
						<c:forEach items="${list}" var="communityVo" varStatus="stat">
							<tr>
								<td>${communityVo.community_no}</td>
								<td class="community_secth"><a
									href='${initParam.rootPath}/user/community/read${pageMaker.makeSearch(pageMaker.cri.page)}&community_no=${communityVo.community_no}'>
										${communityVo.community_title}</a></td>
								<td class="community_thirth">${communityVo.community_writer}</td>
								<td class="community_fourth"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm"
										value="${communityVo.community_wdate}" /></td>
								<td class="community_fiveth">${communityVo.community_viewCount}</td>
								<td class="community_sixth">${communityVo.community_replyCount}</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<div class="board-paging">
					<div class="board-pageline" align="center">
						<ul class="board-pagination">
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
					<div class='board-search' align="center">
						<select name="searchType" class="board_select">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}"/>>
                   					 검색조건</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                    					제목</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                   					 작성자</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button class="board-btn" id='searchBtn'>검색</button>
						<button class="board-btn" id='registBtn'>글쓰기</button>
					</div>
				</div>

			</div>
			<!-- contest-qna -->
		</div>
		<!-- column-left -->

		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<div id="rightDiv" class='column-right'>
				<div id="login_beforeDiv">
					<%@ include file="../../user/login_before_new.jsp"%>
				</div>
				<div id="login_afterDiv" style="display: none">
					<%@ include file="../login_after_new.jsp"%>
				</div>
			</div>
			<!-- column-right -->
		</div>
		<!-- modal 코드 --> 
       <%@ include file="../user_modals_new.jsp" %>
				
		</div><!-- container -->
			
	
	<!-- frame -->
<script type="text/javascript">
	$(function(){

		$('#goList').on("click", function() {
		  	console.log('목록보기 버튼 클릭');
		  	self.location="${initParam.rootPath }/user/contest/list?page=${cri.page }"
		  					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
		  					+"&keyword=${cri.keyword }";
		  	});//goList클릭	
		  	
		$('#startContestBtn').on("click", function(){
		  	console.log('콘테스트 시작 버튼 클릭');
		  	var loginState = '${user_loginState}';
		  	var contest_id = $('#contest_id').val();
		  		
		  	if(loginState != 'login'){
		  		alert('콘테스트는 로그인을 하신 이후에 이용 가능합니다.');
		  	}else{
		  		self.location = '${initParam.rootPath}/user/contest/quiz/solve?contest_id='+contest_id+'&quiz_no=1';
		  	}
		 });
		  	
		 $('#goRankListBtn').on("click", function(){
		  	console.log('점수보러가기 버튼 클릭');
		  	var contest_id = $('#contest_id').val();
		  	self.location = '${initParam.rootPath}/user/contest/rankList?contest_id='+contest_id;
		 });
				
	});//function

</script>
</body>
</html>