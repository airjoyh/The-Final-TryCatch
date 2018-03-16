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
						<input type="button" class='inline-btn' id="goList" value='목록보기'>
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
							<c:if test="${not empty company_login_member_id }">
							<div class="box-body">
							    	<label for="exampleInputEmail1">작성자</label> 
								    <input class="form-control" type="text" id="newReplyWriter" value="${company_login_member_id }" readonly> 
									<label for="exampleInputEmail1">댓글</label> 
									<input class="form-control" type="text" id="newReplyText">
			
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="button" class='inline-btn' id="replyAddBtn">댓글 등록</button>
								<!-- timeline time label -->
								<button class='inline-btn' id="replyBtn">댓글</button>
							</div>
							</c:if>
							
							<c:if test="${empty company_login_member_id }">
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
					<!-- /.col -->
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
<script type="text/javascript">
$(function(){
	$('#goList').on("click", function(){
		self.location="${initParam.rootPath }/communitylist"
	});
});
/* $(function(){
		
		var formObj = $("form[name=readForm]");
		var review_no = $('#review_no');
	
		getPage("${initParam.rootPath}/review/reply/"+review_no.val()+"/1" );
		
		$('#goList').on("click", function() {
	  		console.log('목록보기 버튼 클릭');
	  		self.location="${initParam.rootPath }/ing/cont_qna_sw?page=${cri.page }"
	  					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
	  					+"&keyword=${cri.keyword }&company_id=${param.company_id}";
	  	});
		
		$("#goLogin").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "${initParam.rootPath}/review/reply/goLogin");
			formObj.submit();
		});
	  	
	  	//게시글 작성자 아이디와 로그인 아이디 일치 여부 체크
	  	function writerCheck(){
	  		var login_id='${user_login_id}';
	  		//alert(login_id)
	  		var writer_id = document.readForm.writer_id.value;
	  		
	  		var no = document.getElementById('review_no').innerHTML;
	  		
	  		//alert("로그인한 아이디: "+login_id+"/작성자 아이디: "+writer_id+"/후기번호:"+no);
	  		
	  		if(login_id==writer_id){//일치하면 수정 삭제 버튼 나오게.
	  			var upDel = document.getElementById('upDel');
				upDel.innerHTML = '<button type=buttion  id="update" onclick="modifyReview()">수정</button>'+
							      '<button type=button id="delete" onclick="removeReview()">삭제</button>';
	  		}
	  	}
	  	
	  	//게시글 수정 버튼 클릭
	  	function modifyReview(){
	  		self.location="${initParam.rootPath }/ing/cont_qna_modify?page=${cri.page }"
					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
					+"&keyword=${cri.keyword }&company_id=${param.company_id}&no=${review.review_no }";
	  	}
	  	
	  	//게시글 삭제 버튼 클릭
	  	function removeReview(){
	  		
	  		if(confirm('정말로 삭제하시겠습니까?')){
	  			self.location="${initParam.rootPath }/user/review/remove?page=${cri.page }"
					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
					+"&keyword=${cri.keyword }&company_id=${param.company_id}&no=${review.review_no }";
	  		}
	  	} */
	  
</script>
</body>

</html>
