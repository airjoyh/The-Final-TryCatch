v<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 글수정</title>
<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/community_register_sw.css" rel="stylesheet" type="text/css">
<!-- 임시 js -->

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
			<div class='section-board-register'>
				<div class='title-wrapper'>
					<div class='column-title'>커뮤니티 글수정</div>
				</div>
				<div class='board-register-wrapper'>
				<div class="board-register-box">
			   <form action="modify" name="modifyForm" method="post"> 
				

						<div hidden="">
						        <div class="input-group">
	                                <input id="community_no" name="community_no" value="${community.community_no} ">
	                                <input id="community_writer" name="community_writer" value="${user_login_id }">
	                                <input name='page' value="${cri.page}"> 
	                                <input name='perPageNum' value="${cri.perPageNum}">
 	                                <input name='searchType' value="${cri.searchType}">
	                                <input name='keyword' value="${cri.keyword}">
						        </div>
					    </div>
					    
					   <div class="board-register-top">
							<div class='board-register-top-input'>
								<label>제목</label>
								<input class="" id="community_title" name="community_title" type="text"
					                  value="${community.community_title }">
							</div>
							<div class='board-register-top-input'>
						          <label>작성자</label>
						          <input class="" id="community_writer" name="community_writer"  type="text"
						        	readonly="readonly" value="${community.community_writer}" style="border:none;">
					        </div>
					   </div>

					<div class='board-register-write'>
						<div class='board-register-write-box'>
							<label class="" for="community_contents">글 내용</label><br>
				        <textarea name="community_contents" class="modta" id="community_contents">${community.community_contents }</textarea>
					 	</div>
					</div>
					
					<div class="board-register-button">
					<div class='board-register-button-box' align="center">
						<input type="submit" class='register-bottom-button' id="regist" onclick="validateCheck()" value='글 수정'>
						<input type="button" class='register-bottom-button' id="cancel" value='취소'>
					</div>
					</div>
					
				
				</form>	
				</div>
				</div>
				
			</div><!-- section_main1 -->
			
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
				
		</div><!-- column-right -->
			
	<!-- frame -->
<script type="text/javascript">

function validateCheck() {
	console.log('수정 버튼 클릭');
	var f = document.modifyForm;
	if($('input[name=community_title]').val()==''){
		alert('제목을 입력하세요.');
		f.community_title.focus();
	
	}else if($('textarea[name=community_contents]').val()==''){
		alert('Q&A을 입력하세요.');
		f.community_contents.focus();
		
	}else{
		document.modifyForm.submit();
	}
}
</script>
<script type="text/javascript">
$(function(){
	$('#cancel').on("click", function(){
		self.location="${initParam.rootPath }/user/community/list?page=${cri.page }"
			+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
			+"&keyword=${cri.keyword }&community_no=${community.community_no }";
	});
});
</script>
</body>
</html>
