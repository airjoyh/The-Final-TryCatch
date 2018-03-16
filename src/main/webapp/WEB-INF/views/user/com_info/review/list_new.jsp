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
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/bread_sw.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>


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
	$(document).ready(function() {
		$('.initial').hide();
		$('.tdTtl').mouseenter(function() {

		});

		$('#myTab a:last').tab('show');

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

			self.location = "register";//입력폼으로 이동

		});
		 
	 	 $('#zzimlistBtn').on("click", function() {//찜리스트 보이기
			
			self.location="${initParam.rootPath}/ing/zzimlist?zzim_select=${user_login_id}";
		
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
				    zzim_selected:${company_info.company_id},
				    zzim_select:'${user_login_id }'
			   },
			   success: function (result) {
				   console.log(result);
		        		if(result=="exist"){
		        			 $('#zzimBtn').hide();
		        		}else{
		        			 $('#zzimOutBtn').hide();
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

		var loginState = '${user_loginState }';
		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
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

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main1'>
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
								<div class="review-content">
									<div class="review-box">
										<div class="review-name">
											<div class="com-img">
												<img alt="회사이미지" src="resources/company/img/ksd.jpg" style="height: 80px; width: 80px;">
											</div>
											<div class="com-skill">
												<div style="height: 50%;">
												<a href="views/board/read.jsp">${company_info.company_name  }</a>		
												<img alt="별" src="" id="star"
													style="width: 25px; height: 25px;">
												<span>${total }/5.0</span>											
												</div>
												<div style="height: 50%;">
												<span style="border-radius: 10px; background-color: darkgray;">${company_info.company_line }</span>
												</div>
											</div>
											<div class="com-btn">
											<form method="post">
											    <input type="hidden" id="zzim_select" name="zzim_select" value="${user_login_id }">
				                                <input type="hidden" name="zzim_selected" id="zzim_selected" value="${company_info.company_id}">
												<button style="float: right;" id="zzimBtn" type="submit">찜하기</button>	  			  				  		  				  
				                                <button style="float: right;" id="zzimOutBtn" type="button">찜하기 취소</button>
											</form>
											</div>
										</div>
									</div>
									<div class="review-box">
										<label>기업 소개</label><br>
										<textarea rows="3" cols="100px" st>${company_info.company_intro }</textarea>
									</div>
									<div class="review-box">
										<div class="com-info">
											<div style="height: 50%;">
												<div id="box-left">
													<label id="company_line">산업군</label>
													<div>${cominfo.company_line }</div>
												</div>
												<div id="box-center">
													<label id="company_year">설립 년도</label>
													<div>${cominfo.company_year }</div>
												</div>
												<div id="box-right">
													<label id="company_site">기업 사이트</label>
													<div>${cominfo.company_site }</div>
												</div>
											</div>
											<div style="height: 50%;">
												<div id="box-left">
													<label id="company_addr">기업 주소</label>
													<div>${cominfo.company_addr }</div>
												</div>
												<div id="box-center">
													<label id="company_size">기업 규모</label>
													<div>${cominfo.company_size }</div>
												</div>
												<div id="box-right">
													<label id="company_turnover">매출액</label>
													<div>${cominfo.company_turnover }</div>
												</div>
											</div>
										</div>
									</div>
									<div class="review-box" style="margin-top: 10px;">
										<label>현재 개최중인 콘테스트 정보</label><br>
										<span style="color: #5f63fd">없음
										</span>
									</div>
								</div>
								<!-- review-content -->
							</section>
							<section id="tab-item-2">
								<!--***********************************************************
								*                                                             *
								*                           후기                                                                     *
								*                                                             *
								************************************************************-->
								<div class="review-content">
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>종합만족도</label><br>	
												<progress id="progressBar" max="100" value="33"></progress>								
											</div>
											<div class="star-right">
												<label>승진 및 기회가능성</label><br>	
												<progress id="progressBar" max="100" value="44"></progress>																
											</div>
										</div>
									</div>
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>복지 및 급여</label><br>																					
												<progress id="progressBar" max="100" value="55"></progress>
											</div>
											<div class="star-right">
												<label>업무와 삶의 균형</label><br>										
												<progress id="progressBar" max="100" value="66"></progress>
											</div>
										</div>
									</div>
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>사내문화</label><br>																					
												<progress id="progressBar" max="100" value="77"></progress>
											</div>
											<div class="star-right">
												<label>경영진</label><br>										
												<progress id="progressBar" max="100" value="88"></progress>
											</div>
										</div>
									</div>
								</div>
								<!-- review-content -->
							</section>
			    			</div>
						</div>
					</div>
				</div><!-- section_main1 -->
				
				
			<div class='section_board'>
				<div class='com-contest-head'>
					<div class='title-wrapper'>
						<div class='column-title'>기업 후기 게시판</div>
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
										<c:forEach items="${list }" var="review" varStatus="stat">
											<tr>
												<td style="width: 10%;">${review.review_no }</td>
												<td style="width: 40%;"><a
													href="${initParam.rootPath }/user/review/read${pageMaker.makeSearch(pageMaker.cri.page)}&company_id=${param.company_id }&no=${review.review_no }">${review.review_title }</a></td>
												<td style="width: 10%;">${review.review_writer }</td>
												<td style="width: 15%;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.review_wdate}" /></td>
												<td id="count" style="width: 10%;">${review.review_viewCount }</td>
												<td><span class="badge">${review.review_replyCount }</span></td>
											</tr>
										</c:forEach>		
										</table>
						</div>
					</div>
				
				
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
								                  <option value="tw"
								                     <c:out value="${cri.searchType eq 'tw'?'selected':''}"/>>
                    					 제목+작성자</option>
								               </select> <input type="text" name='keyword' id="keywordInput"
								                  value='${cri.keyword }'>
								               <button id='searchBtn'>검색</button>
								               <a href="javascript:loginCheck()"><button id='registBtn'>글쓰기</button></a>
								
								   </div>
								</div><!-- com-contest-paging -->
				</div><!-- com-contest-head -->
			</div><!-- section_main2 -->
				
		</div>
		
		<!-- right section!!************************************************************** -->
		<div class='column-right'>
		
			<div class="section_login">
				<div class="wrapper">
				    <div><input class='login-input' type="email" name="email" placeholder="이메일"></div>
				    <div><input class='login-input' type="password" name="password" placeholder="비밀번호"></div>
				    <div><input type="button" value="로그인" class='login-btn'> </div>
				    <span class="pure-checkbox" style="float: left;">
                  	  <input id="checkboxtoggle" name="checkbox" type="checkbox">
                      <label for="checkboxtoggle">정보기억</label>
                      </span>
                    <span style="float: right;padding: 2px 0 0 6px;">
                	  <a href='#find-pwd'>비밀번호 찾기</a>
                	  </span>
                    <span style="float: right;padding: 2px 6px;">
                	  <a href='#register'>회원가입</a>
                	  </span>
				  </div>
				</div><!-- section_login -->
				
				<div class="section_zzim">
					<div class="title-wrapper">
						<div class='column-title'>관심기업 리스트</div>
					</div>
					<div class='wrapper'>
						<div class='column-contents'>
							<i>현재 찜한 기업이 없습니다.</i><!-- 있으면 테이블 없으면 i -->
							<table class='zzim-table'>
								<thead>
									<tr>
										<th>기업명</th>
										<th>평점</th>
										</tr>
									</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										</tr>
									</tbody>
								
							</table>
						</div>
					</div>
						
						
						
				</div><!-- section_zzim -->
				
			</div><!-- column-right -->
			
			
			
		<!-- modal 코드 -->
		
		<!-- 회원가입 모달 -->
		<div class="modal" id="register">
			<div class="modal-pannel">
				<div class="modal-title">회원가입 <a href="#close">CLOSE</a></div>
				<div class="modal-body">
					<input id="member_id" name="member_id" 
				       	type="email" placeholder="이메일을 입력하세요">
					<input id="member_pass" name="member_pass"
					   	type="password" placeholder="비밀번호를 입력하세요">
					<input id="member_pass" name="member_pass"
					   	type="password" placeholder="비밀번호 확인" style="float: right;">
					<input id="user_authCode" name="user_authCode"
					  	type="text" placeholder="60초 안에 인증코드를 입력해주세요" size="20">
					<input type="button" name="sendEmail" id="sendEmail"
				       	value="인증코드 요청">
					</div>
					
				<div class="modal-footer">
					<input type="button" name="emailConfirm" id="emailConfirm"
				       	value="완료">
					</div>
				</div>
			</div>
			
		<!-- 비밀번호 찾기 모달 -->	
		<div class="modal" id="find-pwd">
		<div class="modal-pannel">
				<div class="modal-title">회원가입 <a href="#close">CLOSE</a></div>
				<div class="modal-body">
					<input id="member_id" name="member_id" 
				       	type="email" placeholder="이메일을 입력하세요">
					<i>*가입하신 이메일로 임시 비밀번호가 전송됩니다.</i>
					</div>
					
				<div class="modal-footer">
					<input type="button" name="emailConfirm" id="emailConfirm"
				       	value="완료">
					</div>
				</div>
			</div>
		</div>

	<!-- frame -->

</body>
</html>
