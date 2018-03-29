<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- C태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 Q&A 상세정보</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contest_qna_read.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/community_read_sw.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/reply.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!--  CSS -->
<link href="${initParam.rootPath }/resources/css/reply.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/community_read.css" rel="stylesheet" type="text/css">

<!-- 임시 js -->
<script type="text/javascript">
	
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
			<div class='section-board-read'>
				<div class='title-wrapper'>
					<div class='column-title'>콘테스트 Q&A 글상세보기</div>
				</div>
				<div class='wrapper'>
					   <form id="readForm" name="readForm" method="POST">
	  	 		          <input type="hidden" id="qna_no" name="qna_no" value="${contest_qna.qna_no }">
	  	 		          <input type="hidden" id="qna_writer" name="qna_writer" value="${contest_qna.qna_writer }"> 
	  	 		          <input type="hidden" id="contest_id" name="contest_id" value="${param.contest_id }">
	  	 		          <input type='hidden' name='page' value="${cri.page}"> 
	  	 		          <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				          <input type='hidden' name='searchType' value="${cri.searchType}">
				          <input type='hidden' name='keyword' value="${cri.keyword}">
			          </form>
					<div class='board-read-top'>	
						<div class='board-read-title'>
								<div class="title-title" id="title" name="title">${contest_qna.qna_title }</div>
							</div>  
							
						<div class='board-read-datas'>
							<div class='board-read-data'>
						        <label>작성자</label>&nbsp;&nbsp;
						        <div class="board-read-data-content" id="community_writer" name="community_writer" 
						        	 readonly="readonly" >${contest_qna.qna_writer }</div>
							</div>
							<div class='board-read-data'>
						        <label>조회수</label> 
						        <div class="board-read-data-content" id="community_viewCount" name="community_viewCount" readonly="readonly" >${contest_qna.qna_wdate}</div>
							</div>
						</div>
							<%-- <div class="board-read-date">${community.community_wdate} 시간</div> --%>
							<%-- </div>	
							
							       
						<div>
							<span class="input-group-addon">글번호</span> 
							<input class="form-control" id="qna_no" name="qna_no" type="text" style="width: 35%" placeholder="글번호 자동입력." 
							       value="${contest_qna.qna_no }" readonly="readonly">
						   
						    <span class="input-group-addon" style="padding-left: 3em;">작성일</span> &nbsp;&nbsp;&nbsp; 
						    <input class="form-control" id="qna_wdate" name="qna_wdate" style="width: 35%" placeholder="yy-mm-dd hh-MM-ss"
						           value="${contest_qna.qna_wdate}" readonly="readonly">
						</div>
						<div>
							<span class="input-group-addon">제목</span>&nbsp;&nbsp;&nbsp; 
							<input class="qna-title" id="qna_title" name="qna_title" type="text" style="width: 35%" placeholder="제목을 입력하세요."
							       value="${contest_qna.qna_title }" readonly="readonly">
				            
				            <span class="input-group-addon" style="padding-left: 3em;">작성자</span> &nbsp;&nbsp;&nbsp; 
				            <span class="qna-writer" id="qna_writer" name="qna_writer" style="width: 35%" placeholder="작성자를 입력하세요."
				                   value="" readonly="readonly">${contest_qna.qna_writer }</a></span>
				         
				        </div> --%>
					
					
					</div>
					
						<div class='board-read-contents'>
						   <div class="form-group">	
					        <div class="board-read-content" id="good">${contest_qna.qna_contents }</div>
						   </div>
						</div>
					
						<div class='board-read-buttons' align="center">
							<input type="button" class='board-read-button-toList' id="goListBtn" name="goListBtn" value='목록보기'>
	                      	<div class="board-read-button-myBtns">
							  <span id="upDel" class=""></span>
					        </div>
						</div>
					
					
					</div>
			</div><!-- section_main1 -->
			<div class='section-board-reply'>
				<div class="row">
					<div class="reply-container">
						<div class="box">
							<div class="box-header">REPLY</div>
							
							<c:if test="${not empty user_login_id }">
							<div class="reply-content">
									<div class="reply-writecontent">
										<div class="reply-content-writer">
											<label>작성자</label> 
											<input class="reply-writer" type="text" id="newReplyWriter" value="${user_login_id }" readonly> 
											</div>
										</div>
									<div class="reply-writecontent">
										<div class="reply-content-contents">
											<textarea name="reply-content" id="newReplyText"
											class="content" placeholder="댓글을 입력하세요"
											style="overflow: hidden; height: 50px; word-wrap: break-word; width: 100%; border: 1px solid lightgray; resize: none; margin-top: 5px;"></textarea>
										</div>
									</div>
									</div>
									<!-- <label for="exampleInputEmail1">댓글</label> 
									<input class="form-control" type="text" id="newReplyText">
			
							</div> 이전부분-->
							<!-- /.box-body -->
							<div class="reply-writecontent">
										<div class="reply-content-button">
 											<input type="button" id="replyBtn" value="댓글 등록">
<!-- 										<button type="submit" class="reply-btn" id="replyAddBtn">등록</button> -->
										</div>
									</div>
							<!-- <div class="box-footer">
								<button type="button" id="replyBtn">댓글 등록</button>
								timeline time label
							</div> -->
							</c:if>
							
							<c:if test="${empty user_login_id }">
								<div class="box-body">
									<div><a id="goLogin">Login Please</a></div>
								</div>
							</c:if>
						</div>
			

							<!-- The time line -->
							<ul class="timeline" style="display: inline-flex; flex-direction: column;">
								<!-- timeline time label -->
								 <li class="time-label" id="repliesDiv"></li> 
							</ul>
						
							<div class='text-center' style="align-content: center;">
								<ul id="pagination" style="display: flex; flex-direction: row;" class="pagination pagination-sm">
				
								</ul>
							</div>

					</div>
						<!-- 댓글 수정 모달	 -->
				<div class="modal" id="modifyModal">
					<div class="modal-pannel">
						<div class="modal-Title" style="font-size: 20px; font-weight: bold;">
						댓글수정 
						<a href="#close">CLOSE</a>
						</div>
						<div class="modal-body">
							<h4 class="modal_title"></h4>
							<p>
								<input type="text" id="replytext" class="form-control"
									style="width: 90%;">
							</p>
						</div>

						<div class="modal-footer"
							style="display: inline-flex; flex-direction: row; width: 100%;">
							<input type="button" name="replyConfirm" id="replyModBtn"
								value="수정"> <input type="button" name="replyDelete"
								id="replyDelBtn" value="삭제">
						</div>
					</div>
				</div>
					<!-- /.col -->
				</div>
			</div><!-- section_qnareply -->
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

			
		<!-- mail 모달	 -->
		<div class="modal" id="tcmail">
			<div class="modal-pannel">
				<div class="modal-title">쪽지보내기 <a href="#close">CLOSE</a></div>
				<div class="modal-body">
					<h4>보낸 기업 아이디</h4><p><input type="text" id="note_sender" value="${company_login_member_id}" class="form-control" style="width: 90%; height: 15px;"></p>
					<h4>받는 구직자 아이디</h4><p><input type="text" id="note_receiver" value="${contest_qna.qna_writer}" class="form-control" style="width: 90%; height: 15px;"></p>
					<textarea rows="4" cols="78px" placeholder="내용을 입력하시오" style="margin-top: 5px;" id="note_contents"></textarea>
				</div>
					
				<div class="modal-footer" style="display: inline-flex; flex-direction: row; width: 100%;">
					<input type="button" name="noteConfirm" id="noteModBtn" value="전송">
					<!-- <input type="button" name="replyDelete" id="replyDelBtn" value="취소"> -->
					</div>
			</div>
		</div>
		

	<!-- frame -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-reply_no={{reply_no}} data-reply_writer={{reply_writer}}>
<div class="time_comment_box">
		<div class="time_area">
			<div class="time_info">
				<p><b>글번호</b>&nbsp;:&nbsp;{{reply_no}}&nbsp;&nbsp;<b>작성자</b>&nbsp;:&nbsp;{{reply_writer}} </p>
			</div>
			<div class="time_tool">
				 <span><a href="#modifyModal">Modify</a>&nbsp;&nbsp;</span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;{{prettifyDate reply_wdate}}
			</div>
		</div>
		<div class="timeline-body"><pre>{{reply_contents}}</pre></div>
</div>
</li>
{{/each}}
</script>

<script>

	 Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	 
	 Handlebars.registerHelper("eqReply_writer", function(reply_writer,block){
			var accum = '';
			//alert(reply_writer);
			if(reply_writer == '${company_login_member_id }'){
				accum += block.fn();
			}
			return accum;
		});
	
	var printData = function(replyArr, target, templateObject) {
	
		var template = Handlebars.compile(templateObject.html());
	
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	
	}
	
	var qna_no = ${contest_qna.qna_no};
	
	var replyPage = 1;
	
	function getPage(pageInfo) {
	
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
	
			//$("#modifyModal").modal('toggle');
	
		});
	}
	
	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};
	
	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		//getPage("${initParam.rootPath}/review/reply/"+review_no+"/"+replyPage);
		getPage("${initParam.rootPath}/review/qna_reply/"+qna_no+"/"+replyPage);
		
	});
	
	//댓글버튼을 눌렀을때 댓글목록이 보여지는 부분
	
	$(function(){
		$('#replyBtn').on('click',function(){
			$(this).next().slideToggle("500").siblings('.reply-time').slideUp();
		});
	});
	
	$("#replyBtn").on("click",function(){
		 //alert('댓글 등록')
		 console.log("댓글 등록 클릭");
		 var replyerObj = $("#newReplyWriter");
		 var reply_writer=replyerObj.val();
		 var replytextObj = $("#newReplyText");
		 var reply_contents = replytextObj.val();
	     var qna_no = $("#qna_no");
		 var member_id = '${company_login_member_id }';
	     
		  $.ajax({
				type:'post',
				url:'${initParam.rootPath}/review/qna_reply/',
				data:{"reply_writer":reply_writer,"qna_no":qna_no.val(),"reply_contents":reply_contents, "member_id":member_id},
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("${initParam.rootPath}/review/qna_reply/"+qna_no.val()+"/"+replyPage );
						//replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});
	
	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		console.log(">>>"+reply.find('.timeline-body').text()+"<<<");
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal_title").html(reply.attr("data-reply_no"));
		
	});
	
	
	
	$("#replyModBtn").on("click",function(){
		console.log('댓글 수정 버튼 클릭');
		  
		  var reply_no = $(".modal_title").html();
		  var reply_contents = $("#replytext").val();
		  
		  console.log("수정할 번호:"+reply_no+", 수정할 내용:"+ reply_contents);
		  
		  $.ajax({
				type:'put',
				url:'${initParam.rootPath}/review/qna_reply/'+reply_no,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({reply_contents:reply_contents}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("수정 되었습니다.");
						getPage("${initParam.rootPath}/review/qna_reply/"+qna_no+"/"+replyPage );
						reply_contents.val("");	
						
						$("#modifyModal").fadeOut();
						self.location = "${initParam.rootPath }/user/contest/qna/read?page=${cri.page }"
							+ "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
							+ "&keyword=${cri.keyword }&contest_id=${param.contest_id}&qna_no=${contest_qna.qna_no }";
					}
			}});
	});
	
	
	$("#replyDelBtn").on("click",function(){
		  console.log('댓글 삭제 버튼 클릭');
		  var reply_no = $(".modal_title").html();
		  var reply_contents = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'${initParam.rootPath}/review/qna_reply/'+reply_no,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("삭제 되었습니다.");
						getPage("${initParam.rootPath}/review/qna_reply/"+qna_no+"/"+replyPage );
						
						$("#modifyModal").fadeOut();
						self.location = "${initParam.rootPath }/user/contest/qna/read?page=${cri.page }"
							+ "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
							+ "&keyword=${cri.keyword }&contest_id=${param.contest_id}&qna_no=${contest_qna.qna_no }";
					}
			}});
	});
	
	
	$("#noteModBtn").on("click", function() {
	    var note_contents = $("#note_contents");
	    var note_sender= '${company_login_member_id}';
	    var note_receiver= '${contest_qna.qna_writer }';
	    
	    //console.log(note_receiver);
	    
		  $.ajax({
				type:'post',
				url:'${initParam.rootPath}/user/note/register',
				data:{"note_contents":note_contents.val(),"note_sender":note_sender, "note_receiver":note_receiver},
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("등록 되었습니다.");
						//$("#tcmail").modal('hide');
						//$("#tcmail").fadeOut();
					}
			}});
	});
	
</script>	

<script type="text/javascript">
 $(function(){//document ready
	      
		 if(loginState != 'login'){// 로그인을 하지 않았다면
			  $('#noteA').attr("href", "#");
		 }else{
			 $('#noteA').attr("href", "#tcmail"); //쪽지 보내게 하기
		 }
 
		  $('#noteA').on("click", function(){ //????????????
			  console.log('쪽지 보내기 버튼 클릭');
			  if(loginState != 'login'){
				  alert('쪽지는 로그인한 후에 보낼 수 있습니다.');
			  }
		  });
	 
	        writerCheck();
	        
		    var formObj = $("form[name=readForm]");
			var qna_no = $('#qna_no');

			getPage("${initParam.rootPath}/review/qna_reply/"+qna_no.val()+"/1" );  
			
			
			$('#goListBtn').on("click", function() {
	              console.log('목록보기 버튼 클릭');
	              self.location="${initParam.rootPath }/user/contest/read?page=${cri.page }"
	                       +"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
	                       +"&keyword=${cri.keyword }&contest_id=${param.contest_id}";
	        });
			
			$("#goLogin").on("click", function(){
				formObj.attr("method", "get");
				formObj.attr("action", "${initParam.rootPath}/review/qna_reply/goLogin");
				formObj.submit();
			});
 });
	  	
		//게시글 작성자 아이디와 로그인 아이디 일치 여부 체크
	  	function writerCheck(){
			console.log('writerCheck()')
	  		var login_id='${user_login_id}';
	  		//alert(login_id)
	  		var qna_writer = document.readForm.qna_writer.value;
	  	
	  		var qna_no = document.readForm.qna_no.value;
	  		
	  		//alert("로그인한 아이디: "+login_id+"/작성자 아이디: "+qna_writer+"/후기번호:"+qna_no);
	  		
	  		 if(login_id==qna_writer){//일치하면 수정 삭제 버튼 나오게.
	  			console.log('일치하는 아이디');
	  			var upDel = document.getElementById('upDel');
				upDel.innerHTML = '<button type=button  class="board-read-button-myBtn" id="update" onclick="modifyReview()">수정</button>'+
							      '<button type=button class="board-read-button-myBtn" id="delete" onclick="removeReview()">삭제</button>';
	  		}else{
	  			console.log('일치하지않는 아이디');
	  		} 
		}
	  	
	  	//게시글 수정 버튼 클릭
	  	function modifyReview(){
	  		self.location="${initParam.rootPath }/user/contest/qna/modify?page=${cri.page }"
					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
					+"&keyword=${cri.keyword }&contest_id=${param.contest_id}&qna_no=${contest_qna.qna_no }";
	  	}
	  	
	  	//게시글 삭제 버튼 클릭
	  	function removeReview(){
	  		
	  		if(confirm('정말로 삭제하시겠습니까?')){
	  			self.location="${initParam.rootPath }/user/contest/qna/remove?page=${cri.page }"
					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
					+"&keyword=${cri.keyword }&contest_id=${param.contest_id}&qna_no=${contest_qna.qna_no }";
	  		}
	  	}
	  
</script>
</body>
</html>
