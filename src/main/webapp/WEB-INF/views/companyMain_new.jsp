<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업회원</title>

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- com-nav -->
	<%@include file="company-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='com_main1'>
				<img src="${initParam.rootPath }/resources/image/building/building_9.jpg">
				<div class="com_main_start">
					<h1 class="com_write_start">검증된 인재를 채용하세요.</h1>
					<br>
					<h3 class="com_write_start">TryCatch에서 직접 원하는 인재를 만날 수 있습니다.</h3>
					<button class="com_main_btn"></button>
				</div>
			</div><!-- section_main1 -->
				
			<div class='com_main2'>
				<img src="${initParam.rootPath }/resources/image/building/building_4.jpg">
			</div><!-- section_main2 -->
				
		</div>
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="company/com_login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="company/com_login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->
		<!-- modal import -->
		<%@ include file="company/company_modal_new.jsp" %>
		
		
		
		

	<!-- frame -->
	</div>
	<!-- footer-area -->
</body>
</html>