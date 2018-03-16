<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업후기 글등록</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/com_review_register.css" rel="stylesheet" type="text/css">

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
			<div class='com-contest-head'>
				<div class='title-wrapper'>
					<div class='column-title'>${param.company_id } 후기 글작성</div>
				</div>
				<form action="register" name="registerForm" method="post">
				<div class='wrapper'>
					<div class='com-review-title'>
						 	<div class="row" hidden="" >
						        <div class="input-group">
						         <input type="hidden" id="user_id" name="user_id" value="${user_login_id }">
		                         <input type="hidden" id="company_id" name="company_id" value="${param.company_id }">
						            <span class="input-group-addon">글번호</span> <input
						            	  class="form-control" id="title" name="title" type="text"
						                  style="width: 35%" placeholder="글번호 자동입력." readonly="readonly">
						            <span class="input-group-addon" style="padding-left: 3em;">작성일</span> <input
						                  class="form-control" id="writer" name="writer"
						                  style="width: 35%" placeholder="yy-mm-dd hh-MM-ss">
						        </div>
						    </div>
							<span class="input-group-addon">제목</span>&nbsp;&nbsp;&nbsp; <input
				                  class="qna-title" id="review_title" name="review_title" type="text"
				                  style="width: 35%" placeholder="제목을 입력하세요.">
				            <span class="input-group-addon" style="padding-left: 3em;">작성자</span> <input
				                  class="qna-writer" id="review_writer" name="review_writer"
				                  style="width: 35%">
					</div>
					<div class='com-review-good'>
						<label for="good">해당 기업의 장점을 적어주세요</label><br>
				        <textarea name="review_strong" rows="3" class="form-ta" id="review_strong"></textarea>
					</div>
					<div class='com-review-bad'>
						<label for="bad">해당 기업의 단점을 적어주세요</label><br>
				        <textarea name="review_weak" rows="3" class="form-ta" id="review_weak"></textarea>
					</div>
					<div class='com-review-ceo'>
						<label for="want">경영진에게 바라는점을 적어주세요</label><br>
				        <textarea name="review_toCEO" rows="3" class="form-ta" id="review_toCEO"></textarea>
					</div>
					<div class='com-review-star'>
						<label for="starPoint" style="padding-bottom: 10px;">평점</label>
						<div class="star-line">
							<ul class="list-group">
								<li class="list-group-item">승진기회 및 가능성 <span
									class="star-input" id="star-A" style="float: right;"> 
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
									</span> &nbsp; <span class="badge" id="star-1"><b>${review.review_possibility }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">복지 및 급여 <span
									class="star-input" id="star-B" style="float: right;"> 
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
									</span> &nbsp; <span class="badge" id="star-2"><b>${review.review_welSal }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">업무와 삶의 균형 <span
									class="star-input" id="star-C" style="float: right;"> 
									<span class="input"> 
									<input type="radio" name="review_balance" id="p11" value="1"> 
									<label for="p11">1</label> 
									<input type="radio" name="review_balance" id="p12" value="2"> 
									<label for="p12">2</label> 
									<input type="radio" name="review_balance" id="p13" value="3"> 
									<label for="p13">3</label> 
									<input type="radio" name="review_balance" id="p14" value="4"> 
									<label for="p14">4</label> 
									<input type="radio" name="review_balance" id="p15" value="5"> 
									<label for="p15">5</label>
									</span> &nbsp; <span class="badge" id="star-3"><b>${review.review_balance }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">사내문화 <span class="star-input"
									id="star-D" style="float: right;"> 
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
									</span> &nbsp; <span class="badge" id="star-4"><b>${review.review_culture }</b>점</span>
								</span>
								</li>
								<br>
								<li class="list-group-item">경영진 <span class="star-input"
									id="star-E" style="float: right;">
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
									</span> &nbsp; <span class="badge" id="star-5"><b>${review.review_manager }</b>점</span>
								</span>
								</li>
							</ul>
						</div>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='register-btn' id="registBtn" onclick="validateCheck()" value='글등록'>
						<input type="button" class='register-btn' id="cancelBtn" value='취소'>
					</div>
					
					</div>
					</form>
			</div><!-- section_main1 -->
			
		</div><!-- column-left -->
		
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
		<%@ include file="../../user_modals_new.jsp" %>	
			
</div>			


<!-- 임시 js -->
<script type="text/javascript">
$(function() {

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

});

function validateCheck() {
	var f = document.registerForm;
	//console.log($('input[name=review_possibility]').val());
	if ($('form[name=registerForm] input[name=review_title]').val() == '') {
		alert('제목을 입력하세요.');
		f.review_title.focus();

	} else if ($('form[name=registerForm] input[name=review_writer]').val() == '') {
		alert('작성자를 입력하세요.');
		f.review_writer.focus();

	} else if ($('form[name=registerForm] textarea[name=review_strong]').val() == '') {
		alert('기업의 장점을 입력하세요.');
		f.review_strong.focus();

	} else if ($('form[name=registerForm] textarea[name=review_weak]').val() == '') {
		alert('기업의 단점을 입력하세요.');
		f.review_weak.focus();

	} else if ($('form[name=registerForm] textarea[name=review_toCEO]').val() == '') {
		alert('경영진에게 바라는 점을 입력하세요.');
		f.review_toCEO.focus();

	} else if (f.review_possibility.value == '') {
		alert('승진 기회 및 가능성에 대한 점수를 매겨주세요.');

	} else if (f.review_welSal.value == '') {
		alert('복지와 급여에 대한 점수를 매겨주세요.');

	} else if (f.review_balance.value == '') {
		alert('업무와 삶의 균형에 대한 점수를 매겨주세요..');

	} else if (f.review_culture.value == '') {
		alert('사내문화에 대한 점수를 매겨주세요.');

	} else if (f.review_manager.value == '') {
		alert('경영진에 대한 점수를 매겨주세요.');

	} else {
		document.registerForm.submit();
	}
}

$('#cancelBtn').on('click',function(){
	
	self.location="${initParam.rootPath}/user/review/list?company_id=${param.company_id}";

});
</script>
</body>
</html>
