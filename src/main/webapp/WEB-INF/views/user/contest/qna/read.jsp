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
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
					<div class='column-title'>콘테스트 Q&A 글상세보기</div>
				</div>
				<div class='wrapper'>
					<div class='com-qna-title'>
					   <form id="readForm" name="readForm" method="POST">
	  	 		          <input type="hidden" id="qna_no" name="qna_no" value="${contest_qna.qna_no }">
	  	 		          <input type="hidden" id="qna_writer" name="qna_writer" value="${contest_qna.qna_writer }"> <%--  value="ekwjd72@naver.com">  --%>
	  	 		          <input type="hidden" id="contest_id" name="contest_id" value="${param.contest_id }">
	  	 		          <input type='hidden' name='page' value="${cri.page}"> 
	  	 		          <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				          <input type='hidden' name='searchType' value="${cri.searchType}">
				          <input type='hidden' name='keyword' value="${cri.keyword}">
			          </form>
						<div>
							<span class="input-group-addon">글번호</span> 
							<input class="form-control" id="qna_no" name="qna_no" type="text" style="width: 35%" placeholder="글번호 자동입력." 
							       value="${contest_qna.qna_no }" readonly="readonly">
						   
						    <span class="input-group-addon" style="padding-left: 3em;">작성일</span> 
						    <input class="form-control" id="qna_wdate" name="qna_wdate" style="width: 35%" placeholder="yy-mm-dd hh-MM-ss"
						           value="${contest_qna.qna_wdate}" readonly="readonly">
						</div>
						<div>
							<span class="input-group-addon">제목</span>&nbsp;&nbsp;&nbsp; 
							<input class="qna-title" id="qna_title" name="qna_title" type="text" style="width: 35%" placeholder="제목을 입력하세요."
							       value="${contest_qna.qna_title }" readonly="readonly">
				            
				            <span class="input-group-addon" style="padding-left: 3em;">작성자</span> 
				            <input class="qna-writer" id="qna_writer" name="qna_writer" style="width: 35%" placeholder="작성자를 입력하세요."
				                   value="${contest_qna.qna_writer }" readonly="readonly">
				        </div>
					</div>
					<div class='com-qna-content'>
						<label for="good">Q&A내용</label><br>
				        <textarea name="qna_contents" rows="10" class="form-ta" id="qna_contents" readonly="readonly">${contest_qna.qna_contents }</textarea>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='qna-list' id="goList" value='목록보기'>
						<div class="row">
						        <span id="upDel" class="mybutton"></span>
				        </div>
					</div>
					
					
					</div>
			</div><!-- section_main1 -->
			<div class='section_qnareply'>
				<div class="row" align="center">
					<div class="col-md-12">
			
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title">REPLY</h3>
							</div>
							<c:if test="${not empty company_login_member_id }">
							<div class="box-body">
							    	<label for="exampleInputEmail1">작성자</label> 
								    <input class="form-control" type="text" id="newReplyWriter" value="${company_login_member_id }" readonly> 
									<label for="exampleInputEmail1">댓글</label> 
									<input class="form-control" type="text" id="newReplyText">
			
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="button" id="replyAddBtn">댓글 등록</button>
							</div>
							</c:if>
							
							<c:if test="${empty company_login_member_id }">
								<div class="box-body">
									<div><a id="goLogin">Login Please</a></div>
								</div>
							</c:if>
						</div>
			
			
						<!-- The time line -->
						<ul class="timeline">
							<!-- timeline time label -->
							<li class="time-label" id="repliesDiv"><span class="bg-green">댓글</span></li>
						</ul>
			
						<div class='text-center'>
							<ul id="pagination" style="display: flex; flex-direction: row; margin-left:300px;" class="pagination pagination-sm no-margin ">
			
							</ul>
						</div>
			 
					</div>
					<!-- /.col -->
				</div>
				
				<!-- Modal -->
				<div id="modifyModal" class="modal modal-primary fade" role="dialog">
				  <div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal_title"></h4>
				      </div>
				      <div class="modal-body" data-rno>
				        <p><input type="text" id="replytext" class="form-control"></p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
				        <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div><!-- section_qnareply -->
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
		</div>	
			
			
		<!-- modal 코드 -->
	 
	<!-- 	회원가입 모달 -->
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
			
		<!-- 비밀번호 찾기 모달	 -->
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
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-reply_no={{reply_no}} data-reply_writer={{reply_writer}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" style="display: felx; flex-direction: column;">
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate reply_wdate}}
  </span>
  <h3 class="timeline-header"><strong>{{reply_no}}</strong>-{{reply_writer}} </h3>
  <div class="timeline-body">{{reply_contents}}</div>
    <div class="timeline-footer">
	{{#eqReply_writer reply_writer}}
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
	{{/eqReply_writer}}
    </div>
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
	
	
	$("#replyAddBtn").on("click",function(){
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
						$("#modifyModal").modal('toggle');
					}
			}});
	});
	
	
	
</script>	

<script type="text/javascript">
 $(function(){
	      
	        writerCheck();
	        
		    var formObj = $("form[name=readForm]");
			var qna_no = $('#qna_no');

			getPage("${initParam.rootPath}/review/qna_reply/"+qna_no.val()+"/1" );  
			
			
			$('#goList').on("click", function() {
		  		console.log('목록보기 버튼 클릭');
		  		self.location="${initParam.rootPath }/user/contest/qna/list?page=${cri.page }"
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
				upDel.innerHTML = '<button type=button  class="qna-list" id="update" onclick="modifyReview()">수정</button>'+
							      '<button type=button class="qna-list" id="delete" onclick="removeReview()">삭제</button>';
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
