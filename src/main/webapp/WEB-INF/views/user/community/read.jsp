<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<section class="content">
   <div class="row">
      <div class="col-md-12">
         <div class="box box-primary">
            <div class="box-header">
               <h3 class="box-title">커뮤니티 페이지 읽기</h3>
            </div>
            <!-- /.box-header -->
            
            <form role="form" action="modifyPage" method="post">
                <input type='hidden' id="community_no" name='community_no' value="${community.community_no}">
                <input type='hidden' name='page' value="${cri.page}">
                <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
                <input type='hidden' name='searchType' value="${cri.searchType}">
                <input type='hidden' name='keyword' value="${cri.keyword}">
           
           
           <div class="box-body">
              <div class="form-group">
                 <label for="community_title">글 제목</label>
                 <input type="text" id="community_title" name='community_title' class="form-control"
                         value="${community.community_title}" readonly="readonly">
              </div>
              <div class="form-group">
                 <label for="community_contents">글 내용</label>
                 <textarea class="form-control" name="community_contents" rows="3" id="community_contents"
                           readonly="readonly">${community.community_contents}</textarea>
              </div>
              <div class="form-group">
                 <label for="community_writer">작성자</label>
                 <input type="text" id="community_writer" name="community_writer" class="form-control"
                        value="${community.community_writer}" readonly="readonly">
              </div>           <!-- community = communityVo  -->
           </div>
            </form>
                   
           <div class="box-footer">
           <c:if test="${user_login_id == community.community_writer}">
			    <button type="submit" class="btn btn-warning" id="modifyBtn">글 수정</button>
			    <button type="submit" class="btn btn-danger" id="removeBtn">글 삭제</button>
	       </c:if>
	            <button type="submit" class="btn btn-primary" id="goListBtn">글 리스트 </button>
           </div>
           
         </div>
      </div>
   </div>
   
   <!-- ////////////////////// 댓글 ///////////////// -->
  
   <div class="row">
      <div class="col-md-12">
      
         <div class="box box-success">
            <div>
               <h3 class="box-title">댓글 추가</h3>
            </div>
            <c:if test="${not empty user_login_id }">
				<div class="box-body">
					<label for="reply_writer">작성자</label> 
					<input class="form-control" type="text" id="newReplyWriter" value="${user_login_id }" readonly> 
					<label for="reply_contents">댓글</label> 
					<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newReply_contents">
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">댓글 추가</button>
				</div>
				</c:if>
				
				<!--<c:if test="${empty user_login }">
					<div class="box-body">
						<div><a id="goLogin">Login Please</a></div>
					</div>
				</c:if> -->
         </div>
         
         <!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="community_repliesDiv">댓글 리스트</li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
         
      </div>
      <!-- /.col -->
   </div>
   <!-- /.row -->
   
   <!-- 댓글 수정 Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <div class="row" style="padding-left: 1em;padding-right: 20em;">
        	<h4 class="modal-title"></h4>
        	<span><input type="text" id="reply_writer" class="form-control"></span>
        </div>
      </div>
      <div class="modal-body" data-reply_no>
        <p><input type="text" id="reply_contents" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">댓글 수정</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">댓글 삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>      
   
</section>

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

<script>
	//var flag = true;

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

	/* $("#community/replyDiv").on("click", function() {//댓글 보여주기(Replies List)를 클릭하면
		///
		console.log("댓글목록 클릭!!"+ flag);
		if(flag){
			$('.replyLi').show();
			$('.pagination').show();
			
			flag=!flag; 
		///	
		$('.replyLi').slideToggle(500);//댓글 리스트 보이고 안보이게 하기
		$('#pagination li').slideToggle(500);//댓글 페이징 보이고 안보이게 하기
		if ($(".timeline li").size() > 1) {//댓글 리스트가 1개이상 있다면
			return;
		}
		getPage("${initParam.rootPath}/community/reply/" + community_no + "/1");//댓글 첫페이지 보여주기.
		///
		 }else{
			flag=!flag;
			$('.replyLi').hide();
			$('.pagination').hide();
		} 
	    ///

	}); */
	
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
		
		var reply = $(this);
		
		$("#reply_contents").val(reply.find('.timeline-body').text());
		$('#reply_writer').val(reply.attr("data-reply_writer"));
		$(".modal-title").html(reply.attr("data-reply_no"));
		
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
						$('#reply_writer').val("");
						$("#reply_contents").val("");
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
						$("#modifyModal").modal('toggle');
					}
			}});
	});
	
</script>

<script> // 글 수정, 삭제 버튼 기능
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	var community_no = $('#community_no').val();
	getPage("${initParam.rootPath}/community/reply/"+community_no+"/1");
	console.log(formObj);
	
	$('#modifyBtn').on("click", function(){
	    formObj.attr("method", "get");
		formObj.attr("action", "${initParam.rootPath}/user/community/modify");
	    formObj.submit();
	});
	
	$('#removeBtn').on("click", function(){
		formObj.attr("action", "${initParam.rootPath}/user/community/remove");
	    formObj.submit();
	});
	
	$("#goListBtn").on("click",function(){
		formObj.attr("method","get");
		formObj.attr("action","${initParam.rootPath}/user/community/list");
		formObj.submit();
	});
	
	/*
	$('#goLogin').on("click", function(){
		formObj.rttr("method","get");
		formObj.rttr("action","");
	    formObj.submit();
	});
	*/
});
</script>