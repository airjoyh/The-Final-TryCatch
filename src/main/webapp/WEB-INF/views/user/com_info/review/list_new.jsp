<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>그리드 테스트</title>

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
	<%@ include file="../../../user-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main'>
				<div class="tabs-container">
					<div class="tabs effect-3">
						<input type="radio" id="tab-1" name="tab" checked="checked">
						<span href="#tab-item-1">기업정보</span> 
						<input type="radio" id="tab-2" name="tab"> 
						<span href="#tab-item-2">기업평점</span>
						<div class="line ease"></div>
			
						<div class="tab-content">
							<section id="tab-item-1">
								<!--***********************************************************
								*                                                             *
								*                           기업소개                                                               *
								*                                                             *
								************************************************************-->
								<div class="review-content-tab1">
									<div class="review-box-title">
										<div class="review-name">
											<!-- <div class="com-img">
												<img alt="회사이미지" src="resources/company/img/ksd.jpg"
													style="height: 80px; width: 80px;">
											</div> -->
											<div class="com-skill">
												<div style="height: 50%;" class="review-name-text">	
													<p>${company_info.company_name  }&nbsp;&nbsp;&nbsp;&nbsp;<span class="score-color">${total }</span><span>/5.0</span></p>
												</div>
												<div class="com-skill-subinfo">
													<span>${company_info.company_line }</span>
												</div>
											</div>
											<div class="com-btn">
												<form method="post">
													<input type="hidden" id="zzim_select" name="zzim_select"
														value="${user_login_id }"> <input type="hidden"
														name="zzim_selected" id="zzim_selected"
														value="${company_info.company_id}">
														
													<input style="float: right;" id="zzimBtn" type="submit" value="찜하기">
													<input style="float: right;" id="zzimOutBtn" type="button" value="찜취소">
													
													<!-- <button style="float: right;" id="zzimBtn" type="submit">찜하기</button>
													<button style="float: right;" id="zzimOutBtn" type="button">찜하기 취소</button>
													<button style="float: right;" id="zzimListBtn" type="button">찜리스트</button> -->
												</form>
											</div>
										</div>
									</div>
									<div class="review-box-intro">
										<label>기업 소개</label><br>
										<div class="com-intro-text">
											<p>	
											${company_info.company_intro }
											</p>
										</div>
									</div>
									<div class="review-box-info">
										<div class="com-info">
											<div class="com-info-boxs">
												<div class="com-info-box">
													<label id="company_line">산업군</label>
													<p>${company_info.company_line }</p>
												</div>
												<div class="com-info-box">
													<label id="company_year">설립 년도</label>
													<p>${company_info.company_year }</p>
												</div>
												<div class="com-info-box">
													<label id="company_site">기업 사이트</label>
													<p>${company_info.company_site }</p>
												</div>
											</div>
											<div class="com-info-boxs">
												<div class="com-info-box">
													<label id="company_addr">기업 주소</label>
													<p>${company_info.company_addr }</p>
												</div>
												<div class="com-info-box">
													<label id="company_size">기업 규모</label>
													<p>${company_info.company_size }</p>
												</div>
												<div class="com-info-box">
													<label id="company_turnover">매출액</label>
													<p>${company_info.company_turnover }</p>
												</div>
											</div>
										</div>
									</div>
									<div class="review-box-contest" style="margin-top: 20px;">
										<label>현재 개최중인 콘테스트 정보</label><br>
											<p>없음 </p>
									</div>
								</div>
								<!-- review-content-tab1 -->
							</section>
							<!-- section기업정보 -->
							<section id="tab-item-2">
								<!--***********************************************************
								*                                                             *
								*                           후기                                                                     *
								*                                                             *
								************************************************************-->
								<div class="review-content-tab2">
									<div class="com-grade-page">
									
									<div class="com-grades">
											<div class="com-grades-companyname">
												회원들이 평가한 <span>${company_info.company_name  }</span>의 평점입니다.
											</div>
									</div>
									
									<div class="com-grades">
										<div class="com-grade-boxs">
											<div class="com-grade-box">
												<label>종합만족도</label><br>	
												<div class="com-grade-progress">
													<progress class="com-grade-progressBar" id="progressBar" max="100" value="${total*20 }"></progress>		
													<span><strong>${total }</strong>/5.0</span>
												</div>					
											</div>
											<div class="com-grade-box">
												<label>승진 및 기회가능성</label><br>	
												<div class="com-grade-progress">
													<progress id="progressBar" max="100" value="${avgScore.avg_possibility*20 }"></progress>	
													<span><strong>${avgScore.avg_possibility }</strong>/5.0</span>		
												</div>
											</div>
										</div>
									</div>
									<div class="com-grades">
										<div class="com-grade-boxs">
											<div class="com-grade-box">
												<label>복지 및 급여</label><br>																					
												<div class="com-grade-progress">
													<progress id="progressBar" max="100" value="${avgScore.avg_welSal*20 }"></progress>
													<span><strong>${avgScore.avg_welSal }</strong>/5.0</span>		
												</div>
											</div>
											<div class="com-grade-box">
												<label>업무와 삶의 균형</label><br>										
												<div class="com-grade-progress">
													<progress id="progressBar" max="100" value="${avgScore.avg_balance*20 }"></progress>
													<span><strong>${avgScore.avg_balance }</strong>/5.0</span>		
												</div>
											</div>
										</div>
									</div>
									<div class="com-grades">
										<div class="com-grade-boxs">
											<div class="com-grade-box">
												<label>사내문화</label><br>																					
												<div class="com-grade-progress">
													<progress id="progressBar" max="100" value="${avgScore.avg_culture*20 }"></progress>
													<span><strong>${avgScore.avg_culture }</strong>/5.0</span>		
												</div>
											</div>
											<div class="com-grade-box">
												<label>경영진</label><br>	
												<div class="com-grade-progress">									
												<progress id="progressBar" max="100" value="${avgScore.avg_manager*20 }"></progress>
												<span><strong>${avgScore.avg_manager }</strong>/5.0</span>		
												</div>
											</div>
										</div>
									</div>
								</div>
								</div>
								<!-- review-content-tab2 -->
							</section>
							<!-- section 기업평점 -->
			    			</div>
						</div>
				</div><!--tabs-container  -->
			</div>
			<!-- section_main -->

			<div class='com_section_board'>
					<div class='review-title-wrapper'>
						<div class='column-title'>기업 후기 게시판</div>
					</div>
					<div class='wrapper'>
						<div class='company-contest-table'>
							<table cellspacing='0'>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th style="width: 11%">작성자</th>
									<th style="width: 20%">작성일</th>
									<th style="width: 7%">조회</th>
									<th style="width: 7%">댓글</th>
								</tr>
								<c:forEach items="${list }" var="review" varStatus="stat">
									<tr>
										<td>${review.review_no }</td>
										<td style="width: 100%"><a
											href="${initParam.rootPath }/user/review/read${pageMaker.makeSearch(pageMaker.cri.page)}&company_id=${param.company_id }&no=${review.review_no }">${review.review_title }</a></td>
										<td style="width: 11%;">${review.review_writer }</td>
										<td style="width: 20%;"><fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${review.review_wdate}" /></td>
										<td style="width: 7%;" id="count">${review.review_viewCount }</td>
										<td style="width: 7%;"><span class="badge">${review.review_replyCount }</span></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<!--company-contest-table -->
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
							<button class="board-btn" id='searchBtn'>검색</button>								
							<button class="board-btn" id='newBtn'>글쓰기</button>
						</div>
					</div>
					<!-- board-paging -->
			</div>
			<!-- com_section_board -->
			</div>
			<!-- column-left -->



		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../../login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../../login_after_new.jsp"%>
			</div>
		</div>
		<!-- column-right -->
			
			
			
		<!-- modal 코드 -->
		<%@ include file="../../user_modals_new.jsp" %>
	</div><!-- container -->
<script type="text/javascript">
	$(document).ready(function() {
		
		 if(loginState != 'login'){//로그인을 하지 않았다면
	         $('#zzimBtn').hide('fast');
	      }else{
	         $('#zzimBtn').show('fast');
	      }
		
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
							+"&company_id=${param.company_id}";
		});

		$('#newBtn').on("click", function(evt) {//글쓰기(New Board) 버튼을 클릭하면
               console.log('newnewnewnew');
			if(loginState != 'login'){
				alert('로그인하신 후에 이용 가능합니다.');
				login_id.focus();
			}else{
				location.href = '${initParam.rootPath }/user/review/register?company_id=${param.company_id}';			
			}

		});
		 
	 	 $('#zzimListBtn').on("click", function() {//찜리스트 보이기
			
			self.location="${initParam.rootPath}/user/zzimlist?zzim_select=${user_login_id}";
		
		});   
	 	 
	 	 $('#zzimOutBtn').on("click", function () {//찜하기 취소버튼 클릭시
	 		 console.log('찜하기취소버튼');
	 		var form=$(this).parent(); 
	 		 form.attr('action','${initParam.rootPath}/remove');
			  //<form action="remove">
			  form.submit();	 		 
		});

	 	 
	 	 //찜한 행 존재 유무  
	 	  $.ajax({
			   url: '${initParam.rootPath}/zziminout',
			   type:'post',
			   data: {
				    zzim_selected:'${company_info.company_id}',
				    zzim_select:'${user_login_id }'
			   },
			   success: function (result) {
				   console.log(result);
		        		if(result=="exist"){
		        			 $('#zzimBtn').hide('fast');
		        			 
		        		}else{
		        			 $('#zzimOutBtn').hide('fast');
		        		}
			    }
			  
			  
		  }); 
	 	 
		
	});//document.ready
	/* 검색창 드롭다운 메뉴 */
	$('.taco').click(function(e) {
		var txt = $(e.target).text();
		$('.taco-input').val(txt);
	});

	function loginCheck() {

		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
			login_id.focus();
		} else {
			location.href = '${initParam.rootPath }/user/review/register?company_id=${param.company_id}';
			//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
		}
	}

	/* function loginCheckzzim() {

		var loginState = '${user_loginState }';
		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
			location.href = '${initParam.rootPath }/user/main';
		} else {
			location.href = '${initParam.rootPath }/user/review/list?company_id=${param.company_id}';
		}
	} */

	
</script>

</body>
</html>
