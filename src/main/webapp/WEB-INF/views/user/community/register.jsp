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
			<div class='section-board-register'>
				<div class='title-wrapper'>
					<div class='column-title'>커뮤니티 글작성</div>
				</div>
				<div class='board-register-wrapper'>
				<div class="board-register-box">
					<form method="post">
					   <div class="board-register-top">
							<div class='board-register-top-input'>
									<label>제목</label>
									<input class="" id="community_title" name="community_title" type="text"
						                   placeholder="제목을 입력하세요.">
							</div>
							<div class='board-register-top-input'>
						            <label>작성자</label>
						            <input class="board-register-top-input" id="community_writer" name="community_writer" type="text" value="${user_login_id}"
						                  readonly="readonly" style="border:none;">
							</div>
					   </div>
						
						<div class='board-register-write'>
							<div class='board-register-write-box'>
							<label class="" for="community_contents">글 내용</label><br>
					        <textarea name="community_contents" class="ta" id="good"></textarea>
					        </div>
						</div>
				   
				   		<div class="board-register-button">
						<div class='board-register-button-box' align="center">
							<input type="submit" class='register-bottom-button' id="registBtn" value='글등록'>
							<input type="button" class='register-bottom-button' id="cancelBtn" value='취소'>
						</div>
						</div>
	
					</form>
				</div>
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
