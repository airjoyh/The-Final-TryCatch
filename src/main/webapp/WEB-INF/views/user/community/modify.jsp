<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 글수정</title>
<link href="${initParam.rootPath }/resources/css/community_read_sw.css" rel="stylesheet" type="text/css">
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
			<div class='com-contest-head'>
				<div class='title-wrapper'>
					<div class='column-title'>커뮤니티 글수정</div>
				</div>
			   <form action="modify" name="modifyForm" method="post"> 
				<div class='wrapper'>
					<div class='com-qna-title'>
							<div class="row" hidden="" >
						        <div class="input-group">
						           <!--  <span class="input-group-addon">글번호</span> <input
						            	  class="form-control" id="title" name="title" type="text"
						                  style="width: 35%" placeholder="글번호 자동입력." readonly="readonly">
						            <span class="input-group-addon" style="padding-left: 3em;">작성일</span> <input
						                  class="form-control" id="writer" name="writer"
						                  style="width: 35%" placeholder="yy-mm-dd hh-MM-ss"> -->
						            <input id="community_no" name="community_no" value="${community.community_no} ">
	                                <input id="community_writer" name="community_writer" value="${user_login_id }"> <%-- ekwjd72@naver.com"> --%>
	                                <input name='page' value="${cri.page}"> 
	                                <input name='perPageNum' value="${cri.perPageNum}">
 	                                <input name='searchType' value="${cri.searchType}">
	                                <input name='keyword' value="${cri.keyword}">
						        </div>
						    </div>
						<div class="community-title-box">
							<div class="ct-box">
								<label class="ct-box-label">제목 </label> 
								<input class="qna-title" id="community_title" name="community_title" type="text" value="${community.community_title}">
				            </div>
				            <div class="ct-box">
					            <label class="ct-box-label">작성자</label> 
					            <p class="qna-writer" id="community_writer" name="community_writer">${community.community_writer}</p>
				            </div>
				        </div>
					</div>
					<div class='com-qna-content'>
						<label for="good">커뮤니티내용</label><br>
				        <textarea name="community_contents" style="width: 680px;" rows="10" class="form-ta" id="community_contents">${community.community_contents }</textarea>
					</div>
					<div class='com-inline-btn'>
						<input type="submit" class='inline-btn' id="regist" onclick="validateCheck()" value='글 등록'>
						<input type="button" class='inline-btn' id="cancel" value='취소'>
					</div>
					
					</div>
				</form>	
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
		self.location="${initParam.rootPath }/user/contest/qna/read?page=${cri.page }"
				+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
				+"&keyword=${cri.keyword }&contest_id=${param.contest_id}&qna_no=${param.qna_no}";
	});
});
</script>
</body>
</html>
