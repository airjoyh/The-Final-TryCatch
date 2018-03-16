<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 글수정</title>
<link href="${initParam.rootPath }/resources/css/community_read_sw.css" rel="stylesheet" type="text/css">
<!-- 임시 js -->
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
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>	
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
		
			<div class="section_login">
				<div class="wrapper">
				    <div><input class='login-input' type="email" name="email" placeholder="이메일"></div>
				    <div><input class='login-input' type="password" name="password" placeholder="비밀번호"></div>
				    <div><input type="button" value="로그인" class='login-btn'> </div>
				    <span class="pure-checkbox" style="float: left;">
                  	  <input id="checkboxtoggle" name="checkbox" type="checkbox">
                      <label for="checkboxtoggle">정보기억</label>
                      </span>
                    <span style="float: right;padding: 2px 0 0 6px;">
                	  <a href='#find-pwd'>비밀번호 찾기</a>
                	  </span>
                    <span style="float: right;padding: 2px 6px;">
                	  <a href='#register'>회원가입</a>
                	  </span>
				  </div>
				</div><!-- section_login -->
				
				<div class="section_zzim">
					<div class="title-wrapper">
						<div class='column-title'>관심기업 리스트</div>
					</div>
					<div class='wrapper'>
						<div class='column-contents'>
							<i>현재 찜한 기업이 없습니다.</i><!-- 있으면 테이블 없으면 i -->
							<table class='zzim-table'>
								<thead>
									<tr>
										<th>기업명</th>
										<th>평점</th>
										</tr>
									</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										</tr>
									</tbody>
								
							</table>
						</div>
					</div>
						
						
						
				</div><!-- section_zzim -->
				
			</div><!-- column-right -->
			
			
			
		<!-- modal 코드 -->
		
		<!-- 회원가입 모달 -->
		<div class="modal" id="register">
			<div class="modal-pannel">
				<div class="modal-title">회원가입 <a href="#close">CLOSE</a></div>
				<div class="modal-body">
					<input id="member_id" name="member_id" 
				       	type="email" placeholder="이메일을 입력하세요">
					<input id="member_pass" name="member_pass"
					   	type="password" placeholder="비밀번호를 입력하세요">
					<input id="member_pass" name="member_pass"
					   	type="password" placeholder="비밀번호 확인" style="float: right;">
					<input id="user_authCode" name="user_authCode"
					  	type="text" placeholder="60초 안에 인증코드를 입력해주세요" size="20">
					<input type="button" name="sendEmail" id="sendEmail"
				       	value="인증코드 요청">
					</div>
					
				<div class="modal-footer">
					<input type="button" name="emailConfirm" id="emailConfirm"
				       	value="완료">
					</div>
				</div>
			</div>
			
		<!-- 비밀번호 찾기 모달 -->	
		<div class="modal" id="find-pwd">
		<div class="modal-pannel">
				<div class="modal-title">회원가입 <a href="#close">CLOSE</a></div>
				<div class="modal-body">
					<input id="member_id" name="member_id" 
				       	type="email" placeholder="이메일을 입력하세요">
					<i>*가입하신 이메일로 임시 비밀번호가 전송됩니다.</i>
					</div>
					
				<div class="modal-footer">
					<input type="button" name="emailConfirm" id="emailConfirm"
				       	value="완료">
					</div>
				</div>
			</div>
		</div>

	<!-- frame -->

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
