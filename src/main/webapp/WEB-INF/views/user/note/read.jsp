<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>받은쪽지 상세정보</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/mail_read_sw.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>

<!-- 임시 js -->
<script type="text/javascript">
	
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
					<div class='column-title'>쪽지 상세보기</div>
				</div>
				<div class='wrapper'>
					<div class='com-qna-title'>
						<div>
							<span>보낸 기업</span>
							<p>${note.note_sender}</p>
							<br>
							<span>받은 사람</span>
							<p>${note.note_receiver}</p>
						</div>
					</div>
					<div class='com-qna-content'>
						<label for="good">쪽지내용</label><br>
				        <p rows="10" class="note-content" style="border: 1px solid #f1f1f1; height: 200px;" id="good">${note.note_contents} </p>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='qna-list' id="goList" value='목록보기'>
						<a href="#sendMail"><input type="button" class='qna-list' value='답장'></a>
						<!-- <input type="button" class='qna-modify' value='수정'>
						<input type="button" class='qna-delete' value='삭제'> -->
					</div>
					
					</div>
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
					<input 7id="member_id" name="member_id" 
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
		
		<!-- mail 모달	 -->
		<div class="modal" id="sendMail">
			<div class="modal-pannel">
				<div class="modal-title">쪽지 답장 <a href="#close">CLOSE</a></div>
				<div class="modal-body">   
					<h4>보낸 구직자 아이디</h4><p><input type="text" id="note_sender" value="${user_login_id}"  
					    class="form-control" style="width: 90%; height: 15px;"></p>
					<h4>받는 기업 아이디</h4><p><input type="text" id="note_receiver" value="${note.note_sender}"
					 class="form-control" style="width: 90%; height: 15px;"></p>
					<textarea rows="4" cols="78px" placeholder="답장 내용을 입력" style="margin-top: 5px;" id="note_contents"></textarea>
				</div>
					
				<div class="modal-footer" style="display: inline-flex; flex-direction: row; width: 100%;">
					<input type="button" name="replyConfirm" id="noteModBtn" value="전송">
					</div>
			</div>
		</div>
	<!-- frame -->

<script type="text/javascript">
$(function(){
	$('#goList').on("click", function(){
		self.location="${initParam.rootPath }/user/note/list"
	});
	
});

</script>
<script type="text/javascript">

$("#noteModBtn").on("click", function() {
	
    var note_contents = $("#note_contents").val();
    var note_sender= $('#note_sender').val();
    var note_receiver= $('#note_receiver').val(); 
    
	  $.ajax({
			type:'post',
			url:'${initParam.rootPath}/company/note/register',
			data:{"note_contents":note_contents,"note_sender":note_sender, "note_receiver":note_receiver},
			success:function(result){
				console.log("result: " + result);
				if(result == 'success'){
					alert("등록 되었습니다.");
					//$("#tcmail").modal('hide');
				}
		}}); 
});

</script>
</body>
</html>
