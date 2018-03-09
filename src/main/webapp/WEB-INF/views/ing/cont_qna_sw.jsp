<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
									<td>삼성전자 기업면접봤어요....</td>																		
									<td>이성원</td>
									<td>18/03/09</td>
									<td>412</td>
									<td><span id="com_reply">10</span></td>
								</tr>
								<tr class='even'>
									<td>2</td>																		
									<td>삼성전자 면접후기</td>																		
									<td>송다정</td>
									<td>18/03/02</td>
									<td>999</td>
									<td><span id="com_reply">100</span></td>
								</tr>		
							</table>
						</div>
					</div>
				</div><!-- com-contest-head -->
				<div>
					<div class="com-contest-paging">
						<h4>페이지네이션</h4>
					</div><!-- com-contest-paging -->
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
