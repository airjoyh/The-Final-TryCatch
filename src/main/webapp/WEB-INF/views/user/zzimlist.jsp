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
	<%@ include file="../user-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main_com'>
				<div class='com-contest-heads'>
					<div class='title-wrapper'>
						<div id="title" class="column-title">관심 기업 리스트</div>
					</div>
				
				<!-- <div class="com-contest-box"> -->
				<div class='wrapper'>
					<div class='company-contest-table'>
						<table cellspacing='0'>
								<tr>
									<th>관심 기업 리스트</th>
								</tr>
								<c:forEach items="${zzimList }" var="zzim" varStatus="stat">
								<tr>
									<td><a href="${initParam.rootPath }/user/review/list?company_id=${zzim.zzim_selected }">${zzim.company_name }</a>	
								</tr>
							</c:forEach>
						</table>
					<div class="board-pageline" align="center">
							<ul class="board-pagination" >
								<c:if test="${pageMaker.prev}">
									<li><a
										href="${initParam.rootPath }/user/zzimlist${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a
										href="${initParam.rootPath }/user/zzimlist${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="${initParam.rootPath }/user/zzimlist${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>		
			</div><!-- com-contest-head -->		
					
							
		</div><!-- section_main1 -->
				
		</div>

		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="login_after_new.jsp"%>
			</div>
		</div>
		<!-- column-right -->



		
	<!-- modal 코드 --> 
	<%@ include file="user_modals_new.jsp" %>

</div>
	
<!-- select -->
</body>
</html>
