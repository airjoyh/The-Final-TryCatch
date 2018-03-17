<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업용tc FAQ</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/tc_faq_sw.css" rel="stylesheet" type="text/css">

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>	
		<!-- nav-area -->
	<%@ include file="../company-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>	
			<div class='section-faq'>
				<div class='title-wrapper'>
					<div class='column-title'>기업용 FAQ</div>
				</div>
				<div class='faq-box'>
					<ul class="faq">
						<li class="q">Q. [회원가입/탈퇴] 기업회원 가입은 무료입니까?</li>
						<li class="a">
							<div class="panel-body">
								Try Catch에 기업회원으로 가입 하시는 데는 일체 비용이 들지 않습니다.<br> 즉, 회원가입은
								무료입니다.<br> 회원가입 시 아이디, 비밀번호, 회사명, 사업자 등록번호 등 기업 정보를 입력하시면<br>
								바로 회원가입이 되어 Try Catch의 기업회원 서비스를 이용하실 수 있습니다.<br> 가입 시
								작성하셨던 정보를 수정하시려면 상단 메뉴 중 기업 로그인 후 <br> 마이페이지 > 회원정보 수정 메뉴를
								찾아 클릭하시면 기업정보, 가입자정보 등을 수정하실 수 있습니다.
							</div>
						</li>

						<li class="q">Q. [회원가입/탈퇴] 회원탈퇴는 어디에서 하나요?</li>
						<li class="a">
							<div class="panel-body">
								회원 로그인 > 기업서비스 > 회원정보 관리에서 회원탈퇴를 선택하여 신청하실 수 있습니다.<br> 탈퇴 시
								주의사항을 반드시 읽어보신 후 탈퇴를 위한 정보를 모두 입력하면 탈퇴신청이 접수됩니다.<br> 즉시
								탈퇴처리가 되는 것은 아니며, 운영자 확인을 거쳐 탈퇴가 이루어집니다.<br> 운영자 확인까지 1시간 가량
								시간이 걸릴 수 있으니 양해해 주시기 바랍니다.<br> 탈퇴 후에는 동일 아이디로 다시 가입할 수 없으며,
								아이디와 데이터는 복구할 수 없으니 신중하게 선택해 주세요.
							</div>
						</li>

						<li class="q">Q. [회원가입/탈퇴] 사업자등록증이 없어도 회원가입이 가능한가요??</li>
						<li class="a">
							<div class="panel-body">
								발급받은 사업자등록증의 번호를 입력해야만 회원가입이 가능합니다.<br> 필수 입력 정보로서, 이는
								사업자등록번호 도용 등에 의해 발생할 수 있는<br> 피해를 미연에 방지하기 위함이니 양해 바랍니다.
							</div>
						</li>

						<li class="q">Q. [기업정보 관리] 기업정보 중 가입자 이름 변경은 어떻게 하나요?</li>
						<li class="a">
							<div class="panel-body">
								채용 담당자의 퇴사 등으로 가입자 변경이 필요한 경우 회원 탈퇴 후<br> 재가입 할 필요없이 가입자
								정보를 변경하실 수 있습니다.<br> 마이페이지 > 회원정보 수정 페이지에서 가입자정보의 가입자명 수정이
								가능합니다.
							</div>
						</li>

						<li class="q">Q. [지원자 관리] 지원자가 많아 공고를 마감하고 싶습니다.</li>
						<li class="a">
							<div class="panel-body">
								기업회원으로 구인등록 하신 경우,<br> 기업서비스 > 알바공고관리 > 게재중인 공고에서 마감시키려는
								채용공고를 찾아<br> 우측의 [마감] 버튼을 클릭하시면 해당 공고가 마감됩니다.<br> 공고를
								마감해도 “재등록” 기능을 통해 기존의 모집내용 그대로 공고를 등록하실 수 있습니다.
							</div>
						</li>

					</ul>
				</div>
			</div><!-- section_main1 -->
			
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="com_login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="com_login_after_new.jsp"%>
			</div>
		</div>
		<!-- column-right -->
			
			
		<!-- modal 코드 -->
		<%@ include file="../user/user_modals_new.jsp" %>
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
