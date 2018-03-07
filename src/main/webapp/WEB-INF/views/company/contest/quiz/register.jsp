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
    			 $('div').load('obj1');
    		 }
    	 });
    	 
     });
  </script>
</head>
<body>
   <form method="post">
   <input type="hidden" name="contest_id" value="${param.contest_id }">
      문제번호: <input type="text" name="quiz_no" value="1"><br>
      문제배점: <input type="text" name="quiz_point" value="10"><br>
      문제내용: <input type="text" name="quiz_contents" value="문제를 푸세요?"><br>
      문제형식: 
          <select name="quiz_type">
             <option>==선택==</option>
             <option value="1">객관식</option>
             <option value="2">주관식</option>
             <option value="3">코딩</option>
          </select><br>
      <div></div>
      문제정답: <input type="text" name="quiz_correct" value="영환"><br>
      <input type="submit" value="확인"><br>
   </form>
</body>
</html>