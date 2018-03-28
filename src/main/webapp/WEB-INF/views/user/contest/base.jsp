<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 게시판</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/community_list_sw.css" rel="stylesheet" type="text/css">


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
	<!-- nav-area -->
  <%@ include file="../../user-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main_community'>

					<div class='title-wrapper'>
						<div class='column-title'>커뮤니티 게시판</div>
					</div>
					
			</div><!-- section_main_community -->
				
		</div><!-- column-left -->

		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<div id="rightDiv" class='column-right'>
				<div id="login_beforeDiv">
					<%@ include file="../../user/login_before_new.jsp"%>
				</div>
				<div id="login_afterDiv" style="display: none">
					<%@ include file="../login_after_new.jsp"%>
				</div>
			</div>
			<!-- column-right -->
		</div>
		<!-- modal 코드 --> 
       <%@ include file="../user_modals_new.jsp" %>
				
		</div><!-- container -->
			
	
	<!-- frame -->
<script type="text/javascript">
	$(function(){
		
	});//function

</script>
</body>
</html>