<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript">
     $(function(){
    	 $('select').change(function(){
    		 var sel = $('select').val();
    		 console.log(sel);
    		 if(sel=='1'){
    			 //$('select[name=quiz_type]').val('1');
    			 $('#load').load('objectiveType');
    			 
    		 }else if(sel=='2'){
    			 $('#load').load('subjectiveType');
    		 }else if(sel=='3'){
    			 $('#load').html('<textarea></textarea>');
    		 }else if(sel=='0'){
    			 $('#load').html('');
    		 }
    	 });
    	 
    	 $('#obBtn').on("click", function(){
    		 
    	 });
    	 
		$('#subBtn').on("click", function(){
    		 
    	 });
		
		//문제 추가 버튼을 눌렀을 때
		$('#quizAddBtn').on("click", function(){
			
			$('#action').val('quizAdd');
			$('form').submit();
			
		});
		
		//콘테스트 등록 완료 버튼을 눌렀을 때
		$('#contestCompleteBtn').on("click", function(){
			
			$('#action').val('contestComplete');
			$('form').submit();
			
		});
    	 
     });
     
     function validateCheck(){
    	 var contest_id = $('#contest_id');
			var quiz_no = $('#quiz_no');
			var quiz_point = $('#quiz_point');
			var quiz_contents = $('#quiz_contents');
			var quiz_type = $('select[name=quiz_type]');
			var quiz_correct = $('#quiz_correct');
			
			if(quiz_no.val()==''){
				alert('문제 번호를 입력해주세요.');
				quiz_no.focus();
			}else if(quiz_point.val()==''){
				alert('문제 배점을 입력해주세요.');
				quiz_point.focus();
			}else if(quiz_contents.val()){
				alert('문제 내용을 입력해주세요.');
				quiz_contents.focus();
			}else if(quiz_type.val()=='0'){
				alert('문제 형식을 선택해주세요.');
			}else if(quiz_correct.val()==''){
				alert('문제의 정답을 입력해주세요.');
				quiz_correct.focus();
			}
     }
  </script>
</head>
<body>
   <form id="registerForm" method="post">
   <input type="hidden" id="action" name="action" value="">
   <input type="hidden" id="contest_id" name="contest_id" value="${param.contest_id }">
      문제번호: <input type="text" id="quiz_no" name="quiz_no" value="1"><br>
      문제배점: <input type="text" id="quiz_point" name="quiz_point" value="10"><br>
      문제내용: <textarea id="quiz_contents" name="quiz_contents">문제를 푸세요.</textarea><br>
      문제형식: 
          <select name="quiz_type">
             <option value="0">==선택==</option>
             <option value="1">객관식</option>
             <option value="2">주관식</option>
             <option value="3">코딩</option>
          </select><br>
      <div id="load"></div>
      문제정답: <input type="text" id="quiz_correct" name="quiz_correct" value="영환"><br>
      <input type="button" id="quizAddBtn" value="문제 추가">
      <input type="button" id="contestCompleteBtn" value="콘테스트 등록 완료">
      <input type="button" value="취소">
   </form>
</body>
</html>