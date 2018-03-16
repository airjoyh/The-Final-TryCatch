<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>받은쪽지 상세정보</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/mail_read_sw.css" rel="stylesheet" type="text/css">

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>	

 	<!-- nav-area -->
	<%@ include file="../../company-nav_new.jsp" %>

	<div class='container'>
		<!-- left section!!************************************************************** -->
		<div class='column-left'>
			<div class="section_main">
	
				<div class='title-wrapper'>
					<div class='column-title'>쪽지 상세보기</div>
				</div>
				<div class='wrapper'>
					<div class='com-qna-title'>
						<div>
							<span>보낸 기업</span>
							<p>${note.note_sender}</p>
							<br> <span>받은 사람</span>
							<p>${note.note_receiver}</p>
						</div>
					</div>
					<div class='com-qna-content'>
						<label for="good">쪽지내용</label><br>
						<p class="note-content"
							style="border: 1px solid #f1f1f1; height: 200px;" id="good">${note.note_contents}
						</p>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='qna-list' id="goList" value='목록보기'>
						<a href="#sendMail"><input type="button" class='qna-list'
							value='답장'></a> <input type="button" class='qna-list'
							id="deleteList" value='삭제' onclick="removeReview()">
						<!-- <input type="button" class='qna-modify' value='수정'>
						<input type="button" class='qna-delete' value='삭제'> -->
					</div>

				</div>
			
			</div>
			<!-- section_main -->
		</div>
		<!-- column-left -->

		<!-- right section!!************************************************************** -->
		<div id="rigthDiv" class="column-right">
			<div id="login_beforeDiv">
				<%@ include file="../com_login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../com_login_after_new.jsp"%>
			</div>
		</div>
		<!-- modal import -->
		<%@ include file="../company_modal_new.jsp"%>
	</div>

	<!-- mail 모달	 -->
		<div class="modal" id="sendMail">
			<div class="modal-pannel">
				<div class="modal-title">쪽지 답장 <a href="#close">CLOSE</a></div>
				<div class="modal-body">  
					<h4>보낸 기업 아이디</h4><p><input type="text" id="note_sender" value="${company_login_member_id}"  
					    class="form-control" style="width: 90%; height: 15px;"></p>
					<h4>받는 구직자 아이디</h4><p><input type="text" id="note_receiver" value="${note.note_sender}"
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
		self.location="${initParam.rootPath }/company/note/list"
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
			url:'${initParam.rootPath}/user/note/register',
			data:{"note_contents":note_contents,"note_sender":note_sender, "note_receiver":note_receiver},
			success:function(result){
				console.log("result: " + result);
				if(result == 'success'){
					alert("등록 되었습니다.");
					
				}
		}}); 
	  $("#note_contents").val("");
});

function removeReview(){
	
	if(confirm('정말로 삭제하시겠습니까?')){
		self.location="${initParam.rootPath }/company/note/remove?page=${cri.page }"
		+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
		+"&keyword=${cri.keyword }&note_receiver=${param.note_receiver}&note_id=${note.note_id }";
	}
}

</script>
</body>
</html>
