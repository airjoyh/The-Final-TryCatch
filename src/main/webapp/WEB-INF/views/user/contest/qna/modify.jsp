<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 Q&A 글수정</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/contest_qna_register.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/community_register_sw.css" rel="stylesheet" type="text/css">
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
	console.log('수정 버튼 클릭');
	var f = document.modifyForm;
	if($('input[name=qna_title]').val()==''){
		alert('제목을 입력하세요.');
		f.qna_title.focus();
	
	}else if($('textarea[name=qna_contents]').val()==''){
		alert('내용을 입력하세요.');
		f.qna_contents.focus();
		
	}else{
		document.modifyForm.submit();
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
			<div class='section-board-registe'>
                      <div class='title-wrapper'>
                           <div class='column-title'>콘테스트 Q&A 글수정</div>
                      </div>
                <div class='board-register-wrapper'>
                <div class="board-register-box">
                      
			   <form action="modify" name="modifyForm" method="post"> 
				
					
							<div hidden="" >
						        <div class="input-group">
						           <!--  <span class="input-group-addon">글번호</span> <input
						            	  class="form-control" id="title" name="title" type="text"
						                  style="width: 35%" placeholder="글번호 자동입력." readonly="readonly">
						            <span class="input-group-addon" style="padding-left: 3em;">작성일</span> <input
						                  class="form-control" id="writer" name="writer"
						                  style="width: 35%" placeholder="yy-mm-dd hh-MM-ss"> -->
						            <input id="qna_no" name="qna_no" value="${contest_qna.qna_no} ">
	                                <input id="qna_writer" name="qna_writer" value="${user_login_id }"> <%-- ekwjd72@naver.com"> --%>
                                    <input id="contest_id" name="contest_id" value="${param.contest_id }">
	                                <input name='page' value="${cri.page}"> 
	                                <input name='perPageNum' value="${cri.perPageNum}">
 	                                <input name='searchType' value="${cri.searchType}">
	                                <input name='keyword' value="${cri.keyword}">
						        </div>
						    </div>
						    
						    <div class="board-register-top">
							 <div class='board-register-top-input'>
								<label>제목</label>
								<input class="" id="qna_title" name="qna_title" type="text"
					                  value="${contest_qna.qna_title }">
							</div>
							<div class='board-register-top-input'>
						          <label>작성자</label>
						          <input class="" id="qna_writer" name="qna_writer"  type="text"
						        	readonly="readonly" value="${contest_qna.qna_writer }" style="border:none;">
					       	 </div>
					   		</div>
						    
						    
							<%-- <span class="input-group-addon" >제목</span>&nbsp;&nbsp;&nbsp; <input
				                  class="qna-title" id="qna_title" name="qna_title" type="text"
				                  style="width: 35%" placeholder="제목을 입력하세요." value="${contest_qna.qna_title }">
				            <span class="input-group-addon" style="padding-left: 3em;">작성자</span> <input
				                  class="qna-writer" id="qna_writer" name="qna_writer" readonly="readonly"
				                  value="${contest_qna.qna_writer }" style="border:none;"> --%>
					
					<div class='board-register-write'>
						<div class='board-register-write-box'>
						<label for="">내용</label><br>
				        <textarea name="qna_contents" class="form-ta" id="qna_contents">${contest_qna.qna_contents }</textarea>
					</div>
					</div>
					
					<div class="board-register-button">
					<div class='board-register-button-box' align="center">
						<input type="button" class='register-bottom-button' id="regist" onclick="validateCheck()" value='글 등록'>
						<input type="button" class='register-bottom-button' id="cancel" value='취소'>
					</div>
					</div>
					
				</form>	
				</div>
			</div><!-- section_main1 -->
			</div>
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
	$('#cancel').on("click", function(){
		self.location="${initParam.rootPath }/user/contest/qna/read?page=${cri.page }"
				+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
				+"&keyword=${cri.keyword }&contest_id=${param.contest_id}&qna_no=${param.qna_no}";
	});
});
</script>
</body>
</html>
