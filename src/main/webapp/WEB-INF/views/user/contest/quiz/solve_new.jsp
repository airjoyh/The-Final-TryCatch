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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
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
		var endTime = new Date('2018/03/28 19:37:00');
		//현재시간
		var nowTime = new Date();
		//(끝나는 시간 설정-현재시간)/1000 = 남은시간(초)
		var limitSec = (endTime.getTime() - nowTime.getTime())/1000;
		
		var hour = Math.floor(limitSec/3600);
		var min  = Math.floor((limitSec % 3600)/60);
		var sec  = Math.floor(limitSec % 60);
		
		if(hour<10 && hour>=0){var hour = '0'+hour;}
		if(min<10 && min>=0){var min = '0'+min;}
		if(sec<10 && sec>=0){var sec = '0'+sec;}
		
		var limitTime = hour+':'+min+':'+sec;
		
		if(sec<0){
			var limitTime = '00:00:00'; 
			alert('시험이 끝났습니다. 자동 제출이되며 시험결과창으로 이동합니다.');
			self.location='${initParam.rootPath}/user/contest/list';
		}
		
		$('.limit-time').text(limitTime);
		
		return limitTime;
	}
	
$(function() {
	
	var loginState = '${user_loginState}';
	if(loginState != 'login'){
		alert('로그인되지 않은 상태입니다.');
		self.location = '${initParam.rootPath}/user/main';
	}
	
	
	//timer event
	var timerId = setInterval("limitTimer()", 1000); 
	if(limitTimer()=='00:00:00'){
		clearInterval(timerId);
	}
		 
	//codemirror
	var code = $('#codeMirror-txt')[0];
	var editor = CodeMirror.fromTextArea(code, {
		val: "what the f",
		mode:"text/x-java",
		theme:"dracula",
		tabSize: 5,
		lineNumbers: true,
		scrollbarStyle: "overlay",
			//readOnly: true
			
	});
	
	
	var quiz_id = '${quiz_id}';
	var user_id = '${user_login_id}';
	var quiz_type = '${contest_quiz.quiz_type}';
	var quiz_typeSpan = $('#quiz_typeSpan');
	var questionDiv = $('#questionDiv');
	
	if(quiz_type == '1'){
		quiz_typeSpan.html('객관식');
		questionDiv.html('다음 중 알맞은 답을 선택하고 제출을 눌러주세요.');
		$('#exampleDiv').html('<c:forEach items="${exampleList }" var="example">'
								+'<input type="radio" name="item" value="${example.item }">${example.item_no}. ${example.item }<br>'
								+'</c:forEach>');
		
	}else if(quiz_type == '2'){
		questionDiv.html('다음 중 빈칸에 알맞은 답을 적고 제출을 눌러주세요.');
		quiz_typeSpan.html('주관식');
		$('#exampleDiv').html('<c:forEach items="${exampleList }" var="example">'
								+'${example.item_no}. (<input type="text" name="item" value="">)<br>'
								+'</c:forEach>');
	}else if(quiz_type== '3'){
		questionDiv.html('');
		quiz_typeSpan.html('코딩');
		$('#exampleDiv').html('<textarea name="code" cols="50" rows="20"></textarea>'
								+'<button type="button" id="compileBtn">실행</button><br>'
								+'결과 출력<textarea name="answer_contents"></textarea>');
	} 
	
	
	$('#nextQuizBtn').on("click", function(){
		//정답 등록
		//로그인이 끊겼을 경우 대비 필요.
		
		if(quiz_type == '1'){
			
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
			
		}else if(quiz_type == '2'){
			var subject_answer = $('input[name=item]');
			console.log('주관식 정답 개수 >>> '+ subject_answer.length);
			var answer = '';
			 //var arr = new Array();
			 for(var i=0; i<subject_answer.length; i++){
				 //arr.push(subject_answer[i].value)
				 answer+=subject_answer[i].value;
				 if(i < subject_answer.length-1 ){
					 answer+=',';
				 }
			 }//for
			 console.log("사용자가 작성한 주관식 정답 >>> "+answer);
			 $.ajax({
					type:'post',
					url:'${initParam.rootPath}/user/contest/quiz/answer/register',
					data:{"quiz_id":quiz_id, "user_id":user_id, "answer_contents":answer },
					success:function(result){
						if(result == 'success'){
							location.href='solve?contest_id=${contest_quiz.contest_id}&quiz_no=${quiz_no+1}';
							
						}
					}
				});//ajax 
			 
		}else if(quiz_type == '3'){
			
			var coding_answer = $('textarea[name=answer_contents]').val();
			var code = $('textarea[name=code]').val();
			
			
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
		}
		
	});//정답 등록 버튼 클릭

	$('#compileBtn').on("click", function(){
		console.log('코드 실행 버튼 클릭');
		$('textarea[name=answer_contents]').val('');
		var code = $('textarea[name=code]').val();
		
		var str = "nnclass Abc {kulbiuhulnjjlm;k;o";
		//         01234567890123456
		var className = code.substring(code.indexOf("class")+5, code.indexOf("{")-1);//(7, 12);
		//var num1 = str.indexOf("class")+5;
		//var num2 = str.indexOf("{")-1;
		console.log("클래스명:"+className);
		
		    className = className.replace(" ", "");
		
		$.ajax({
			type:'post',
			url:'${initParam.rootPath}/user/contest/quiz/answer/compile',
			data:{"code":code, "className":className },
			success:function(result){
				$('textarea[name=answer_contents]').val(result);
				//var compileResult = '${compileResult}';
				//$('textarea[name=answer_contents]').val(compileResult);
				
			},
			error:function(request, status, error){
				$('textarea[name=answer_contents]').val("code="+request.status+" message="+request.responseText+" error="+error);//실패시 처리
			}
		});
	});
	
	
	
 });
</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	
	
	<div class='container'>
	  <form id="registerForm" method="post">
	   <input type="hidden" id="user_id" name="user_id" value="${user_login_id }">
	   <input type="hidden" id="action" name="action" value="">
	   <input type="hidden" id="quiz_id" name="quiz_id" value="${quiz_id }">
	   <input type="hidden" id="contest_id" name="contest_id" value="${param.contest_id }">
		<!-- header section!!************************************************************** -->
		<div class='header'>
			<div class='section-header'>
				<div class='title-area'>
					<div class=title>${contest.contest_title }</div>
					<div class='timer'>남은시간 : 
						<span class='limit-time'>00:00:00</span>
						
					</div>
				</div>
			</div>
		</div>
		
		<!-- left section!!************************************************************** -->
		<div class='column-nav'>
			<div class='section_nav'>
				<!--<ul class='side-nav-btn'>
					<!-- for each돌려서 문제수만큼 나와야함 -->
					<!-- <li id='q1' class='end-question'>•</li>
				    <li id='q2'>•</li>
				    <li id='q3'>•</li>
				    <li id='q4'>•</li>
				    <li id='q5'>•</li>
				    <li id='q6'>•</li>
				    </ul> -->
			</div>
		</div><!-- column-nav -->
		
		<!-- mid section!!*************************************************************** -->
		<div class='column-question'>
			<div class='section_question'>
			
				<div class='title-wrapper'>
					<div class='column-title'>문제 ${quiz_no }번</div>
					<div class='column-title'>배점 (${contest_quiz.quiz_point}점)</div>
				</div>
				<div class='wrapper' style="height: 150px;">
					<i class='question-type'>*<span id="quiz_typeSpan"></span> 문항입니다.<br>문제를 잘읽고 풀어주시기 바랍니다.</i>					
					<div class='question'>${contest_quiz.quiz_contents}</div>
					<div class='question' id="questionDiv"></div>
				</div>
				
				<div class='wrapper'>
					<div class='example'>
					
						<div class='example-write'>
							<c:forEach begin="1" end="5" var="index">
								<input type="text" id='solve-${index}' placeholder="${index}번 문제의 정답을 입력하세요.">
							</c:forEach>
						</div><!-- example-write -->

					</div><!-- example -->
				</div>
			</div>
		</div><!-- column-question -->
		
		<!-- right section!!************************************************************* -->
		<div class='column-solve'>
			<div class='section-solve'>
			
					<!-- <div class='example-choice'> -->
					<div class='codeeditor'>
						<textarea id="codeMirror-txt"></textarea>
					</div>
					<div class='output'>
						<div class='output-title'>실행결과</div>
						<div class='a-btn' id='run-btn'>실행</div>
						<div class='a-btn' id='fin-btn'>제출</div>
					</div>
					<div class='output-area'>
							<textarea rows="7" disabled="disabled" placeholder="여기에 실행결과가 표시됩니다."></textarea>
					</div>
					
			</div>
		</div><!-- column-solve -->
	  </form>	
	</div><!-- container -->

</body>
</html>
