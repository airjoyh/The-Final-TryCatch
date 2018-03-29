<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<title>그리드 테스트</title>

	<!-- CSS -->
	<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
	<link href="${initParam.rootPath }/resources/css/solve.css" rel="stylesheet" type="text/css">
	<link href="${initParam.rootPath }/resources/css/codemirror.css" rel="stylesheet" type="text/css">
	<link href="${initParam.rootPath }/resources/css/dracula.css" rel="stylesheet" type="text/css">
	<link href="${initParam.rootPath }/resources/css/simplescrollbars.css" rel="stylesheet" type="text/css">

	<!-- font -->
	<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro:500" rel="stylesheet">
	<!-- JS,JQUERY -->
	<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${initParam.rootPath }/resources/js/codemirror.js"></script>
	<script type="text/javascript" src="${initParam.rootPath }/resources/js/simplescrollbars.js"></script>
	<script type="text/javascript" src="${initParam.rootPath }/resources/js/javascript.js"></script>
	<script type="text/javascript" src="${initParam.rootPath }/resources/js/css.js"></script>
	<script type="text/javascript" src="${initParam.rootPath }/resources/js/clike.js"></script>


	<style>
	</style>
<script type="text/javascript">
		//제한시간 타이머
		function limitTimer() {
			//끝나는 시간 설정
			var endTime = new Date('2018/03/30 19:37:00');
			//현재시간
			var nowTime = new Date();
			//(끝나는 시간 설정-현재시간)/1000 = 남은시간(초)
			var limitSec = (endTime.getTime() - nowTime.getTime()) / 1000;

			var hour = Math.floor(limitSec / 3600);
			var min = Math.floor((limitSec % 3600) / 60);
			var sec = Math.floor(limitSec % 60);

			if (hour < 10 && hour >= 0) {
				var hour = '0' + hour;
			}
			if (min < 10 && min >= 0) {
				var min = '0' + min;
			}
			if (sec < 10 && sec >= 0) {
				var sec = '0' + sec;
			}

			var limitTime = hour + ':' + min + ':' + sec;

			if (sec < 0) {
				var limitTime = '00:00:00';
				alert('시험이 끝났습니다. 자동 제출이되며 시험결과창으로 이동합니다.');
				window.open("main", "_self");
			}

			$('.limit-time').text(limitTime);

			return limitTime;
		}

	$(function() {
		
		//timer event
		var timerId = setInterval("limitTimer()", 1000);
		if (limitTimer() == '00:00:00') {
			clearInterval(timerId);
		}

		
		var loginState = '${user_loginState}';
		if(loginState != 'login'){
			alert('로그인되지 않은 상태입니다.');
			self.location = '${initParam.rootPath}/user/main';
		}
		
		var quiz_id = '${quiz_id}';
		var user_id = '${user_login_id}';
		var quiz_type = '${contest_quiz.quiz_type}';
		
		$('#nextQuizBtn').on("click", function(){
			var object_answer = $('input:radio[name="item"]:checked').val();
			console.log('사용자가 선택한 객관식 정답 >>> '+object_answer);
			if(object_answer == 'undefined'){
				alert('정답을 입력하지 않았습니다.');			
			}else{
				$.ajax({
					type:'post',
					url:'${initParam.rootPath}/user/contest/quiz/answer/register',
					data:{"quiz_id":quiz_id, "user_id":user_id, "answer_contents":object_answer},
					success:function(result){
						if(result == 'success'){
							location.href='solve?contest_id=${contest_quiz.contest_id}&quiz_no=${quiz_no+1}';
							
						}
					}
				});//ajax
				
			}//else
		});//정답 등록 버튼 클릭
	});
</script>
</head>
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<body>


	<div class='container'>

		<!-- header section!!************************************************************** -->
		<div class='header'>
			<div class='section-header'>
				<div class='title-area'>
					<div class=title>${contest_quiz.company_name } - ${contest_quiz.contest_title }</div>
					<div class='timer'>남은시간 :
						<span class='limit-time'>00:00:00</span>
					</div>
				</div>
			</div>
		</div>

		<!-- nav section!!************************************************************** -->
		<div class='header'>
			<div class='section-header'>
				<div class='nav-icon' style="float:left;">
					<img src="${initParam.rootPath }/resources/image/ing/left-btn.svg">
				</div>
				<div class='nav-list'>
					<ul>
					<c:forEach begin="1" end="${quizCount }" var="index">
						<li>
							<div>문제 ${index }</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class='nav-icon' style="float:right;">
					<img src="${initParam.rootPath }/resources/image/ing/right-btn.svg">
				</div>
			</div>
		</div>

		<!-- mid section!!*************************************************************** -->
		<div class='column-question2'>
			<div class='section_question2'>

				<div class='title-wrapper'>
					<!-- 총 문항수 EL들어가야함 -->
					<div class='column-title'>문제 ${quiz_no }번/${quizCount }번<span style="padding-left: 20px;"> 배점 : </span></div>
				</div>
				<div class='wrapper' style="height: 50px;">
					<i class='question-type'>*<span>객관식</span> 문항입니다.<br>문제를 잘읽고 풀어주시기 바랍니다.</i>
					<!-- <div class='question'>다음중 빈칸에 알맞은 자료형은?</div> -->
				</div>

				<div class='wrapper'>
					<div class='example'>
						<div class='example-choice'>
							<pre>${contest_quiz.quiz_contents }</pre>
						</div>
						<!-- example-write -->
					</div>
					<!-- example -->
				</div>
			</div>
		</div>
		<!-- column-question -->

		<!-- right section!!************************************************************* -->
		<div class='column-solve2'>
			<div class='section-input'>
				<ul class="example-list">

					<c:forEach items="${exampleList }" var="example" >
					<li>
						<div class="pure-radiobutton">
							<input type="radio" id="radio${example.item_no}" class="radio" name="item" value="${example.item }">
							<label for="radio${example.item_no}">${example.item }</label>
						</div>
					</li>
					</c:forEach>

				</ul>
			</div>
			<div class='next-btn-area'>
				<div class="next-btn" id="nextQuizBtn">제출</div>
			</div>
		</div>
		<!-- column-solve -->

	</div>
	<!-- container -->

</body>
</html>
