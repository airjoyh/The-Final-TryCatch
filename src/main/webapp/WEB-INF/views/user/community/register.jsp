<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 글등록</title>


<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/community_register_sw.css" rel="stylesheet" type="text/css">

<!-- 임시 js -->


</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	<%@ include file="../../user-nav_new.jsp"%>
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>	
			<div class='com-contest-head'>
				<div class='title-wrapper'>
					<div class='column-title'>커뮤니티 글작성</div>
				</div>
				<div class='wrapper'>
				<form method="post">
				   <div class="form-group">
					<div class='com-qna-title'>
							<!-- <div class="row" hidden="" >
						        <div class="input-group">
						            <span class="input-group-addon">글번호</span> <input
						            	  class="form-control" id="community_title" name="community_title" type="text"
						                  style="width: 35%" placeholder="글번호 자동입력." readonly="readonly">
						            <span class="input-group-addon" style="padding-left: 3em;">작성일</span> <input
						                  class="form-control" id="community_writer" name="community_writer"
						                  style="width: 35%" placeholder="yy-mm-dd hh-MM-ss">
						        </div>
						    </div> -->
							<span class="input-group-addon">제목</span>&nbsp;&nbsp;&nbsp; <input
				                  class="qna-title" id="community_title" name="community_title" type="text"
				                  style="width: 35%" placeholder="제목을 입력하세요.">
				            <span class="input-group-addon" style="padding-left: 3em;">작성자</span> <input
				                  class="qna-writer" id="community_writer" name="community_writer" value="${user_login_id}"
				                  style="width: 35%" readonly="readonly">
					</div>
				   </div>
					
				   <div class="form-group"> 
					<div class='com-qna-content'>
						<label for="community_contents">글 내용</label><br>
				        <textarea name="community_contents" style="width: 700px;" rows="6" class="form-ta" id="good"></textarea>
					</div>
				   </div>
				   
				   <div class="form-group">
					<div class='com-inline-btn'>
						<input type="submit" class='register-qna' id="registBtn" value='글등록'>
						<input type="button" class='register-qna' id="cancelBtn" value='취소'>
					</div>
				   </div>	
				</form>
				</div>
				
			</div><!-- section_main1 -->
			
		</div><!-- column-left -->
		
		<<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<div id="rightDiv" class='column-right'>
				<div id="login_beforeDiv">
					<%@ include file="../login_before_new.jsp"%>
				</div>
				<div id="login_afterDiv" style="display: none">
					<%@ include file="../login_after_new.jsp"%>
				</div>
			</div>
			<!-- column-right -->
		</div>
		<!-- modal 코드 --> 
       <%@ include file="../user_modals_new.jsp" %>
       </div>
 <script type="text/javascript">
$(function(){
	$('#registBtn').on("click", function(){
		self.location="${initParam.rootPath }/user/community/list"
	});
	$('#cancelBtn').on("click", function(){
		self.location="${initParam.rootPath }/user/community/list"
	});
});
</script>
</body>
</html>
