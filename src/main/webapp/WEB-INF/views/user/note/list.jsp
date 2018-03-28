<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>쪽지게시판</title>

<link href="${initParam.rootPath }/resources/css/tc_mail_sw.css" rel="stylesheet" type="text/css">

<style>
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
		
			<div class='section_notelist'>

					<div class='title-wrapper'>
						<div class='column-title'>받은쪽지함</div>
					</div>
					
					<div class='company-contest-table'>
						<div class='wrapper'>
							<table cellspacing='0'>
								<tr>
									<th style="width: 8%">읽은상태</th>
									<th style="width: 60%">내용</th>
									<th style="width: 15%">보낸 기업</th>									
									<th style="width: 17%">날짜</th>																	
								</tr>				
						 <c:forEach items="${list }" var="note" varStatus="stat">
								<tr>
									<td><img style="width: 20px; height: 20px;" src="${initParam.rootPath}/resources/image/ing/${note.note_status}.png"> </td>																		
									<td><a href="${initParam.rootPath }/user/note/read${pageMaker.makeSearch(pageMaker.cri.page)}&note_receiver=${note.note_receiver }&note_id=${note.note_id }&note_status=${note.note_status}">${note.note_contents}</a></td>																		
									<td>${note.note_sender}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${note.note_senddate}" /></td>
								</tr>
						  </c:forEach>	
							</table>
						</div>
					</div>

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
					<!-- board-pageline -->
					
					<div class="board-paging" align="center">
					    <div class='board-search'>
					               <select name="searchType" class="board_select">
					                  <option value="n"
					                     <c:out value="${cri.searchType == null?'selected':''}"/>>
                    					 검색조건</option>
					                  <option value="t"
					                     <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                     					보낸기업</option>                  
					                  <option value="w"
					                     <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                    					 내용</option>
					                  <option value="tw"
					                     <c:out value="${cri.searchType eq 'tw'?'selected':''}"/>>
                    					 보낸기업+내용</option>
					               </select> <input type="text" name='keyword' id="keywordInput"
					                  value='${cri.keyword }'>
					               <button class="board-btn" id='searchBtn'>검색</button>
					   </div>
					</div><!-- com-contest-paging -->

			</div><!-- section_main1 -->
				
		</div>
		
		<!-- right section!!************************************************************** -->
     <div id="rigthDiv" class="column-right">
       <div id="login_beforeDiv">
          <%@ include file="../login_before_new.jsp" %>
       </div>
       <div id="login_afterDiv" style="display: none">
          <%@ include file="../login_after_new.jsp" %>
       </div> 
       		<!-- modal import -->
		<%@ include file="../user_modals_new.jsp" %>  
     </div>
</div>
	<!-- frame -->
<script type="text/javascript">
/* $(function(){
	$('#registBtn').on("click", function(){
		self.location="${initParam.rootPath }/mailread"
	});
}); */

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
							+"&note_receiver=${param.note_receiver}";
		});
});

</script>

</body>
</html>
