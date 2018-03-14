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
<link href="${initParam.rootPath }/resources/css/blist_sw.css" rel="stylesheet" type="text/css">

<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>

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
					<div class="content1">
							<section class="elem elem-yellow" id="com-search" style="width: 740px;height: 50px;">
								<div class="com-select">
								<select class="com-rank"></select>
								</div>
							</section>
							<section class="elem elem-yellow" id="com-searchList" style="width: 740px;height: 500px;">
								<div class='company-contest-table'>
									<div class='wrapper'>
										<table cellspacing='0'>
											<tr>
												<th>기업</th>
												<th>평점</th>
												<th>리뷰갯수</th>
										
											</tr>
				
											<tr>
												<td>
													<div style="display: flex;">
														<img alt="이미지" src="resources/company/img/ksd.jpg" style="width: 50px; height: 50px;">
														<div style="flex-direction: column;">
															<div style="height: 50%;">
															<a href="${initParam.rootPath }/bread">삼성전자(주)</a>													
															</div>
															<div style="height: 50%;">
															<span style="border-radius: 10px; background-color: darkgray;">JAVA</span>
															<span style="border-radius: 10px; background-color: darkgray;">Python</span>
															</div>
														</div>
													</div>
												</td>
												<td>4.5/5.0</td>
												<td><span>312</span></td>
											</tr>
											<tr class='even'>
												<td>
													<div style="display: flex;">
														<img alt="이미지" src="resources/company/img/ksd.jpg" style="width: 50px; height: 50px;">
														<div style="flex-direction: column;">
															<div style="height: 50%;">
															<a href="${initParam.rootPath }/bread">카카오(주)</a>													
															</div>
															<div style="height: 50%;">
															<span style="border-radius: 10px; background-color: darkgray;">JAVA</span>
															<span style="border-radius: 10px; background-color: darkgray;">C++</span>
															</div>
														</div>
													</div>
												</td>
												<td>4.5/5.0</td>
												<td><span>452</span></td>
											</tr>
											<tr>
												<td><img alt="이미지" src="resources/company/img/ksd.jpg" style="width: 30px; height: 30px;"><a href="#">다이슨 컴퍼니(주)</a></td>
												<td>4.5/5.0</td>
												<td><span>88</span></td>
											</tr>
											<tr class='even'>
												<td><img alt="이미지" src="resources/company/img/ksd.jpg" style="width: 30px; height: 30px;"><a href="#">네이버(주)</a></td>
												<td>4.5/5.0</td>
												<td><span>72</span></td>
											</tr>		
										</table>
									</div>
								</div>
							</section>
							<section class="elem elem-yellow" id="paging" style="width: 740px;height: 100px;">
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
							</section>
					</div>
					<!-- content1 -->
				</div><!-- section_main1 -->
				
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
	
<!-- select -->
<script type="text/javascript">
$(function(){
	$('.star-btn').on("click", function(){
		self.location="${initParam.rootPath }/blist"
	});
});
</script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/com_info_list.js">
</script>
<script type="text/javascript">
rank('option');
</script>
</body>
</html>
