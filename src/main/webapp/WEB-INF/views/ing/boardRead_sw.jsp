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
												<a href="views/board/read.jsp">삼성전자(주)</a>		
												<img alt="별" src="" id="star"
													style="width: 25px; height: 25px;">
												<span>4.5/5.0</span>											
												</div>
												<div style="height: 50%;">
												<span style="border-radius: 10px; background-color: darkgray;">JAVA</span>
												<span style="border-radius: 10px; background-color: darkgray;">Python</span>
												</div>
											</div>
											<div class="com-btn">
												<input type="button" class="btn blue" value="찜하기">
											</div>
										</div>
									</div>
									<div class="review-box">
										<label>기업 소개</label><br>
										<span>쿠팡은 세계에서 가장 빠르고 크게 성장하는 E-commerce 기업입니다.
												우리는 ‘고객들이 쿠팡 없는 삶을 상상조차 할 수 없는’ 세상을 열어 가고자 합니다.
												쿠팡은 우리와 함께 이 비전을 현실로 만들어 나갈 열정적인 인재를 찾고 있습니다.
										</span>
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
											<tr>
												<td>1</td>																		
												<td><a href="">삼성전자 기업면접봤어요....</a></td>																		
												<td>이성원</td>
												<td>18/03/09</td>
												<td>412</td>
												<td><span id="com_reply">10</span></td>
											</tr>
											<tr class='even'>
												<td>2</td>																		
												<td><a href="">삼성전자 면접후기</a></td>																		
												<td>송다정</td>
												<td>18/03/02</td>
												<td>999</td>
												<td><span id="com_reply">100</span></td>
											</tr>		
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
								               <button id='registBtn'>글쓰기</button>
								
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

<script type="text/javascript">
$(function(){
	$('#registBtn').on("click", function(){
		self.location="${initParam.rootPath }/comreregister"
	});
});
</script>
</body>
</html>
