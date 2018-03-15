<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업후기 글등록</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/com_review_register.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>

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
					<div class='column-title'>${param.company_id } 후기 글작성</div>
				</div>
				<form action="register" name="registerForm" method="post">
				<div class='wrapper'>
					<div class='com-qna-title'>
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
				                  class="qna-writer" id="review_writer" name="review_writer" value="${user_login_id}"
				                  style="width: 35%" readonly="readonly">
					</div>
					<div class='com-qna-good'>
						<label for="good">해당 기업의 장점을 적어주세요</label><br>
				        <textarea name="review_strong" rows="3" class="form-ta" id="review_strong"></textarea>
					</div>
					<div class='com-qna-bad'>
						<label for="bad">해당 기업의 단점을 적어주세요</label><br>
				        <textarea name="review_weak" rows="3" class="form-ta" id="review_weak"></textarea>
					</div>
					<div class='com-qna-ceo'>
						<label for="want">경영진에게 바라는점을 적어주세요</label><br>
				        <textarea name="review_toCEO" rows="3" class="form-ta" id="review_toCEO"></textarea>
					</div>
					<div class='com-qna-star'>
						<label for="starPoint" style="padding-bottom: 10px;">평점</label>
							<div class="star-line">
					            <ul class="list-group">
					               <li class="list-group-item">승진기회 및 가능성 
					               	  <span class="star-input" id="star-A" style="float: right;">
						                  <span class="input"> 
						                  <input type="radio" name="review_possibility" id="p1" value="1"> <label for="p1">1</label> 
						                  <input type="radio" name="review_possibility" id="p2" value="2"> <label for="p2">2</label> 
						                  <input type="radio" name="review_possibility" id="p3" value="3"> <label for="p3">3</label> 
						                  <input type="radio" name="review_possibility" id="p4" value="4"> <label for="p4">4</label> 
						                  <input type="radio" name="review_possibility" id="p5" value="5"> <label for="p5">5</label> 
						                  </span> &nbsp;
									 </span>
					              </li><br>
					              <li class="list-group-item">복지 및 급여 
					              	 <span class="star-input" id="star-B" style="float: right;">
					                      <span class="input"> 
					                      <input type="radio" name="review_welSal" id="p6" value="1"> <label for="p6">1</label>
					                      <input type="radio" name="review_welSal" id="p7" value="2"> <label for="p7">2</label> 
					                      <input type="radio" name="review_welSal" id="p8" value="3"> <label for="p8">3</label> 
					                      <input type="radio" name="review_welSal" id="p9" value="4"> <label for="p9">4</label> 
					                      <input type="radio" name="review_welSal" id="p10" value="5"> <label for="p10">5</label> 
					                      </span> &nbsp;
					                 </span>
					             </li><br>
					             <li class="list-group-item">업무와 삶의 균형
					              <span class="star-input" id="star-C" style="float: right;">
					                   <span class="input"> 
					                   <input type="radio" name="review_balance" id="p11" value="1"> <label for="p11">1</label>
					                   <input type="radio" name="review_balance" id="p12" value="2"> <label for="p12">2</label> 
					                   <input type="radio" name="review_balance" id="p13" value="3"> <label for="p13">3</label>
					                   <input type="radio" name="review_balance" id="p14" value="4"> <label for="p14">4</label>
					                   <input type="radio" name="review_balance" id="p15" value="5"> <label for="p15">5</label>
					                   </span> &nbsp;
					             </span>
					            </li><br>
					            <li class="list-group-item">사내문화 
					             <span class="star-input" id="star-D" style="float: right;"> 
					             	  <span class="input">
					                  <input type="radio" name="review_culture" id="p16" value="1"> <label for="p16">1</label> 
					                  <input type="radio" name="review_culture" id="p17" value="2"> <label for="p17">2</label>
					                  <input type="radio" name="review_culture" id="p18" value="3"> <label for="p18">3</label> 
					                  <input type="radio" name="review_culture" id="p19" value="4"> <label for="p19">4</label>
					                  <input type="radio" name="review_culture" id="p20" value="5"> <label for="p20">5</label>
					                  </span> &nbsp;
					            </span>
					           </li><br>
					           <li class="list-group-item">경영진 
					            <span class="star-input" id="star-E" style="float: right;"> 
					            	<span class="input">
					                <input type="radio" name="review_manager" id="p21" value="1"> <label for="p21">1</label> 
					                <input type="radio" name="review_manager" id="p22" value="2"> <label for="p22">2</label>
					                <input type="radio" name="review_manager" id="p23" value="3"> <label for="p23">3</label> 
					                <input type="radio" name="review_manager" id="p24" value="4"> <label for="p24">4</label>
					                <input type="radio" name="review_manager" id="p25" value="5"> <label for="p25">5</label>
					                </span> &nbsp;
					           </span>
					          </li>
					         </ul>
					      </div>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='register-qna' id="registBtn" onclick="validateCheck()" value='글등록'>
						<input type="button" class='register-qna' id="cancelBtn" value='취소'>
					</div>
					
					</div>
					</form>
			</div><!-- section_main1 -->
			
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
			
			
			
		<!-- modal 코드 -->
		
		<!-- 회원가입 모달 -->
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
			
		<!-- 비밀번호 찾기 모달 -->	
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

</body>
</html>
