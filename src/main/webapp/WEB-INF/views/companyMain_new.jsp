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