<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 Q&A 글등록</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contest_qna_register.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>

<!-- 임시 js -->
<script type="text/javascript">

function validateCheck() {
	var f = document.registerForm;
	
	if ($('form[name=registerForm] input[name=qna_title]').val() == '') {
		alert('제목을 입력하세요.');
		f.qna_title.focus();

	} else if ($('form[name=registerForm] textarea[name=qna_contents]').val() == '') {
		alert('기업의 장점을 입력하세요.');
		f.qna_contents.focus();
	} else {
		document.registerForm.submit();
	}
}

</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>	
	<!-- nav-area -->
  	<%@ include file="../../../user-nav_new.jsp" %>
  
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>	
			<div class='com-contest-head'>
				<div class='title-wrapper'>
					<div class='column-title'>콘테스트 Q&A 글작성</div>
				</div>
			<form action="register" name="registerForm" method="post">
				<div class='wrapper'>
					<div class='com-qna-title'>
							<div class="row" hidden="" >
		                        <input id="contest_id" name="contest_id" value="${param.contest_id }" type="hidden">
						    </div>
							<span class="input-group-addon">제목</span>&nbsp;&nbsp;&nbsp; <input
				                  class="qna-title" id="qna_title" name="qna_title" type="text"
				                  style="width: 35%" placeholder="제목을 입력하세요.">
				            <span class="input-group-addon" style="padding-left: 3em;">작성자</span> <input
				                  class="qna-writer" id="qna_writer" name="qna_writer"
				                  style="width: 35%" readonly="readonly" value="${user_login_id }">
					</div>
					<div class='com-qna-content'>
						<label for="content">Q&A</label><br>
				        <textarea name="qna_contents" style="width: 700px;" rows="6" class="form-ta" id="qna_contents"></textarea>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='register-qna' id="regist" onclick="validateCheck()" value='글 등록'>
						<input type="button" class='register-qna' id="cancel" value='취소'>
					</div>
				</div>
				</form>
			</div><!-- section_main1 -->
			
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<div id="rightDiv" class='column-right'>
				<div id="login_beforeDiv">
					<%@ include file="../../../user/login_before_new.jsp"%>
				</div>
				<div id="login_afterDiv" style="display: none">
					<%@ include file="../../login_after_new.jsp"%>
				</div>
			</div>
			<!-- column-right -->
		</div>
		<!-- modal 코드 --> 
       <%@ include file="../../user_modals_new.jsp" %>
			
	</div>
	<!-- container -->

<script type="text/javascript">
$(function(){
/* 	$('#regist').on("click", function(){
		self.location="${initParam.rootPath }/conread"
	}); */
	$('#cancel').on("click", function(){
		self.location="${initParam.rootPath }/user/contest/qna/list?contest_id=${param.contest_id}";
	});
});
</script>
</body>
</html>
