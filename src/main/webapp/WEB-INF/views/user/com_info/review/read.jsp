<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--ajax 통신을 위한 json설정 --%>

<!-- C태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%-- <link href="${initParam.rootPath }/css/font.css" rel="stylesheet"> --%>
<link href="${initParam.rootPath }/resources/css/review_post.css" rel="stylesheet">  




  <title>글 상세정보</title>
  </head>
  <section class="content">
  <body style="background-color: #f4f4f4;">
	<!--***********************************************************
	*                                                             *
	*                            nav                              *
	*                                                             *
	************************************************************-->
	<%@include file="../../../userNavBar.jsp" %>
	
	<!--***********************************************************
	*                                                             *
	*                            제목                                                                    *
	*                                                             *
	************************************************************-->
  
	<div class="container" style=" background-image: url('${initParam.rootPath}/resources//image/monitor/pencil.jpg');" >
		<div class="row" style="padding-top: 8em; padding-bottom: 1em; padding-right: 4em;padding-left: 4em">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1 style="font-weight: 600; ">후기 상세정보</h1>
				<hr>
			</div>
		</div>
	</div>
	
	<!--***********************************************************
	*                                                             *
	*                           body - 수정                                                      *
	*                                                             *
	************************************************************-->	
	<div class="container"
		 style="background-color: #ffffff; margin-top: 1em;">
	  <div class="well well" style="margin-top: 2em; margin-left: 2em; margin-right: 2em;">
	  	 <div id="wrap">
	  	 	<br><br>
	  	 	<form id="readForm" name="readForm" method="POST">
	  	 		<input type="hidden" id="review_no" name="review_no" value="${review.review_no }">
	  	 		<input type="hidden" name="writer_id" value="${review.user_id }">
	  	 		<input type="hidden" id="company_id" name="company_id" value="${param.company_id }">
	  	 		<input type='hidden' name='page' value="${cri.page}"> 
	  	 		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">
			</form>
	  	 		<div id="board" align="center">
<!-- 	  	 			<table id="tdetail" border="3" bordercolor="lightgray" style="width: 600px; height: 950px"> -->
	  	 			<table id="tdetail" border="3" bordercolor="lightgray" style="width:100% height: 90%">
	  	 				<tr style="height: 50px">
	  	 					<td style="text-align: center; font-weight: bold;">글번호</td>
	  	 					<!-- 컨트롤러에서 받아온 ArrayList detailAll에서 정보를 뽑는다. -->
	  	 					<td style="text-align: center;">${review.review_no }</td>
	  	 				</tr>
	  	 				<tr style="height: 50px">
	  	 					<td style="text-align: center; font-weight: bold;">제목</td>
	  	 					<td id="title" style="text-align: center;">${review.review_title }</td>
	  	 				</tr>
				        <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">글쓴이</td>
				            <td style="text-align: center;" >${review.review_writer }</td>
				        </tr>
				        <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold; ">조회</td>
				            <td style="text-align: center;">${review.review_viewCount}</td>
				        </tr>
				        <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">작성일시</td>
				            <td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.review_wdate}" /></td>
				        </tr>
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">기업 장점</td>
            				<td style="text-align: center;">${review.review_strong }</td>		        	
				        </tr>	  	 				
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">기업 단점</td>
            				<td style="text-align: center;">${review.review_weak }</td>		        	
				        </tr>	  	 				
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">경영진에 바라는점</td>
            				<td style="text-align: center;">${review.review_toCEO }</td>		        	
				        </tr>
				        <tr>
				        	<td style="text-align: center; font-weight: bold;">별점</td>
				        	<td>
				        		<br>
								<div>
									<ul class="list-group">
										<li class="list-group-item">승진기회 및 가능성
										<span class="star-input" id="star-A" style="float: right;"> 
										<span class="input"> 
											<input type="radio" name="review_possibility" id="p1" value="1"> 
											<label for="p1">1</label> 
											<input type="radio" name="review_possibility" id="p2" value="2"> 
											<label for="p2">2</label> 
											<input type="radio" name="review_possibility" id="p3" value="3"> 
											<label for="p3">3</label> 
											<input type="radio" name="review_possibility" id="p4" value="4"> 
											<label for="p4">4</label> 
											<input type="radio" name="review_possibility" id="p5" value="5"> 
											<label for="p5">5</label>
										</span>  &nbsp;
											<span class="badge" id="star-1"><b>${review.review_possibility }</b>점</span>
										</span>
										</li>
										<li class="list-group-item">복지 및 급여
										<span class="star-input" id="star-B" style="float: right;"> 
										<span class="input"> 
											<input type="radio" name="review_welSal" id="p6" value="1"> 
											<label for="p6">1</label> 
											<input type="radio" name="review_welSal" id="p7" value="2"> 
											<label for="p7">2</label> 
											<input type="radio" name="review_welSal" id="p8" value="3"> 
											<label for="p8">3</label> 
											<input type="radio" name="review_welSal" id="p9" value="4"> 
											<label for="p9">4</label> 
											<input type="radio" name="review_welSal" id="p10" value="5"> 
											<label for="p10">5</label>
										</span>  &nbsp;
											<span class="badge" id="star-2"><b>${review.review_welSal }</b>점</span>
										</span>
										</li>
										<li class="list-group-item">업무와 삶의 균형 
										<span class="star-input" id="star-C" style="float: right;">
										<span class="input"> 
											<input type="radio" name="review_balance" id="p11" value="1"> 
											<label for="p11">1</label> 
											<input type="radio" name="review_balance" id="p12" value="2"> 
											<label for="p12">2</label> 
											<input type="radio" name="review_balance" id="p13" value="3"> 
											<label for="p13">3</label> 
											<input type="radio" name="review_balance" id="p14" value="4"> 
											<label for="p14">4</label> 
											<input type="radio" name=review_balance id="p15" value="5"> 
											<label for="p15">5</label>
										</span>  &nbsp;
											<span class="badge" id="star-3"><b>${review.review_balance }</b>점</span>
										</span>
										</li>
										<li class="list-group-item">사내문화 
										<span class="star-input" id="star-D" style="float: right;">
										<span class="input"> 
											<input type="radio" name="review_culture" id="p16" value="1"> 
											<label for="p16">1</label> 
											<input type="radio" name="review_culture" id="p17" value="2"> 
											<label for="p17">2</label> 
											<input type="radio" name="review_culture" id="p18" value="3"> 
											<label for="p18">3</label> 
											<input type="radio" name="review_culture" id="p19" value="4"> 
											<label for="p19">4</label> 
											<input type="radio" name="review_culture" id="p20" value="5"> 
											<label for="p20">5</label>
										</span>  &nbsp;
											<span class="badge" id="star-4"><b>${review.review_culture }</b>점</span>
										</span>
										</li>
										<li class="list-group-item">경영진
										<span class="star-input" id="star-E" style="float: right;">
										<span class="input"> 
											<input type="radio" name="review_manager" id="p21" value="1"> 
											<label for="p21">1</label> 
											<input type="radio" name="review_manager" id="p22" value="2"> 
											<label for="p22">2</label> 
											<input type="radio" name="review_manager" id="p23" value="3"> 
											<label for="p23">3</label> 
											<input type="radio" name="review_manager" id="p24" value="4"> 
											<label for="p24">4</label> 
											<input type="radio" name="review_manager" id="p25" value="5"> 
											<label for="p25">5</label>
										</span>  &nbsp;
											<span class="badge" id="star-5"><b>${review.review_manager }</b>점</span>
										</span>
										</li>
									</ul>
								</div>				        		
				        	</td>
				        </tr>
				        <tr style="height: 50px">
				        	<td></td>
				        	<td align="center">			
							<button type="button" id="goList">목록보기</button>
<%-- <button><a 
href="${initParam.rootPath }/user/review/list?page=${cri.page }&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }&keyword=${cri.keyword }&company_id=${param.company_id}">
목록보기</a></button> --%>
						      <div class="row">
						        <div id="upDel" class="mybutton"></div> 
						      </div>
							</td>
				        </tr>
				        	  	 				
	  	 			</table>
	  	 			
	  	 		</div>
	  	 		
	  	 </div>
	  </div><!-- well -->
	</div><!-- container -->
	<!-- 댓글  -->
	<div class="row" align="center">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">REPLY</h3>
				</div>
				<c:if test="${not empty user_login_id }">
				<div class="box-body">
				    	<label for="exampleInputEmail1">작성자</label> 
					    <input class="form-control" type="text" id="newReplyWriter" value="${user_login_id }" readonly> 
						<label for="exampleInputEmail1">댓글</label> 
						<input class="form-control" type="text" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" id="replyAddBtn">댓글 등록</button>
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
				<li class="time-label" id="repliesDiv"><span class="bg-green">댓글</span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

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
	        <h4 class="modal-title"></h4>
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
	 
	</section>
	
	<!--***********************************************************
	*                                                             *
	*                           footer                            *
	*                                                             *
	************************************************************-->	
	
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-reply_no={{reply_no}} data-reply_writer={{reply_writer}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
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
	
	var review_no = ${review.review_no};
	
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
		
		getPage("${initParam.rootPath}/review/reply/"+review_no+"/"+replyPage);
		
	});
	
	
	$("#replyAddBtn").on("click",function(){
		 //alert('댓글 등록')
		 console.log("댓글 등록 클릭");
		 var replyerObj = $("#newReplyWriter");
		 var reply_writer=replyerObj.val();
		 var replytextObj = $("#newReplyText");
		 var reply_contents = replytextObj.val();
	     var review_no = $("#review_no");
		 var user_id = '${user_login_id }'; 
	     
		  $.ajax({
				type:'post',
				url:'${initParam.rootPath}/review/reply/',
				data:{"reply_writer":reply_writer,"review_no":review_no.val(),"reply_contents":reply_contents, "user_id":"dajung"},
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("${initParam.rootPath}/review/reply/"+review_no.val()+"/"+replyPage );
						//replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});
	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		console.log(">>>"+reply.find('.timeline-body').text()+"<<<");
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-reply_no"));
		
	});
	
	
	
	$("#replyModBtn").on("click",function(){
		console.log('댓글 수정 버튼 클릭');
		  
		  var reply_no = $(".modal-title").html();
		  var reply_contents = $("#replytext").val();
		  
		  console.log("수정할 번호:"+reply_no+", 수정할 내용:"+ reply_contents);
		  
		  $.ajax({
				type:'put',
				url:'${initParam.rootPath}/review/reply/'+reply_no,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({reply_contents:reply_contents}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("수정 되었습니다.");
						getPage("${initParam.rootPath}/review/reply/"+review_no+"/"+replyPage );
						reply_contents.val("");
					}
			}});
	});
	
	$("#replyDelBtn").on("click",function(){
		  console.log('댓글 삭제 버튼 클릭');
		  var reply_no = $(".modal-title").html();
		  var reply_contents = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'${initParam.rootPath}/review/reply/'+reply_no,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("삭제 되었습니다.");
						getPage("${initParam.rootPath}/review/reply/"+review_no+"/"+replyPage );
						$("#modifyModal").modal('toggle');
					}
			}});
	});
	
	
	
</script>

<script type="text/javascript">
$(function(){
		//라디오버튼 점수체크해준다.
	  	$('input:radio[name=review_possibility]:radio[value=${review.review_possibility }]').prop('checked',true);
	  	$('input:radio[name=review_welSal]:radio[value=${review.review_welSal }]').prop('checked',true);
	  	$('input:radio[name=review_balance]:radio[value=${review.review_balance }]').prop('checked',true);
	  	$('input:radio[name=review_culture]:radio[value=${review.review_culture }]').prop('checked',true);
	  	$('input:radio[name=review_manager]:radio[value=${review.review_manager }]').prop('checked',true);
	 
	  	$("input[name=review_welSal]").prop('disabled', true);//라디오버튼 비활성화시켜준다.
	  	$("input[name=review_balance]").prop('disabled', true);//라디오버튼 비활성화시켜준다.
	  	$("input[name=review_culture]").prop('disabled', true);//라디오버튼 비활성화시켜준다.
	  	$("input[name=review_manager]").prop('disabled', true);//라디오버튼 비활성화시켜준다.
	  		
	  	writerCheck();
		//loadReplyList();
		//replyWriterCheck(no);
		
		var formObj = $("form[name=readForm]");
		var review_no = $('#review_no');
	
		getPage("${initParam.rootPath}/review/reply/"+review_no.val()+"/1" );
		
		$('#goList').on("click", function() {
	  		console.log('목록보기 버튼 클릭');
	  		self.location="${initParam.rootPath }/user/review/list?page=${cri.page }"
	  					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
	  					+"&keyword=${cri.keyword }&company_id=${param.company_id}";
	  	});
		
		$("#goLogin").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "${initParam.rootPath}/review/reply/goLogin");
			formObj.submit();
		});
		
		
			
			/***************************************  
			*                                      *
			*               별점주기js                * 
			*                                      *                           
			****************************************/
			//승진기회
			var starRating1 = function() {
				var $star1 = $("#star-A"), $result1 = $star1.find("#star-1>b");
				$(document).on("focusin", "#star-A>.input", function() {
					$(this).addClass("focus");
				}).on("focusout", "#star-A>.input", function() {
					var $this1 = $(this);
					setTimeout(function() {
						if ($this1.find(":focus").length === 0) {
							$this1.removeClass("focus");
						}
					}, 100);
				}).on("change", "#star-A :radio", function() {
					$result1.text($(this).next().text());
				}).on("mouseover", "#star-A label", function() {
					$result1.text($(this).text());
				}).on("mouseleave", "#star-A>.input", function() {
					var $checked1 = $star1.find(":checked");
					if ($checked1.length === 0) {
						$result1.text("0");
					} else {
						$result1.text($checked1.next().text());
					}
				});
				
				
			};
			starRating1();
			
			//보수
			var starRating2 = function() {

				var $star2 = $("#star-B"), $result2 = $star2.find("#star-2>b");
				$(document).on("focusin", "#star-B>.input", function() {
					$(this).addClass("focus");
				}).on("focusout", "#star-B>.input", function() {
					var $this2 = $(this);
					setTimeout(function() {
						if ($this2.find(":focus").length === 0) {
							$this2.removeClass("focus");
						}
					}, 200);
				}).on("change", "#star-B :radio", function() {
					$result2.text($(this).next().text());
				}).on("mouseover", "#star-B label", function() {
					$result2.text($(this).text());
				}).on("mouseleave", "#star-B>.input", function() {
					var $checked2 = $star2.find(":checked");
					if ($checked2.length === 0) {
						$result2.text("0");
					} else {
						$result2.text($checked2.next().text());
					}
				});
			};
			starRating2();
			
			//업무와 삶의 균형
			var starRating3 = function() {
				
				var $star3 = $("#star-C"), $result3 = $star3.find("#star-3>b");
				$(document).on("focusin", "#star-C>.input", function() {
					$(this).addClass("focus");
				}).on("focusout", "#star-C>.input", function() {
					var $this3 = $(this);
					setTimeout(function() {
						if ($this3.find(":focus").length === 0) {
							$this3.removeClass("focus");
						}
					}, 300);
				}).on("change", "#star-C :radio", function() {
					$result3.text($(this).next().text());
				}).on("mouseover", "#star-C label", function() {
					$result3.text($(this).text());
				}).on("mouseleave", "#star-C>.input", function() {
					var $checked3 = $star3.find(":checked");
					if ($checked3.length === 0) {
						$result3.text("0");
					} else {
						$result3.text($checked3.next().text());
					}
				});
			};
			starRating3();
			
			//사내문화
			var starRating4 = function() {
				
				var $star4 = $("#star-D"), $result4 = $star4.find("#star-4>b");
				$(document).on("focusin", "#star-D>.input", function() {
					$(this).addClass("focus");
				}).on("focusout", "#star-D>.input", function() {
					var $this4 = $(this);
					setTimeout(function() {
						if ($this4.find(":focus").length === 0) {
							$this4.removeClass("focus");
						}
					}, 400);
				}).on("change", "#star-D :radio", function() {
					$result4.text($(this).next().text());
				}).on("mouseover", "#star-D label", function() {
					$result4.text($(this).text());
				}).on("mouseleave", "#star-D>.input", function() {
					var $checked4 = $star4.find(":checked");
					if ($checked4.length === 0) {
						$result4.text("0");
					} else {
						$result4.text($checked4.next().text());
					}
				});
			};
			starRating4();
			
			//경영진
			var starRating5 = function() {
				
				var $star5 = $("#star-E"), $result5 = $star5.find("#star-5>b");
				$(document).on("focusin", "#star-E>.input", function() {
					$(this).addClass("focus");
				}).on("focusout", "#star-E>.input", function() {
					var $this5 = $(this);
					setTimeout(function() {
						if ($this5.find(":focus").length === 0) {
							$this5.removeClass("focus");
						}
					}, 500);
				}).on("change", "#star-E :radio", function() {
					$result5.text($(this).next().text());
				}).on("mouseover", "#star-E label", function() {
					$result5.text($(this).text());
				}).on("mouseleave", "#star-E>.input", function() {
					var $checked5 = $star5.find(":checked");
					if ($checked5.length === 0) {
						$result5.text("0");
					} else {
						$result5.text($checked5.next().text());
					}
				});
			};
			starRating5();
		  	
		  	
		  	
	  	});//function()
	  	
	  	

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
	  		self.location="${initParam.rootPath }/user/review/modify?page=${cri.page }"
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
	  	}
	  
</script>
  </body>
</html>
