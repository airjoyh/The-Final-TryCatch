<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 게시판</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/community_list_sw.css" rel="stylesheet" type="text/css">


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
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main'>
				<div class='com-contest-head'>
					<div class='title-wrapper'>
						<div class='column-title'>커뮤니티 게시판</div>
					</div>
					<div class='company-contest-table'>
						<div class='wrapper'>
							<table cellspacing='0'>
								<tr>
									<th style="width: 10%">글번호</th>
									<th style="width: 35%">제목</th>
									<th style="width: 15%">작성자</th>									
									<th style="width: 20%">작성일</th>									
									<th style="width: 10%">조회수</th>									
									<th style="width: 10%">댓글</th>									
								</tr>
								  <c:forEach items="${list}" var="communityVo" varStatus="stat">
				                     <tr>
				                        <td>${communityVo.community_no}</td>
				                        <td><a href='${initParam.rootPath}/user/community/read${pageMaker.makeSearch(pageMaker.cri.page)}&community_no=${communityVo.community_no}'>
				                            ${communityVo.community_title}</a></td>
				                        <td>${communityVo.community_writer}</td>
				                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				                                  value="${communityVo.community_wdate}"/></td>
				                        <td>${communityVo.community_viewCount}</td> 
				                        <td>${communityVo.community_replyCount}</td>             
				                     </tr>
				                  </c:forEach>				
										
											
							</table>
						</div>
					</div>
				</div><!-- com-contest-head -->
				<div>
					<div class="com-contest-paging">
						<div class="cont-qna-page">
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
					               </select> <input type="text" name='keyword' id="keywordInput"
					                  value='${cri.keyword }'>
					               <button id='searchBtn'>검색</button>
					               <button id='registBtn'>글쓰기</button>
					
					   </div>
					</div><!-- com-contest-paging -->
				</div>
			</div><!-- section_main1 -->
				
		</div>

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
	
	 	//alert("list페이지에 들어올 때 로그인 상태 >>> ${user_loginState}, ${user_login_id}")
	   
	   $('#searchBtn').on( //Search 버튼 을 클릭하면
			   "click",
			   function(event){
				   
		          self.location = "list"
		             + '${pageMaker.makeQuery(1)}'
		             + "&searchType="
		             +$("select option:selected").val()
		             +"&keyword="+$('#keywordInput').val();
			   
	   });
	   $('#registBtn').on("click", function(evt){
		   	
			console.log('로그인 상태 >>> '+loginState)
			//alert("로그인 상태>>>" + loginState);
			if (loginState != "login") {
				//loginState라는 변수는 userMain.js에 있고 user-nav_new에 js가 들어있음 그걸 include했기 때문에 사용가능
				alert('로그인하신 후에 이용 가능합니다.');
				login_id.focus();
			} else {
				//alert('현재 로그인상태입니다')
				location.href = '${initParam.rootPath}/user/community/register';
				//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
			}
	  
	   });// 여기에 글쓰기 버튼을 눌렀을때 로그인을 한 상태가 아니라면 
	      // 로그인 요청페이지가 뜨고 확인을 누르면 로그인 페이지로 이동해야한다
	

	});//function

</script>
</body>
</html>