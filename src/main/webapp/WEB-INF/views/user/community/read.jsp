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
			<div class='com-contest-head'>
				<div class='title-wrapper'>
					<div class='column-title'>커뮤니티 글상세보기</div>
				</div>
				<form role="form" action="modifyPage" method="post">
				<div class='wrapper'>
				   <input type='hidden' id="community_no" name='community_no' value="${community.community_no}">
                   <input type='hidden' name='page' value="${cri.page}">
                   <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
                   <input type='hidden' name='searchType' value="${cri.searchType}">
                   <input type='hidden' name='keyword' value="${cri.keyword}">
				
				
					<div class='community-title'>
						<!-- <div class="community-title-box">
							<div class="ct-box">
								<label class="ct-box-label">글번호</label> 
								<p class="form-control" id="title" name="title" type="text" style="width: 15%" placeholder="글번호 자동입력." readonly="readonly">
						    </div>
						    <div class="ct-box">
							    <label class="ct-box-label">작성일</label> 
							    <p class="form-control" id="writer" name="writer" style="width: 15%" placeholder="yy-mm-dd hh-MM-ss">
						    </div>
						</div> -->
						
						<div class="community-title-box">
						   <div class="form-group">	
								<label class="ct-box-label">제목 </label>&nbsp;&nbsp;&nbsp; 
								<p class="qna-title" id="community_title" name="community_title" type="text" style="width: 15%" readonly="readonly">${community.community_title}</p> <!-- placeholder="제목을 입력하세요." -->
				           </div>
				           
				           <div class="form-group">    
					            <label class="ct-box-label">작성자</label> 
					            <p class="qna-writer" id="community_writer" name="community_writer" style="width: 15%" readonly="readonly" >${community.community_writer}</p> <!-- placeholder="작성자를 입력하세요." -->
				           </div>  
				        </div>
					</div>
					
					<div class='community-content'>
					   <div class="form-group">	
						<label class="content-label" for="good">글 내용</label><br>
				        <p name="community_contents" class="form-p" id="good">${community.community_contents}</p>
					   </div>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='inline-btn' id="goListBtn" name="goListBtn" value='목록보기'>

					</div>
					
					</div>
					</form>
			</div><!-- section_main1 -->
			<div class='section_reply'>
				<div class="row" align="center">
					<div class="reply-box">
			
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title">REPLY</h3>
							</div>
							<c:if test="${not empty user_login_id }">
							<div class="box-body">
							    	<label for="exampleInputEmail1">작성자</label> 
								    <input class="form-control" type="text" id="newReplyWriter" value="${user_login_id}" readonly><br> 
									<label for="exampleInputEmail1">댓글</label> 
									<input class="form-control" type="text" id="newReply_contents">
			                </div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="button" class='inline-btn' id="replyAddBtn">댓글 등록</button>
								<!-- timeline time label -->
							</div>
							</c:if>
							
							<c:if test="${empty user_login_id }">
								<div class="box-body">
									<div><a id="goLogin">Login Please</a></div>
								</div>
							</c:if>
						</div>

						<!-- The time line -->
						<ul class="timeline">
							<!-- timeline time label -->
							<li class="time-label" id="community_repliesDiv"><span
								class="bg-green">댓글</span></li>
						</ul>

						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin ">

							</ul>
						</div>

						<!--  The time line 
							<ul class="timeline" style="display: inline-flex; flex-direction: column;">
								timeline time label
								 <li class="time-label" id="community_repliesDiv"></li> 
							</ul>
						
							<div class='text-center' style="align-content: center;">
								<ul id="pagination" style="display: flex; flex-direction: row;" class="pagination pagination-sm">
				
								</ul>
							</div> -->

					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!--  댓글 수정 Modal --> 
				<div id="modifyModal" name="modifyModal" class="modal modal-primary fade" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content -->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<div class="row" style="padding-left: 1em; padding-right: 20em;">
									<h4 class="modal-title"></h4>
									<span><input type="text" id="reply_writer"
										class="form-control"></span>
								</div>
							</div>
							<div class="modal-body" data-reply_no>
								<p>
									<input type="text" id="reply_contents" class="form-control">
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" id="replyModBtn">댓글
									수정</button>
								<button type="button" class="btn btn-danger" id="replyDelBtn">댓글
									삭제</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div><!-- section_qnareply -->
		</div><!-- column-left -->
				

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

	<!-- frame -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-reply_no={{reply_no}} data-reply_writer={{reply_writer}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate reply_wdate}}
  </span>
  <h3 class="timeline-header"><strong>{{reply_no}}</strong> -{{reply_writer}}</h3>
  <div class="timeline-body">{{reply_contents}}</div>
    <div class="timeline-footer">
	{{#eqReply_writer reply_writer }}
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
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
			printData(data.list, $("#community_repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
	
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
 
	$(".pagination").on("click", "li a", function(event){//pagination클래스를 가진 태그의 li의 a태그를 클릭하면
		//댓글 페이징 버튼을 클릭하면
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");//a태그의 href --> 페이지(i)
		
		getPage("${initParam.rootPath}/community/reply/"+community_no+"/"+replyPage);
		
	});
	
 $("#replyAddBtn").on("click",function(){//댓글 추가(add Reply)를 클릭했을 때
	  //console.log("ddd");
	 var reply_writerObj = $("#newReplyWriter"); 
	 var reply_contentsObj = $("#newReply_contents"); 
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
	
	var community_no = $('#community_no').val();
	getPage("${initParam.rootPath}/community/reply/"+community_no+"/1");
	console.log(formObj);
	
	$("#goListBtn").on("click",function(){
		formObj.attr("method","get");
		formObj.attr("action","${initParam.rootPath}/user/community/list");
		formObj.submit();
	});
});	
</script>
</body>

</html>
