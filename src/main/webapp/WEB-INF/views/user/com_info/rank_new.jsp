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
<title>기업순위</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/comRank_sw.css" rel="stylesheet" type="text/css">


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
		
			<div class='section_main'>
				<div class='com-contest-head'>
					<div class='title-wrapper'>
						<div class='column-title'>기업 평점순위</div>
					</div>
				</div><!-- com-contest-head -->
				<div class="com-contest-box">
					<div class="review-content">
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>종합만족도</label><br>	
												<c:forEach items="${total }" var="total">
												<div class="star-rank-box">
													<label for="a_${total.rank}">
														<font>${total.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${total.company_id }" style="text-decoration: none; color: black;">${total.company_name }</a>
													</label>
													<label class="star-label" style="float: right;">
														<span class="badge a${total.rank}"><b>${total.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${total.rank}">
														<progress id="progressBar" max="100" value="${total.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/totalRank?action=totalRank"><button class="star-btn">더보기</button></a>
											</div>
											<div class="star-right">
												<label>승진 및 기회가능성</label><br>	
												<c:forEach items="${possibility }" var="possibility">
												<div class="star-rank-box">
													<label for="a_${possibility.rank}">
														<font>${possibility.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${possibility.company_id }" style="text-decoration: none; color: black;">${possibility.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${possibility.rank}"><b>${possibility.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${possibility.rank}">
														<progress id="progressBar" max="100" value="${possibility.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/possibilityRank?action=posibility"><button class="star-btn">더보기</button></a>
											</div>
										</div>
									</div>
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>복지 및 급여</label><br>																					
												<c:forEach items="${welSal }" var="welSal">
												<div class="star-rank-box">
													<label for="a_${welSal.rank}">
														<font>${welSal.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${welSal.company_id }" style="text-decoration: none; color: black;">${welSal.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${welSal.rank}"><b>${welSal.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${welSal.rank}">
														<progress id="progressBar" max="100" value="${welSal.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/welSalRank?action=welSal"><button class="star-btn">더보기</button></a>
											</div>
											<div class="star-right">
												<label>업무와 삶의 균형</label><br>										
												<c:forEach items="${balance }" var="balance">
												<div class="star-rank-box">
													<label for="a_${balance.rank}">
														<font>${balance.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${balance.company_id }" style="text-decoration: none; color: black;">${balance.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${balance.rank}"><b>${balance.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${balance.rank}">
														<progress id="progressBar" max="100" value="${balance.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/balanceRank?action=balance"><button class="star-btn">더보기</button></a>
											</div>
										</div>
									</div>
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>사내문화</label><br>																					
												<c:forEach items="${culture }" var="culture">
												<div class="star-rank-box">
													<label for="a_${culture.rank}">
														<font>${culture.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${culture.company_id }" style="text-decoration: none; color: black;">${culture.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${culture.rank}" style="background-color: teal;"><b>${culture.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${culture.rank}">
														<progress id="progressBar" max="100" value="${culture.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/cultureRank?action=culture"><button class="star-btn">더보기</button></a>
											</div>
											<div class="star-right">
												<label>경영진</label><br>										
												<c:forEach items="${manager }" var="manager">
												<div class="star-rank-box">
													<label for="a_${manager.rank}">
														<font>${manager.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${manager.company_id }" style="text-decoration: none; color: black;">${manager.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${manager.rank}" style="background-color: teal;"><b>${manager.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${manager.rank}">
														<progress id="progressBar" max="100" value="${manager.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/managerRank?action=manager"><button class="star-btn">더보기</button></a>
											</div>
										</div>
									</div>
					</div>
					<!-- review-content -->
				</div>
			</div><!-- section_main1 -->
				
		</div>
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->
			
		<!-- modal import --> 
		<%@ include file="../user_modals_new.jsp" %>

	<!-- frame -->
	</div>
<script type="text/javascript">
$(function(){
	$('.star-btn').on("click", function(){
		self.location="${initParam.rootPath }/blist"
	});
});
</script>

</body>
</html>
