<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>그리드 테스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/portfolio.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Mina:400,700" rel="stylesheet">

<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>


<style>

</style>

<script type="text/javascript">

</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	<div class='nav'>
		<div class='navbar'>
			<div class='nav-item'>
				<div class='brand'>
					<img src="${initParam.rootPath }/resources/image/ing/brand.svg">
				</div>
				<div class=search></div>
				<ul>
					<li id='intro'>소개</li>
					<li id='contest'>콘테스트</li>
					<li id='company'>기업</li>
					<li id='community'>커뮤니티</li>
					<li id='faq' style="">FAQ</li>
					<li id='com-user' style='float: right; text-align: right;'>기업회원</li>
				</ul>
			</div>
			<div class='nav-list'></div>
		</div>
	</div>


	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_pf'>
			
				<div class='pf-header'>
					<div class='pf-img'>
						<img src="${initParam.rootPath }/resources/image/ing/pf-bg.svg">
						<div class='pf-user-icon'>
							<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">
						</div>
					</div>
					<div class='pf-info'>
						<div class='pf-title'>
							bluecatseyes
						</div>
						<div class='com-zzim-btn'>찜하기</div> 
					</div>
					<div class='pf-navbar'>
						<ul>
							<li id='self-intro'>자기소개</li>
							<li id='skill'>기술</li>
							<li id='lisence'>자격증</li>
							<li id='award'>수상경력</li>
							<li id='portfolio'>포트폴리오</li>
						</ul>
					</div>
				</div><!-- pf-header -->
				
				<div class='pf-body'>
					<div class='pf-intro'>
						<div class='body-title'>Self-introduce</div>
						<textarea rows="10" placeholder="자기소개를 해주세요"></textarea>
					</div>
					<div class='pf-skill'>
						<div class='body-title'>Skills</div>
					</div>
					<div class='pf-lisence'>
						<div class='body-title'>Lisence</div>
					</div>
					<div class='pf-award'>
						<div class='body-title'>Award</div>
					</div>
					<div class='pf-pflink'>
						<div class='body-title'>Portfolio</div>
					</div>
				</div>
				
			</div><!-- section_pf -->
				
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<%@include file="userMain/login_after.jsp" %>
		</div><!-- column-right -->


	</div><!-- container -->
	
	<!-- footer-area -->

</body>
</html>
