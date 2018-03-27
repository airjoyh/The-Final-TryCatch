<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업순위</title>

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
		
			<div class='section_main_rank'>
					<div class='title-wrapper'>
						<div class='column-title'>기업 평점순위</div>
					</div>
				<div class="com-contest-box">
					<div class="review-content">
									<div class="">
										<div class="star-box">
											<div class="star-inbox">
												<div class="star-title-box"><div class="star-title-label">종합만족도</div></div>	
												<c:forEach items="${total }" var="total">
												<div class="star-rank-box">										
														<label for="a_${total.rank}" class="star-rank-total">
															<font>${total.rank}위</font>
															<a href="${initParam.rootPath }/user/review/list?company_id=${total.company_id }" >${total.company_name }</a>
														</label>
														<div class="star-rank" id="a_${total.rank}">
															<progress id="progressBar" max="100" value="${total.avg_all*20 }"></progress>								
														</div>													
														<label class="star-label-score">
															<span class="badge a${total.rank}"><b>${total.avg_all }</b>/5점</span>
														</label>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/totalRank?action=totalRank"><div class="more-btn">더보기</div></a>
											</div>
											<div class="star-inbox">
												<div class="star-title-box"><div class="star-title-label">승진 및 기회가능성</div></div>
												<c:forEach items="${possibility }" var="possibility">
												<div class="star-rank-box">
													<label for="a_${possibility.rank}" class="star-rank-total">
														<font>${possibility.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${possibility.company_id }">${possibility.company_name }</a>
													</label>
													<div class="star-rank" id="a_${possibility.rank}">
														<progress id="progressBar" max="100" value="${possibility.avg_possibility*20}"></progress>								
													</div>
													<label class="star-label-score">
														<span class="badge a${possibility.rank}"><b>${possibility.avg_possibility }</b>/5점</span>
													</label>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/possibilityRank?action=posibility"><div class="more-btn">더보기</div></a>
											</div>
										</div>
									</div>
									<div class="">
										<div class="star-box">
											<div class="star-inbox">
											<div class="star-title-box"><div class="star-title-label">복지 및 급여</div></div>																	
												<c:forEach items="${welSal }" var="welSal">
												<div class="star-rank-box">
													<label for="a_${welSal.rank}" class="star-rank-total">
														<font>${welSal.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${welSal.company_id }">${welSal.company_name }</a>
													</label>
													<div class="star-rank" id="a_${welSal.rank}">
														<progress id="progressBar" max="100" value="${welSal.avg_welSal*20 }"></progress>								
													</div>
													<label class="star-label-score">
														<span class="badge a${welSal.rank}"><b>${welSal.avg_welSal }</b>/5점</span>
													</label>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/welSalRank?action=welSal"><div class="more-btn">더보기</div></a>
											</div>
											<div class="star-inbox">
											<div class="star-title-box"><div class="star-title-label">업무와 삶의 균형</div></div>			
												<c:forEach items="${balance }" var="balance">
												<div class="star-rank-box">
													<label for="a_${balance.rank}" class="star-rank-total">
														<font>${balance.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${balance.company_id }">${balance.company_name }</a>
													</label>
													<div class="star-rank" id="a_${balance.rank}">
														<progress id="progressBar" max="100" value="${balance.avg_balance*20 }"></progress>								
													</div>
													<label class="star-label-score">
														<span class="badge a${balance.rank}"><b>${balance.avg_balance }</b>/5점</span>
													</label>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/balanceRank?action=balance"><div class="more-btn">더보기</div></a>
											</div>
										</div>
									</div>
									<div class="">
										<div class="star-box">
											<div class="star-inbox">
											<div class="star-title-box"><div class="star-title-label">사내문화</div></div>				
												<c:forEach items="${culture }" var="culture">
												<div class="star-rank-box">
													<label for="a_${culture.rank}" class="star-rank-total">
														<font>${culture.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${culture.company_id }">${culture.company_name }</a>
													</label>
													<div class="star-rank" id="a_${culture.rank}">
														<progress id="progressBar" max="100" value="${culture.avg_culture*20 }"></progress>								
													</div>
													<label class="star-label-score">
														<span class="badge a${culture.rank}"><b>${culture.avg_culture }</b>/5점</span>
													</label>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/cultureRank?action=culture"><div class="more-btn">더보기</div></a>
											</div>
											<div class="star-inbox">
												<div class="star-title-box"><div class="star-title-label">경영진</div></div>									
												<c:forEach items="${manager }" var="manager">
												<div class="star-rank-box">
													<label for="a_${manager.rank}" class="star-rank-total">
														<font>${manager.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${manager.company_id }">${manager.company_name }</a>
													</label>
													<div class="star-rank" id="a_${manager.rank}">
														<progress id="progressBar" max="100" value="${manager.avg_manager*20 }"></progress>								
													</div>
													<label class="star-label-score">
														<span class="badge a${manager.rank}"><b>${manager.avg_manager }</b>/5점</span>
													</label>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/managerRank?action=manager"><div class="more-btn">더보기</div></a>
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

</body>
</html>
