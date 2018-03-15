<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- C태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>쪽지게시판</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tc_mail_sw.css" rel="stylesheet" type="text/css">
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
		
			<div class='section_main'>
				<div class='com-contest-head'>
					<div class='title-wrapper'>
						<div class='column-title'>받은쪽지함</div>
					</div>
					<div class="com-contest-paging">
					    <div class='cont-qna-search'>
					               <select name="searchType">
					                  <option value="n"
					                     <c:out value="${cri.searchType == null?'selected':''}"/>>
                    					 검색조건</option>
					                  <option value="t"
					                     <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                     					보낸 구직자</option>                  
					                  <option value="w"
					                     <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                    					 내용</option>
					                  <option value="tw"
					                     <c:out value="${cri.searchType eq 'tw'?'selected':''}"/>>
                    					 보낸 구직자+내용</option>
					               </select> <input type="text" name='keyword' id="keywordInput"
					                  value='${cri.keyword }'>
					               <button id='searchBtn'>검색</button>
					
					   </div>
					</div><!-- com-contest-paging -->
					<div class='company-contest-table'>
						<div class='wrapper'>
							<table cellspacing='0'>
								<tr>
									<th style="width: 8%">번호</th>
									<th style="width: 60%">내용</th>
									<th style="width: 15%">보낸 구직자</th>									
									<th style="width: 17%">날짜</th>																	
								</tr>				
						 <c:forEach items="${list }" var="note" varStatus="stat">
								<tr>
									<td>${note.note_id} </td>																		
									<td><a href="${initParam.rootPath }/company/note/read${pageMaker.makeSearch(pageMaker.cri.page)}&note_receiver=${note.note_receiver }&note_id=${note.note_id }">${note.note_contents}</a></td>																		
									<td>${note.note_sender}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${note.note_senddate}" /></td>
								</tr>
						  </c:forEach>	
							</table>
						</div>
					</div>

					<div class="cont-qna-page">
						      <ul class="pagination">
						      <c:if test="${pageMaker.prev}">
						         <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&note_receiver=${param.note_receiver }">&laquo;</a></li>
						      </c:if>
						      <c:forEach begin="${pageMaker.startPage }"
						            end="${pageMaker.endPage }" var="idx">
						      <li 
						         <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						         <a href="list${pageMaker.makeSearch(idx)}&note_receiver=${param.note_receiver }">${idx}</a>
						      </li>
						      </c:forEach>
						
						      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						         <li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&note_receiver=${param.note_receiver }">&raquo;</a></li>
						      </c:if>         
						      </ul>
					</div><!-- cont-qna-page -->

				</div><!-- com-contest-head -->
				<div>
				</div>
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
<script type="text/javascript">
$(function(){
	$('#registBtn').on("click", function(){
		self.location="${initParam.rootPath }/mailread"
	});
});

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
