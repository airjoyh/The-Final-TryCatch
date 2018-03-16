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
		var endTime = new Date('2018/03/17 19:37:00');
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
			window.open("main", "_self");
		}
		
		$('.limit-time').text(limitTime);
		
		return limitTime;
	}
	
	 $(function() {
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
					<div class=title>제1회 삼성 - 천하제일 코딩대회</div>
					<div class='timer'>남은시간 : 
						<span class='limit-time'>00:00:00</span>
						
					</div>
				</div>
			</div>
		</div>
		
		<!-- left section!!************************************************************** -->
		<div class='column-nav'>
			<div class='section_nav'>
				<ul class='side-nav-btn'>
					<!-- for each돌려서 문제수만큼 나와야함 -->
					<li id='q1' class='end-question'>•</li>
				    <li id='q2'>•</li>
				    <li id='q3'>•</li>
				    <li id='q4'>•</li>
				    <li id='q5'>•</li>
				    <li id='q6'>•</li>
				    </ul>
			</div>
		</div><!-- column-nav -->
		
		<!-- mid section!!*************************************************************** -->
		<div class='column-question'>
			<div class='section_question'>
			
				<div class='title-wrapper'>
					<div class='column-title'>문제 1번</div>
				</div>
				<div class='wrapper' style="height: 150px;">
					<i class='question-type'>*<span>객관식</span> 문항입니다.<br>문제를 잘읽고 풀어주시기 바랍니다.</i>
					<div class='question'>다음중 빈칸에 알맞은 자료형은?</div>
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
			
	</div><!-- container -->

</body>
</html>
