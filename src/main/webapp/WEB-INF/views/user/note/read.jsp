<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>받은쪽지 상세정보</title>

<link href="${initParam.rootPath }/resources/css/mail_read_sw.css" rel="stylesheet" type="text/css">

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
			<div class="section_noteread">
			
				<div class='title-wrapper'>
					<div class='column-title'>쪽지 상세보기</div>
				</div>
				
				<div class='wrapper'>
				
					<div class='note-title'>
						<div class="note-title-box">
							<label>보낸 기업</label>
							<span>${note.note_sender}</span>
						</div>
						<div class="note-title-box">
							<label>받은 사람</label>
							<span>${note.note_receiver}</span>
						</div>
					</div>
					
					<div class='note-content'>
						<label for="good">쪽지내용</label><br>
						<p class="note-content"
							style="border: 1px solid #f1f1f1; height: 200px;" id="good">${note.note_contents}
						</p>
					</div>
					
					<div class='note-btn'align="center">
						<input type="button" class='qna-list' id="goList" value='목록보기'>
						<a href="#sendMail"><input type="button" class='qna-list'value='답장'></a> 
						<input type="button" class='qna-list' id="deleteList" value='삭제' onclick="removeReview()">
						
					</div>

				</div>

			</div>
			<!-- section_noteread -->

		</div>
		<!-- column-left -->
		<!-- right section!!************************************************************** -->
		<div id="rigthDiv" class="column-right">
			<div id="login_beforeDiv">
				<%@ include file="../login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../login_after_new.jsp"%>
			</div>
		</div>
				<!-- modal import -->
		<%@ include file="../user_modals_new.jsp" %>
	</div>
	<!-- frame -->
	
		<!-- mail 모달	 -->
		<div class="modal" id="sendMail">
			<div class="notemodal-pannel">
				<div class="notemodal-title">쪽지 답장 <a href="#close">CLOSE</a></div>
				
				<div class="notemodal-body">  
				<label>보낸 구직자 아이디</label>
				<p>
					<input type="text" id="note_sender" value="${user_login_id}"
						class="form-control" style="width: 100%; height: 15px;">
				</p>
				<label>받는 기업 아이디</label>
				<p>
					<input type="text" id="note_receiver" value="${note.note_sender}"
						class="form-control" style="width: 100%; height: 15px;">
				</p>								
					<textarea placeholder="답장 내용을 입력하세요" class="notemodal-ta" id="note_contents"></textarea>
				</div>
					
				<div class="notemodal-footer">
					<input type="button" name="replyConfirm" id="noteModBtn" value="전송">
				</div>
			</div>
		</div>
	<!-- frame -->

<script type="text/javascript">
$(function(){
	//안읽은 쪽지수 변경
	var before_status = '${before_status}';
	console.log('before_status='+before_status);
	if(before_status == 'N'){
		var note_cnt = $('#note-cnt').text(); // note-cnt="7"
		var cnt = parseInt(note_cnt)-1;
		console.log('변경cnt='+cnt);
		$('#note-cnt').text(cnt+'');
	}
	
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
					//self.location = '${initParam.rootPath}/company/note/read';
					$('#sendMail').fadeOut();
				
				}
		}}); 
});

function removeReview(){
		
		if(confirm('정말로 삭제하시겠습니까?')){
			self.location="${initParam.rootPath }/user/note/remove?page=${cri.page }"
			+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
			+"&keyword=${cri.keyword }&note_receiver=${param.note_receiver}&note_id=${note.note_id }";
		}
	}

</script>
</body>
</html>
