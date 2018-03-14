<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문제푸는 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var loginState = '${user_loginState}';
	if(loginState != 'login'){
		alert('로그인되지 않은 상태입니다.');
		self.location = '${initParam.rootPath}/user/main';
	}
	
	var quiz_id = '${quiz_id}';
	var user_id = '${user_login_id}';
	var quiz_type = '${contest_quiz.quiz_type}';
	
	if(quiz_type == '1'){
		//$('#exampleLoadDiv').load('objectiveType');
		$('#exampleDiv').html('<c:forEach items="${exampleList }" var="example">'
								+'<input type="radio" name="item" value="${example.item }">${example.item_no}. ${example.item }<br>'
								+'</c:forEach>');
		
	}else if(quiz_type == '2'){
		$('#exampleDiv').html('<c:forEach items="${exampleList }" var="example">'
								+'${example.item_no}. (<input type="text" name="item" value="">)<br>'
								+'</c:forEach>');
	}else if(quiz_type== '3'){
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
<body>
	<h3>문제 푸는 곳</h3>
	문제 번호: 
	<div id="quiz_noDiv">
		${contest_quiz1.quiz_no } ${contest_quiz2.quiz_no } ${contest_quiz3.quiz_no }
	</div>
   <form id="registerForm" method="post">
   	   <input type="hidden" id="user_id" name="user_id" value="${user_login_id }">
	   <input type="hidden" id="action" name="action" value="">
	   <input type="hidden" id="quiz_id" name="quiz_id" value="${quiz_id }">
	   <input type="hidden" id="contest_id" name="contest_id" value="${param.contest_id }">
	      문제번호: <input type="text" id="quiz_no" name="quiz_no" value="${quiz_no}"><br>
	      문제배점: <input type="text" id="quiz_point" name="quiz_point" value="${contest_quiz.quiz_point}"><br>
	      문제내용: <textarea id="quiz_contents" name="quiz_contents" cols="50" rows="20">${contest_quiz.quiz_contents}</textarea><br>
	   <div id="exampleDiv"></div><br>
	   <input type="button" id="nextQuizBtn" value="정답 등록">
	   <input type="button" id="contestCompleteBtn" value="문제 풀기 종료">
	   <input type="button" value="취소">
   </form>

</body>
</html>