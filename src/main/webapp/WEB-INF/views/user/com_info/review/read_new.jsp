<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업후기 상세정보</title>


<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/community_read_sw.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/reply.css" rel="stylesheet" type="text/css">


<!-- 핸들바js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


</head>
<body>
	<!-- nav-area -->
	<%@ include file="../../../user-nav_new.jsp"%>

	<div class='container'>
		<!-- left section!!************************************************************** -->
		<div class='column-left'>
			<div class="section_com_read">
				<div class='title-wrapper'>
					<div class='column-title'>기업후기 글상세보기</div>
				</div>
				<div class='wrapper-com-review-read'>
					<form id="readForm" name="readForm" method="POST">
						<input type="hidden" id="review_no" name="review_no"
							value="${review.review_no }"> <input type="hidden"
							name="writer_id" value="${review.user_id }"> <input
							type="hidden" id="company_id" name="company_id"
							value="${param.company_id }"> <input type='hidden'
							name='page' value="${cri.page}"> <input type='hidden'
							name='perPageNum' value="${cri.perPageNum}"> <input
							type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
					</form>
					<div class='com-review-title-box'>
						<div class="row2">
							<div class="row2-top-title">
							<div class="title-title" id="title" name="title">
								${review.review_title }</div>
							</div>
						</div>
						<div class="row1">
							<div class="row1-top-date">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.review_wdate}" />
							</div>
							<div class="row1-top-datas">
							<div class="row1-top-data">작성자<input class="writer"  type="text"
								id="writer" name="writer"
								value="${review.review_writer }" readonly="readonly">
							</div>
							<div class="row1-top-data">조회수<input
								class="title-title" id="viewCount" name="viewCount" type="text"
								value="${review.review_viewCount }" readonly="readonly">
							</div> 
							</div>
						</div>
					</div>
					<div class="wrapper-com-review-content">
					<div class='com-re-content-li'>
						<label for="good">장점</label>
						<div class="com-re-content-text">
						<span name="strong" class="form-ta" id="good">${review.review_strong }</span>
						</div>
					</div>
					<div class='com-re-content-li'>
						<label for="bad">단점</label>
						<div class="com-re-content-text">
						<span name="weak" class="form-ta" id="bad">${review.review_weak }</span>
						</div>
					</div>
					<div class='com-re-content-li'>
						<label for="want">경영진에게 바라는점</label>
						<div class="com-re-content-text">
						<span name="toCEO" class="form-ta" id="want">${review.review_toCEO }</span>
						</div>
					</div>
					</div>
					
					<div class="wrapper-com-review-content">
					<div class='com-review-star'>
						<label for="starPoint">평점</label>
							<ul class="list-group">
								<li class="list-group-item">승진기회 및 가능성 <span
									class="star-input" id="star-A" style="float: right;"> <span
										class="input"> <input type="radio"
											name="review_possibility" id="p1" value="1"> <label
											for="p1">1</label> <input type="radio"
											name="review_possibility" id="p2" value="2"> <label
											for="p2">2</label> <input type="radio"
											name="review_possibility" id="p3" value="3"> <label
											for="p3">3</label> <input type="radio"
											name="review_possibility" id="p4" value="4"> <label
											for="p4">4</label> <input type="radio"
											name="review_possibility" id="p5" value="5"> <label
											for="p5">5</label>
									</span> &nbsp; <span class="badge" id="star-1"><b>${review.review_possibility }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">복지 및 급여 <span
									class="star-input" id="star-B" style="float: right;"> <span
										class="input"> <input type="radio" name="review_welSal"
											id="p6" value="1"> <label for="p6">1</label> <input
											type="radio" name="review_welSal" id="p7" value="2">
											<label for="p7">2</label> <input type="radio"
											name="review_welSal" id="p8" value="3"> <label
											for="p8">3</label> <input type="radio" name="review_welSal"
											id="p9" value="4"> <label for="p9">4</label> <input
											type="radio" name="review_welSal" id="p10" value="5">
											<label for="p10">5</label>
									</span> &nbsp; <span class="badge" id="star-2"><b>${review.review_welSal }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">업무와 삶의 균형 <span
									class="star-input" id="star-C" style="float: right;"> <span
										class="input"> <input type="radio"
											name="review_balance" id="p11" value="1"> <label
											for="p11">1</label> <input type="radio" name="review_balance"
											id="p12" value="2"> <label for="p12">2</label> <input
											type="radio" name="review_balance" id="p13" value="3">
											<label for="p13">3</label> <input type="radio"
											name="review_balance" id="p14" value="4"> <label
											for="p14">4</label> <input type="radio" name=review_balance
											id="p15" value="5"> <label for="p15">5</label>
									</span> &nbsp; <span class="badge" id="star-3"><b>${review.review_balance }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">사내문화 <span class="star-input"
									id="star-D" style="float: right;"> <span class="input">
											<input type="radio" name="review_culture" id="p16" value="1">
											<label for="p16">1</label> <input type="radio"
											name="review_culture" id="p17" value="2"> <label
											for="p17">2</label> <input type="radio" name="review_culture"
											id="p18" value="3"> <label for="p18">3</label> <input
											type="radio" name="review_culture" id="p19" value="4">
											<label for="p19">4</label> <input type="radio"
											name="review_culture" id="p20" value="5"> <label
											for="p20">5</label>
									</span> &nbsp; <span class="badge" id="star-4"><b>${review.review_culture }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">경영진 <span class="star-input"
									id="star-E" style="float: right;"> <span class="input">
											<input type="radio" name="review_manager" id="p21" value="1">
											<label for="p21">1</label> <input type="radio"
											name="review_manager" id="p22" value="2"> <label
											for="p22">2</label> <input type="radio" name="review_manager"
											id="p23" value="3"> <label for="p23">3</label> <input
											type="radio" name="review_manager" id="p24" value="4">
											<label for="p24">4</label> <input type="radio"
											name="review_manager" id="p25" value="5"> <label
											for="p25">5</label>
									</span> &nbsp; <span class="badge" id="star-5"><b>${review.review_manager }</b>점</span>
								</span>
								</li>
							</ul>
					</div>
					</div>
					
					<div class='board-read-buttons' align="center">
						<input type="button" class='board-read-button-toList' id="goList" value='목록보기'>
						<div class="board-read-button-myBtns">
							<span id="upDel" class=""></span>
						</div>
					</div>
					
				</div>
				<!-- wrapper -->
			</div>
			<!-- section_main -->
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
										<input type="hidden" id="reply_user_id" value="${user_login_id }">
										<input class="fake-reply-writer" type="text" id="newReplyWriter"> 
										</div>
									</div>
									<div class="reply-writecontent">
										<div class="reply-content-contents">
										<textarea name="reply-content" id="newReplyText"
											class="content" placeholder="댓글을 입력하세요"
											style="overflow: hidden; height: 50px; word-wrap: break-word; width: 100%;  border: 1px solid lightgray; resize: none; margin-top: 5px;"></textarea>
										</div>
									</div>
									<div class="reply-writecontent">
										<div class="reply-content-button">
 											<input type="submit" id="replyAddBtn" value="댓글 등록">
<!-- 										<button type="submit" class="reply-btn" id="replyAddBtn">등록</button> -->
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
<!-- 						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin ">

							</ul>
						</div> -->

					</div> 
					
				</div><!-- /row -->

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
			</div>
			<!-- section_main2 -->
		</div>
		<!-- column-left -->

		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../../login_before_new.jsp"%>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../../login_after_new.jsp"%>
			</div>
		</div>
		<!-- column-right -->



		<!-- modal 코드 -->
		<%@ include file="../../user_modals_new.jsp"%>
	</div>
	<!-- container -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-reply_no={{reply_no}} data-reply_writer={{reply_writer}} data-user_id={{user_id}}>
<div class="time_comment_box">
		<div class="time_area">
			<div class="time_info">
				<p><b>글번호</b>&nbsp;:&nbsp;{{reply_no}}&nbsp;&nbsp;<b>작성자</b>&nbsp;:&nbsp;{{reply_writer}} </p>
			</div>
	{{#eqReply_writer reply_writer}}
			<div class="time_tool">
				 <span><a href="#modifyModal">Modify</a>&nbsp;&nbsp;</span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;{{prettifyDate reply_wdate}}
			</div>
	{{/eqReply_writer}}
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

		Handlebars.registerHelper("eqReply_writer", function(user_id,
				block) {
			var accum = '';
			var reply_user_id = $('#reply_user_id').val(); 
			//alert(reply_user_id);
			
			if (user_id == '${user_login_id}') {
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
				printPaging(data.pageMaker, $(".reply-pagination"));

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

		$(".reply-pagination").on("click","li a",function(event) {
					event.preventDefault();

					replyPage = $(this).attr("href");
					console.log(replyPage);

					getPage("${initParam.rootPath}/review/reply/" + review_no
							+ "/" + replyPage);

				});

		$("#replyAddBtn").on("click",function() {
					//alert('댓글 등록')
					console.log("댓글 등록 클릭");
					var replyerObj = $("#newReplyWriter");
					var reply_writer = replyerObj.val();
					var replytextObj = $("#newReplyText");
					var reply_contents = replytextObj.val();
					var review_no = $("#review_no");
					var user_id = '${user_login_id }';

					$.ajax({
						type : 'post',
						url : '${initParam.rootPath}/review/reply/',
						data : {
							"reply_writer" : reply_writer,
							"review_no" : review_no.val(),
							"reply_contents" : reply_contents,
							"user_id" : user_id
						},
						success : function(result) {
							console.log("result: " + result);
							if (result == 'success') {
								alert("등록 되었습니다.");
								replyPage = 1;
								getPage("${initParam.rootPath}/review/reply/"
										+ review_no.val() + "/" + replyPage);
								replyerObj.val("");
								replytextObj.val("");
								//Obj.val("");
							}
						}
					});
				});
		$(".timeline").on("click", ".replyLi", function(event) {

			var reply = $(this);
			console.log(">>>" + reply.find('.timeline-body').text() + "<<<");
			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-reply_no"));

		});

		$("#replyModBtn").on("click",function() {
					console.log('댓글 수정 버튼 클릭');

					var reply_no = $(".modal-title").html();
					var reply_contents = $("#replytext").val();

					console.log("수정할 번호:" + reply_no + ", 수정할 내용:"
							+ reply_contents);

					$.ajax({
						type : 'put',
						url : '${initParam.rootPath}/review/reply/' + reply_no,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PUT"
						},
						data : JSON.stringify({
							reply_contents : reply_contents
						}),
						dataType : 'text',
						success : function(result) {
							console.log("result: " + result);
							if (result == 'success') {
								alert("수정 되었습니다.");
								getPage("${initParam.rootPath}/review/reply/"
										+ review_no + "/" + replyPage);
								//reply_contents.val("");
								$("#modifyModal").fadeOut();
								self.location = "${initParam.rootPath }/user/review/read?page=${cri.page }"
									+ "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
									+ "&keyword=${cri.keyword }&company_id=${param.company_id}&no=${review.review_no }";
							}
						}
					});
				});

		$("#replyDelBtn").on("click",function() {
					console.log('댓글 삭제 버튼 클릭');
					var reply_no = $(".modal-title").html();
					var reply_contents = $("#replytext").val();

					$.ajax({
						type : 'delete',
						url : '${initParam.rootPath}/review/reply/' + reply_no,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : 'text',
						success : function(result) {
							console.log("result: " + result);
							if (result == 'success') {
								alert("삭제 되었습니다.");
								getPage("${initParam.rootPath}/review/reply/"
										+ review_no + "/" + replyPage);
								$("#modifyModal").fadeOut();
								self.location = "${initParam.rootPath }/user/review/read?page=${cri.page }"
									+ "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
									+ "&keyword=${cri.keyword }&company_id=${param.company_id}&no=${review.review_no }";
							}
						}
					});
				});
	</script>

	<script type="text/javascript">
		$(function() {
			//라디오버튼 점수체크해준다.
			$(
					'input:radio[name=review_possibility]:radio[value=${review.review_possibility }]')
					.prop('checked', true);
			$(
					'input:radio[name=review_welSal]:radio[value=${review.review_welSal }]')
					.prop('checked', true);
			$(
					'input:radio[name=review_balance]:radio[value=${review.review_balance }]')
					.prop('checked', true);
			$(
					'input:radio[name=review_culture]:radio[value=${review.review_culture }]')
					.prop('checked', true);
			$(
					'input:radio[name=review_manager]:radio[value=${review.review_manager }]')
					.prop('checked', true);

			$("input[name=review_welSal]").prop('disabled', true);//라디오버튼 비활성화시켜준다.
			$("input[name=review_balance]").prop('disabled', true);//라디오버튼 비활성화시켜준다.
			$("input[name=review_culture]").prop('disabled', true);//라디오버튼 비활성화시켜준다.
			$("input[name=review_manager]").prop('disabled', true);//라디오버튼 비활성화시켜준다.

			writerCheck();
			//loadReplyList();
			//replyWriterCheck(no);

			var formObj = $("form[name=readForm]");
			var review_no = $('#review_no');

			getPage("${initParam.rootPath}/review/reply/" + review_no.val()
					+ "/1");

			$('#goList').on("click",function() {
								console.log('목록보기 버튼 클릭');
								self.location = "${initParam.rootPath }/user/review/list?page=${cri.page }"
										+ "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
										+ "&keyword=${cri.keyword }&company_id=${param.company_id}";
							});

			$("#goLogin").on("click",function() {
						formObj.attr("method", "get");
						formObj.attr("action",
								"${initParam.rootPath}/review/reply/goLogin");
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
		function writerCheck() {
			var user_login_id = '${user_login_id}';
			//alert(login_id)
			var writer_id = document.readForm.writer_id.value;

			console.log('로그인한 아이디 >>> ' + user_login_id);
			console.log('작성한 아이디 >>> ' + writer_id);

			var no = document.getElementById('review_no').innerHTML;

			//alert("로그인한 아이디: "+login_id+"/작성자 아이디: "+writer_id+"/후기번호:"+no);

			if (user_login_id == writer_id) {//일치하면 수정 삭제 버튼 나오게.
				//var upDel = document.getElementById('upDel');
				$('#upDel')
						.html(
								'<button type=buttion class="board-read-button-myBtn" id="update" onclick="modifyReview()">수정</button>'
										+ '<button type=button class="board-read-button-myBtn" id="delete" onclick="removeReview()">삭제</button>');
			}
		}

		//게시글 수정 버튼 클릭
		function modifyReview() {
			self.location = "${initParam.rootPath }/user/review/modify?page=${cri.page }"
					+ "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
					+ "&keyword=${cri.keyword }&company_id=${param.company_id}&no=${review.review_no }";
		}

		//게시글 삭제 버튼 클릭
		function removeReview() {

			if (confirm('정말로 삭제하시겠습니까?')) {
				self.location = "${initParam.rootPath }/user/review/remove?page=${cri.page }"
						+ "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
						+ "&keyword=${cri.keyword }&company_id=${param.company_id}&no=${review.review_no }";
			}
		}
	</script>
</body>
</html>
