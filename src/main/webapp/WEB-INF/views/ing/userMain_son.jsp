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
	$(function(){
		$('.mypage').on('click', function() {
			$('.mypage-dropdown').toggle();
		});
	});
</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main1'>
				<div class="tabs-container">
					<div class="tabs effect-3">
						<input type="radio" id="tab-1" name="tab" checked="checked">
						<span href="#tab-item-1">Info</span> 
						<input type="radio" id="tab-2" name="tab"> 
						<span href="#tab-item-2">Contest Start</span>
						<div class="line ease"></div>
			
						<div class="tab-content">
							<section id="tab-item-1">
								<h1>One</h1>
							</section>
							<section id="tab-item-2">
								<h1>Two</h1>
							</section>
			    			</div>
						</div>
					</div>
				</div><!-- section_main1 -->
				
			<div class='section_main2'>
			
			</div><!-- section_main2 -->
				
		</div>
		
		<!-- right section!!************************************************************** -->
		<div class='column-right'>
		
			<div class="section_login">
				<div class='login-info'>
					<div class='user-icon'>
						<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">
					</div>
					<div class='id_div'>
						<div class='logout-btn'><a>로그아웃</a></div>
					</div>
					<div class='user-email'>
						bluecayseyes@naver.com
					</div>
				</div>
				<div class='login-tab'>
					<div class='mypage'>마이페이지</div>
					<div class='note'>쪽지
						<label class='note-cnt'></label>
						<span id='note-cnt'>0</span>
					</div>
					<!-- hidden nav -->
					<div class='mypage-dropdown'>
						<div class='line'></div>
						<div class='portfolio'>포트폴리오 페이지</div>
						<div class='pwd-change'>비밀번호 변경</div>
					</div>
				</div>
			</div><!-- section_login -->

			<div class="section_zzim">
				<div class="title-wrapper">
					<div class='column-title'>관심기업 리스트</div>
				</div>
				<div class='wrapper'>
					<div class='column-contents'>
						<i>현재 찜한 기업이 없습니다.</i>
						<!-- 있으면 테이블 없으면 i -->
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
	
	<!-- footer-area -->

</body>
</html>
