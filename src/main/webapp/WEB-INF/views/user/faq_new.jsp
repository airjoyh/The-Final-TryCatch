<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>구직자tc FAQ</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/tc_faq_sw.css" rel="stylesheet" type="text/css">

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>	
		<!-- nav-area -->
	<%@ include file="../user-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>	
			<div class='com-contest-head'>
				<div class='title-wrapper'>
					<div class='column-title'>구직자용 FAQ</div>
				</div>
				<div class='faq-box'>
					<ul class="faq">
						<li class="q">Q. [회원가입/탈퇴] 회원가입은 무료인가요?</li>
						<li class="a"><div class="panel-body">
								Try Catch 회원가입은 무료입니다.<br> 회원가입 방법으로는 '개인 회원가입','기업 회원가입'이
								있습니다.<br> Try Catch 아이디 만들기<br> 아이디, 비밀번호, 이메일 주소 등
								간단한 개인정보를 입력하면 <br> 바로 회원가입이 되어 알바몬의 개인회원 서비스를 이용하실 수 있습니다.<br>

								* 가입 시 작성한 정보를 수정은 로그인 후 마이페이지 > 회원정보 수정 메뉴에서 하실 수 있습니다.
							</div></li>

						<li class="q">Q. [회원가입/탈퇴] 회원탈퇴는 어디에서 하나요?</li>
						<li class="a">
							<div class="panel-body">
								회원탈퇴는 회원 로그인 > 개인서비스 > 회원정보 관리 페이지의 회원탈퇴 메뉴에서 신청하실 수 있습니다.<br>

								탈퇴 시 주의사항을 반드시 읽어보신 후 탈퇴를 위한 정보를 모두 입력하면 탈퇴신청이 접수됩니다.<br>

								즉시 탈퇴처리가 되는 것은 아니며, 운영자 확인을 거쳐 탈퇴가 이루어집니다.<br> 운영자 확인까지 1시간
								가량 시간이 걸릴 수 있으니 양해해 주시기 바랍니다.<br> 탈퇴처리가 되면 회원님의 메일로 탈퇴 되었다는
								메일이 발송됩니다.
							</div>
						</li>

						<li class="q">Q. [회원가입/탈퇴] 개인회원으로는 채용공고를 등록할 수 없나요?</li>
						<li class="a">
							<div class="panel-body">
								기본적으로 채용공고 등록/관리는 기업회원님께 제공하는 서비스입니다.<br> 기업회원으로 가입/로그인 후
								공고등록 이용을 부탁 드립니다.
							</div>
						</li>

						<li class="q">Q.[회원정보관리]아이디와 비밀번호를 다른 걸로 변경할 수 있나요?</li>
						<li class="a">
							<div class="panel-body">
								네, 가능합니다.<br> 아이디 및 비밀번호 변경은 로그인 후 마이페이지 > 회원정보 수정 에서 수정하실
								수 있습니다.
							</div>
						</li>

						<li class="q">Q. [회원정보관리] 회원정보는 어디서 수정할 수 있나요?</li>
						<li class="a"><div class="panel-body">회원정보는 로그인 후 마이페이지
								> 회원정보 수정 에서 수정하실 수 있습니다.</div></li>

						<li class="q">Q. [기업후기] 기업 후기는 내가 쓴 글만 볼 수 있나요?</li>
						<li class="a">
							<div class="panel-body">기업후기는 회원가입한 사람은 누구나 볼 수 있습니다.</div>
						</li>

						<li class="q">Q. [기업후기] 작성한 기업후기를 수정 하고 싶어요. 어떻게 하나요?</li>
						<li class="a">
							<div class="panel-body">
								작성한 기업후기를 수정하고 싶을 시 <br> 후기 > 글 선택 > 수정 메뉴를 누르시고 글을 다시 작성하신
								후 <br> 등록하시면 됩니다.
							</div>
						</li>

						<li class="q">Q. [기업후기] 익명이 보장되나요?</li>
						<li class="a">
							<div class="panel-body">
								네. 기업후기는 철저하게 <span style="color: red">익명으로 처리</span>되오니 솔직한 경험을
								공유해주세요.
							</div>
						</li>

					</ul>
				</div>
			</div><!-- section_main1 -->
			
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="login_after_new.jsp"%>
			</div>
		</div>
		<!-- column-right -->
			
			
		<!-- modal 코드 -->
		<%@ include file="user_modals_new.jsp" %>
</div>		
		
	<!-- frame -->
<script type="text/javascript">
var action = 'click';
var speed = "500";
	//Document.Ready
$(function(){
	//Question handler
	$('li.q').on(action, function(){
		$(this).next().slideToggle(speed).siblings('li.a').slideUp();
		
		
	});
});
</script>

</body>
</html>
