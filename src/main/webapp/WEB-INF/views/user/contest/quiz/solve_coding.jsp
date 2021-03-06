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
	
	<!-- ICON -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
			var endDate = '${endDate}';
			
			var endTime = new Date(endDate);
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

			//codemirror
			var code = $('#codeMirror-txt')[0];
			var editor = CodeMirror.fromTextArea(code, {
				//val: "what the f",
				mode: "text/x-java",
				theme: "dracula",
				tabSize: 5,
				lineNumbers: true,
				scrollbarStyle: "overlay",
				//readOnly: true

			});
			
			var loginState = '${user_loginState}';
			if(loginState != 'login'){
				alert('로그인되지 않은 상태입니다.');
				self.location = '${initParam.rootPath}/user/main';
			}
			
			
			var quiz_id = '${quiz_id}';
			var user_id = '${user_login_id}';
			var quiz_type = '${contest_quiz.quiz_type}';
			
			
			$('#compileBtn').on("click", function(){
				console.log('코드 실행 버튼 클릭');
				$('#answer_contents').val('');
				//var code = $('textarea[name=code]').text();
				var code = editor.getValue();
				console.log('code >>> '+code);
				var str = "nnclass Abc {kulbiuhulnjjlm;k;o";
				//         01234567890123456
				var className = code.substring(code.indexOf("class")+5, code.indexOf("{")).replace(/(\s*)/g, "");//(7, 12);
				//var num1 = str.indexOf("class")+5;
				//var num2 = str.indexOf("{")-1;
				console.log("클래스명:"+className);
				
				    className = className.replace(" ", "");
				
				$.ajax({
					type:'post',
					url:'${initParam.rootPath}/user/contest/quiz/answer/compile',
					data:{"code":code, "className":className },
					success:function(result){
						
						$('#answer_contents').text(result);
						//var compileResult = '${compileResult}';
						//$('textarea[name=answer_contents]').val(compileResult);
						
					},
					error:function(request, status, error){
						$('#answer_contents').val("code="+request.status+" message="+request.responseText+" error="+error);//실패시 처리
					}
				});
				
			});//컴파일 버튼 클릭
			
			
			$('#nextQuizBtn').on("click", function(){
				var coding_answer = $('#answer_contents').text();
				var code = editor.getValue();
				
				
				$.ajax({
					type:'post',
					url:'${initParam.rootPath}/user/contest/quiz/answer/register',
					data:{"quiz_id":quiz_id, "user_id":user_id, "answer_contents":coding_answer,
						"quiz_type":quiz_type,"code":code},
					success:function(result){
						if(result == 'success'){
							location.href='solve?contest_id=${contest_quiz.contest_id}&quiz_no=${quiz_no+1}';
							
						}
					}
				});//ajax 
				
			});//정답 등록 버튼 클릭

		});//function
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
		<div class='column-question'>
			<div class='section_question'>

				<div class='title-wrapper'>
					<!-- 총 문항수 EL들어가야함 -->
					<div class='column-title'>문제 ${quiz_no }번/${quizCount }번<span style="padding-left: 20px;"> 배점 : </span></div>
				</div>
				<div class='wrapper' style="height: 50px;">
					<i class='question-type'>*<span>코딩형</span> 문항입니다.<br>문제를 잘읽고 풀어주시기 바랍니다.<br>*주의-패키지명은 입력하지 말아주십시오</i>
					<!-- <div class='question'>다음중 빈칸에 알맞은 자료형은?</div> -->
				</div>

				<div class='wrapper'>
					<div class='example'>
						<div class='example-coding'>
							${contest_quiz.quiz_contents }
						</div>
						<!-- example-write -->
					</div>
					<!-- example -->
				</div>
			</div>
		</div>
		<!-- column-question -->

		<!-- right section!!************************************************************* -->
		<div class='column-solve'>
			<div class='section-solve'>

				<!-- <div class='example-choice'> -->
				<div class='codeeditor'>
					<textarea id="codeMirror-txt" name="code"></textarea>
				</div>
				<div class='output'>
					<div class='output-title'>실행결과</div>
					<div class='a-btn' id='compileBtn'>실행</div>
					<div class='a-btn' id='nextQuizBtn'>제출</div>
				</div>
				<div class='output-area'>
					<!-- <textarea rows="7" disabled="disabled" placeholder="여기에 실행결과가 표시됩니다."></textarea> -->
					<pre style="padding:20px;" id="answer_contents">여기에 실행결과가 표시됩니다.</pre>
				</div>

			</div>
		</div>
		<!-- column-solve -->

	</div>
	<!-- container -->

</body>
</html>
