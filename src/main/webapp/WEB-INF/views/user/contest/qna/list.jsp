<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="${initParam.rootPath }/resources/css/contest_qna_sw.css" rel="stylesheet" type="text/css">
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
     $('#newBtn').on("click", function(evt) {//글쓰기(New Board) 버튼을 클릭하면

	     self.location = "${initParam.rootPath }/user/contest/qna/register?contest_id=${param.contest_id }";//입력폼으로 이동

     });
     
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
 							+"&contest_id=${param.contest_id}";
 		});
});

     function loginCheck() {

	   var loginState = '${user_loginState }';
	   //alert("로그인 상태>>>" + loginState);
	   if (loginState != 'login') {
		alert('로그인하신 후에 이용 가능합니다.');
	   } else {
		location.href = '${initParam.rootPath }/user/contest/qna/register?contest_id=${param.contest_id}';
		//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
	}
}
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
				<div class='com-contest-head'>
					<div class='title-wrapper'>
						<div class='column-title'>콘테스트 리스트</div>
					</div>
					<div class='wrapper'>
						<div class='com-inline-txt'>
							<p class='inline-txt-head'>콘테스트 등록 시 참고 사항</p>
							<p class='inline-txt-body'>
								- 콘테스트 개최 버튼을 클릭하여 콘테스트를 등록할 수 있습니다.<br>
								- 콘테스트 리스트 우측의 '등록'버튼을 누르시면 구직자들에게 공개됩니다.<br>
								- 문제 유형과 정답을 정확히 입력하여 주셔야 올바른 채점이 가능합니다.<br>
								- 시험시 유의사항을 꼼꼼히 작성해 주시고 질의 게시판에 상시 답변 부탁드립니다.<br>
							</p>
						
						</div>
						<div class='com-inline-btn'>
							<input type="button" class='register-contest' value='콘테스트 등록'>
						</div>
						
						</div>
				</div><!-- com-contest -->
			</div><!-- section_main1 -->
				
			<div class='section_main2'>
				<div class='com-contest-head'>
					<div class='title-wrapper'>
						<div class='column-title'>콘테스트 Q&A 게시판</div>
					</div>
					<div class='company-contest-table'>
						<div class='wrapper'>
							<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 10%;">글번호</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 10%;">작성자</th>
							<th style="width: 15%;">작성일</th>
							<th style="width: 10%;">조회수</th>
							<th style="width: 7%;">댓글</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="contest_qna" varStatus="stat">
					 		  <tr>
								<td style="width: 10%;">${contest_qna.qna_no }</td>
								<td style="width: 40%;"><a
									href="${initParam.rootPath }/user/contest/qna/read${pageMaker.makeSearch(pageMaker.cri.page)}&contest_id=${param.contest_id }&qna_no=${contest_qna.qna_no }">${contest_qna.qna_title }</a></td>
								<td style="width: 10%;">${contest_qna.qna_writer }</td>
								<td style="width: 15%;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${contest_qna.qna_wdate}" /></td>
								<td id="count" style="width: 10%;">${contest_qna.qna_viewCount }</td>
								<td><span class="badge">${contest_qna.qna_replyCount }</span></td>
							 </tr>
						  </c:forEach>
					</tbody>
				</table>
						</div>
					</div>
					<div align="right">
		            	<a class="btn btn-default pull-right" href="javascript:loginCheck()"
				            id="write">글쓰기</a>
		           </div>
				</div><!-- com-contest-head -->
				<div align="center">
		<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&contest_id=${param.contest_id }">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
		<li 
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="list${pageMaker.makeSearch(idx)}&contest_id=${param.contest_id }">${idx}</a>
		</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&contest_id=${param.contest_id }">&raquo;</a></li>
		</c:if>			
		</ul>
		</div>
		<div class='box-body'>
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
					<button id='newBtn'>글쓰기</button>

				</div>
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
