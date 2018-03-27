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
			<div class='section_communityregister'>
				<div class='title-wrapper'>
					<div class='column-title'>커뮤니티 글작성</div>
				</div>
				<div class='community_wrapper'>
					<form method="post">
					   <div class="community-readtitle">
							<div class='readtitle'>
									<span class="title-label">제목</span>&nbsp;&nbsp;&nbsp; 
									<input class="community-box" id="community_title" name="community_title" type="text"
						                   placeholder="제목을 입력하세요.">
							</div>
							<div class='readtitle'>
						            <span class="title-label">작성자</span>&nbsp;&nbsp; 
						            <input class="community-box" id="community_writer" name="community_writer" value="${user_login_id}"
						                  readonly="readonly">
							</div>
					   </div>
						
						<div class='community-register'>
							<label class="title-label" for="community_contents">글 내용</label><br>
					        <textarea name="community_contents" class="ta" id="good"></textarea>
					        
						</div>
				   
						<div class='community-btn' align="center">
							<input type="submit" class='register-qna' id="registBtn" value='글등록'>
							<input type="button" class='register-qna' id="cancelBtn" value='취소'>
						</div>
	
					</form>
				</div>
				
			</div><!-- section_communityregister -->
			
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
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
