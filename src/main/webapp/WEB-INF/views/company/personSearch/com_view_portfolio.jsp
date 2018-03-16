<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 리스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/com_contest.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/portfolio.css" rel="stylesheet" type="text/css">
<!-- ICON -->

<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>

<!-- 임시 js -->
<script type="text/javascript">
	$(function(){
        $('a').click(function (e) {  
            e.preventDefault();  
            var url = "www.naver.com";  
            location.href=url;  
        }); 

	});
</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- com-nav area -->
	<%@include file="../../ing/com/com-nav.jsp" %>
	
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
						<pre id='introduce'></pre>
					</div>
					<div class='pf-skill'>
						<p class='body-title'>Skills</p>
						<c:forEach begin="1" end="2">
							<div class='skill-box'></div>
						</c:forEach>
					</div>
					<div class='pf-lisence'>
						<p class='body-title'>Lisence</p>
						<c:forEach begin="1" end="2">
							<div class='lisence-box'></div>
						</c:forEach>
					</div>
					<div class='pf-award'>
						<p class='body-title'>Award</p>
						<c:forEach begin="1" end="2">
							<div class='award-box'></div>
						</c:forEach>
					</div>
					<div class='pf-pflink'>
						<p class='body-title'>Portfolio site</p>
						<c:forEach begin="1" end="2">
							<a class='portfolio-link'>www.naver.com</a><span>바로가기▶</span>
						</c:forEach>
					</div>
				</div>

			</div><!-- section_pf -->				
		</div>
		
		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<!-- login include -->
				
		</div><!-- column-right -->
			

			
			
	</div><!-- container -->



</body>
</html>
