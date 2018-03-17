<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트개최</title>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- com-nav -->
	<%@include file="../../company-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		
		<div class='column-left'>
		
			<div class='com-contest-info'>
			
			<form action="register" name="contestRegisterForm" method="post">
				<div class='title-wrapper'>
					<input type="hidden" id="company_id" name="company_id" value="${company_login_company_id }">
					<div class='column-title'>콘테스트 개최정보 입력</div>
				</div>
				
				<div class='wrapper'>
					<div class='cont-regist-contents'> 
						<div class='cont-reg-title'>콘테스트 타이틀</div>
						<input type="text" id="contest_title" name="contest_title" placeholder="개최할 콘테스트의 타이틀을 입력해주세요">
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>일자선택</div>
						<div class='half-contents'>
							<input id="contest_startDate" name="contest_startDate" placeholder="시작 날짜  ex)2018/03/07 18:30">
							<input id="contest_endDate" name="contest_endDate" 
								placeholder="끝날짜 ex)2013/03/07 19:30:00" style="border-top: 0;">
						</div>
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>채용인원수</div>
						<input id="contest_hireNumber" name="contest_hireNumber" placeholder="숫자만 입력해주세요">
					</div>
					<div class='cont-regist-contents'>
						<input id="contest_field" name="contest_field" placeholder="분야를 입력해주세요.">
						
						</div>

						<div class='cont-regist-contents'>
							<div class='cont-reg-title'>콘테스트 내용 작성</div>
							<textarea name="contest_contents" rows="10" class="form-control"
								id="contest_contents"></textarea>
						</div>
						<div class='cont-reg-title'>담당자명</div>
						<input id="manager_name" name="manager_name" placeholder="담당자 이름"> 
						<div class='cont-reg-title'>담당부서</div>
						<input id="team_name" name="team_name" placeholder="담당자 소속"> 
						<div class='cont-reg-title'>담당자 이메일</div>
						<input id="manager_email" name="manager_email" placeholder="담당자 이메일"> 
						<div class='cont-reg-title'>담당자 연락처</div>
						<input id="manager_tel" name="manager_tel" placeholder="담당자 연락처">
					</div>
						<div class='cont-reg-btn-area'>
							<button type="button" id="contestRegisterBtn" onclick="validateCheck()">다음</button>
							<button type="reset" >취소</button>
						</div>
					
				</form>
			</div><!-- com-contest-info -->
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../com_login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../com_login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->
		
		<!-- modal import -->
		<%@ include file="../company_modal_new.jsp" %>
	</div>
<script type="text/javascript">
$(document).ready(function() {

	if(loginState != 'login'){
		alert('로그인되지 않은 상태입니다.');
		self.location = '${initParam.rootPath}/company/main';
	}
});
var validateCheck=function(){
		console.log('콘테스트 등록 버튼 클릭');
		var startDate = $('#contest_startDate').val();
		console.log('시작날짜 >>> '+startDate);
		var contest_hireNumberExp = /^[0-9]{1,3}/;
		if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($('#contest_startDate').val()==''){
			alert('시작 날짜를 입력하세요.');
			$('#contest_startDate').focus();
		}else if($('#contest_endDate').val()==''){
			alert('끝 날짜을 입력하세요.');
			$('#contest_endDate').focus();
		}else if(!contest_hireNumberExp.test($('#contest_hireNumber').val())){
			alert('숫자만 입력하세요.');
			$('#contest_hireNumber').focus();
		}else if($('#contest_field').val()==''){
			alert('분야를 입력하세요.');
			$('#contest_field').focus();
		}else if($('#contest_contents').val()==''){
			alert('내용을 입력하세요.');
			$('#contest_contents').focus();
		}else if($('#manager_name').val()==''){
			alert('담당자 이름을 입력하세요.');
			$('#manager_name').focus();
		}else if($('#team_name').val()==''){
			alert('담당자 소속을 입력하세요.');
			$('#team_name').focus();
		}else if($('#manager_email').val()==''){
			alert('담당자 이메일을 입력하세요.');
			$('#manager_email').focus();
		}else if($('#manager_tel').val()==''){
			alert('담당자 번호를 입력하세요.');
			$('#manager_tel').focus();
		}else{
			document.contestRegisterForm.submit();
		}
		
		
		
	}
</script>
</body>
</html>
