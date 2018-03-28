<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 상세정보</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/community_read_sw.css" rel="stylesheet" type="text/css">
<!-- 핸들바 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
			<div class="section-board-read">
					<div class='title-wrapper'>
						<div class='column-title'>커뮤니티 글상세보기</div>
					</div>
					<form id="readForm" name="readForm" method="post">
					<div class='board-read-wrapper'>
					   <input type='hidden' id="community_no" name='community_no' value="${community.community_no}">
	                   <input type="hidden" id="community_writer" name="community_writer" value="${community.community_writer }">
	                   <input type='hidden' name='page' value="${cri.page}">
	                   <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	                   <input type='hidden' name='searchType' value="${cri.searchType}">
	                   <input type='hidden' name='keyword' value="${cri.keyword}">
						
					<div class="board-read-top">
							<div class='board-read-title'>
								<input class="" id="community_title" name="community_title" type="text"
					                  value="${community.community_title }" readonly="readonly">
							</div>
							<div class='board-read-datas'>
							<div class='board-read-data'>
						        <label>작성자</label>&nbsp;&nbsp;
						        <div class="board-read-data-content" id="community_writer" name="community_writer" 
						        	 readonly="readonly" >${community.community_writer}</div>
							</div>
							<div class='board-read-data'>
						        <label>조회수</label> 
						        <div class="board-read-data-content" id="community_viewCount" name="community_viewCount" readonly="readonly" >${community.community_viewCount}</div>
							</div>
							<%-- <div class="board-read-date">${community.community_wdate} 시간</div> --%>
							</div>
					 </div>
						
						<div class='board-read-contents'>
						   <div class="form-group">	
					        <div class="board-read-content" id="good">${community.community_contents}</div>
						   </div>
						</div>
						
						<div class='board-read-buttons' align="center">
							<input type="button" class='board-read-button-toList' id="goListBtn" name="goListBtn" value='목록보기'>
	                      	<div class="board-read-button-myBtns">
							  <span id="upDel" class=""></span>
					        </div>
						</div>
						
						</div>
						</form>
			</div>
			<!-- section_communityread -->
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
									<div class="reply-writecontent">
										<div class="reply-content-button">
<!-- 											<input type="submit" class="reply-btn" id="replyAddBtn" value="댓글 등록"> -->
											<input type="submit" id="replyAddBtn" value="댓글 등록">
										</div>
									</div>
								</div>

							</c:if>

							<c:if test="${empty user_login_id }">
								<div class="box-body">
									<div>
										<a id="goLogin">Login Please</a>
									</div>
								</div>
							</c:if>
						</div>
						<!-- The time line -->
						<ul class="timeline">
							<!-- timeline time label -->
							<li class="time-label" id="repliesDiv"></li>
						</ul>

					<div class="reply-paging" >
						<div class="reply-pageline" align="center">
							<ul class="reply-pagination" >
								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a
										href="list${pageMaker.makeSearch(idx)}&company_id=${param.company_id }">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&company_id=${param.company_id }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- reply-paging -->
<!-- 						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin ">

							</ul>
						</div> -->
					</div> 
					
				</div><!-- /row -->
				
				<!-- 댓글 수정 모달    -->
            <div class="modal" id="modifyModal">
               <div class="modal-pannel">
                  <div class="modal-Title" style="font-size: 20px; font-weight: bold;">
                  댓글수정 
                  <a href="#close">CLOSE</a>
                  </div>
                  <div class="modal-body">
                     <h4 class="modal_title"></h4>
                     <p>
                        <input type="text" id="reply_contents" class="form-control"
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
         </div>
            <!-- section_communityreply -->
			</div>
			<!-- column-left -->
		
				

	<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../login_after_new.jsp"%>
			</div>
		</div>
		<!-- column-right -->


	<!-- modal 코드 -->
	<%@ include file="../user_modals_new.jsp"%>

	</div>
	<!-- container -->
	<!-- frame -->
 	<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-reply_no={{reply_no}} data-reply_writer={{reply_writer}}>
<div class="time_comment_box" style="width: 700px; height:auto; border-top: 1px solid gray;">
		<div class="time_area">
			<div class="time_info">
				<h4>{{reply_no}}-{{reply_writer}} </h4>
			</div>
			<div class="timeline-body">{{reply_contents}}</div>
			<div class="time_tool">
				<i class="fa fa-clock-o"></i>{{prettifyDate reply_wdate}}
			</div>
		</div>
<div class="timeline-footer" style="display:block;">
		{{#eqReply_writer reply_writer}}
		 <span><a href="#modifyModal">Modify</a></span>
		{{/eqReply_writer}}
</div>			
</div>
</li>
{{/each}}
</script> 

<script type="text/javascript">
 Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	Handlebars.registerHelper("eqReply_writer", function(reply_writer,block){
		var accum = '';
		
		if(reply_writer == '${user_login_id}'){
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

	var community_no = ${community.community_no};
	
	var replyPage = 1;

	function getPage(pageInfo) {
		
	
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".reply-pagination"));
	
			//$("#modifyModal").modal('toggle');
	
		});
	}
	
	var printPaging = function(pageMaker, target) {//아래부분에 페이징하는 것

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : ''; //현제 페이지가 i와 같다면 class="active"를 넣어주고 아니면 '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};
 
	$(".reply-pagination").on("click", "li a", function(event){//pagination클래스를 가진 태그의 li의 a태그를 클릭하면
		//댓글 페이징 버튼을 클릭하면
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");//a태그의 href --> 페이지(i)
		
		getPage("${initParam.rootPath}/community/reply/"+community_no+"/"+replyPage);
		
	});
	
 $("#replyAddBtn").on("click",function(){//댓글 추가(add Reply)를 클릭했을 때
	  //console.log("ddd");
	 var reply_writerObj = $("#newReplyWriter"); 
	 var reply_contentsObj = $("#newReplyText"); 
	 var reply_writer = reply_writerObj.val(); //댓글 작성자
	 var reply_contents = reply_contentsObj.val(); //댓글 내용
	 var community_noObj = $("input[name=community_no]");
	 var community_no = community_noObj.val();
	 
	 console.log('>>>'+reply_writer,reply_contents,community_no+'<<<<');
	  $.ajax({
			type:'post', //post로 지정
			url:'${initParam.rootPath}/community/reply',
			/* headers: { 
			      "Content-Type": "application/json", //서버에 json형식으로 데이터를 전달하기 위해
			      "X-HTTP-Method-Override": "POST" }, */
			dataType:'text',
			data:{"community_no":community_no,
				"reply_writer":reply_writer, 
				"reply_contents":reply_contents}, //JSON데이터를 구성해서 전달하도록
			success:function(result){
				console.log("result: " + result);
				if(result == 'success'){//서버에 데이터를 전달하고 'SUCCESS'라는 결과값이 왔다면(댓글 등록이 되었다면)
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("${initParam.rootPath}/community/reply/"+community_no+"/"+replyPage );
				    //reply_writerObj.val(""); //댓글 작성자 빈칸으로
					reply_contentsObj.val(""); //댓글 내용 빈칸으로
				}
		}});
});
 
 $("#replyModBtn").on("click",function(){
	  
	  var reply_no = $(".modal-title").html();
	  var reply_writer = $('#reply_writer').val();
	  var reply_contents = $("#reply_contents").val();
	  
	  $.ajax({
			type:'put',
			url:'${initParam.rootPath}/community/reply/'+reply_no,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({reply_writer:reply_writer,reply_contents:reply_contents}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'success'){
					alert("수정 되었습니다.");
					getPage("${initParam.rootPath}/community/reply/"+community_no+"/"+replyPage );
					$("#modifyModal").fadeOut();
				    self.location="${initParam.rootPath }/user/community/read?page=${cri.page }"
						+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
						+"&keyword=${cri.keyword }&community_no=${community.community_no }"
						
				}
		}});
});

$("#replyDelBtn").on("click",function(){
	  
	  var reply_no = $(".modal-title").html();
	  var reply_contents = $("#reply_contents").val();
	  
	  $.ajax({
			type:'delete',
			url:'${initParam.rootPath}/community/reply/'+reply_no,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'success'){
					alert("삭제 되었습니다.");
					getPage("${initParam.rootPath}/community/reply/"+community_no+"/"+replyPage );
					$("#modifyModal").fadeOut();
					 self.location="${initParam.rootPath }/user/community/read?page=${cri.page }"
							+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
							+"&keyword=${cri.keyword }&community_no=${community.community_no }"
				}
		}});
});
 
 $(".timeline").on("click", ".replyLi", function(event){
	    console.log("ddd");
		
	    var reply = $(this);
		
		$("#reply_contents").val(reply.find('.timeline-body').text());
		$('#reply_writer').val(reply.attr("data-reply_writer"));
		$(".modal-title").html(reply.attr("data-reply_no"));
		
	});
 
 
</script>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	writerCheck();
	
	var community_no = $('#community_no').val();
	getPage("${initParam.rootPath}/community/reply/"+community_no+"/1");
	console.log(formObj);

	
	$('#goListBtn').on("click", function() {
  		console.log('목록보기 버튼 클릭');
  		self.location="${initParam.rootPath }/user/community/list";
  	});
});	

//게시글 작성자 아이디와 로그인 아이디 일치 여부 체크
	function writerCheck(){
	console.log('writerCheck()')
		var login_id='${user_login_id}';
		//alert(login_id)
		var community_writer = document.readForm.community_writer.value;
	
		var community_no = document.readForm.community_no.value;
		
		
		 if(login_id==community_writer){//일치하면 수정 삭제 버튼 나오게.
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
		self.location="${initParam.rootPath }/user/community/modify?page=${cri.page }"
			+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
			+"&keyword=${cri.keyword }&community_no=${community.community_no }";
	}
	
	//게시글 삭제 버튼 클릭
	function removeReview(){
		
		if(confirm('정말로 삭제하시겠습니까?')){
			self.location="${initParam.rootPath }/user/community/remove?page=${cri.page }"
			+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
			+"&keyword=${cri.keyword }&community_no=${community.community_no }";
		}
	}
</script>
</body>

</html>
