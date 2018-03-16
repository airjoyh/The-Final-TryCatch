<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>TryCatch UserMain</title>

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

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	<%@ include file="user-nav_new.jsp" %>
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main1'>
				<img src="${initParam.rootPath }/resources/image/building/building_8.jpg">
			</div><!-- section_main1 -->
				
			<div class='section_main2'>
				<img src="${initParam.rootPath }/resources/image/monitor/monitor_1.jpg">
			</div><!-- section_main2 -->
				
		</div>
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="user/login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="user/login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->
		<!-- modal import -->
		<%@ include file="user/user_modals_new.jsp" %>
		
		
		
		

	<!-- frame -->
	</div>
	<!-- footer-area -->

</body>
</html>
