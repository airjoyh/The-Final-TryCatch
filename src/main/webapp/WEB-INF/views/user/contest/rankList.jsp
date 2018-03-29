<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--C태그를 사용하기 위한 라이브러리 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>구직자 콘테스트 리스트</title>

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
		
			<div class='section_main_community'>

					<div class='title-wrapper'>
						<div class='column-title'>콘테스트 순위</div>
					</div>
					
					<div class='company-contest-table'>
							<table cellspacing='0'>
								<tr>
									<th>순위</th>
									<th>아이디</th>
									<th>점수</th>																	
								</tr>
								<c:forEach items="${list }" var="contest_answer" varStatus="stat">
									<tr>
										<td style="width: 25%;">${contest_answer.rank }</td>
										<td style="width: 50%;">${contest_answer.user_id }</td>
										<td style="width: 25%;">${contest_answer.totalScore }</td>
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
							아이디</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button class="board-btn" id='searchBtn'>검색</button>								
						</div>
					</div>
					<!-- com-contest-paging -->

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
	
	/* 검색창 드롭다운 메뉴 */
	$('.taco').click(function(e) {
		var txt = $(e.target).text();
		$('.taco-input').val(txt);
	});

</script>

</body>
</html>