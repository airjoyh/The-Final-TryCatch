<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아무의미없는 jsp</title>
</head>
<link href="/resources/jqueryui/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/resources/jqueryui/jquery-ui.js"></script>
<script>
 $(function(){
     //클릭이벤트를 위한 a 태그에 버튼UI 적용
  $("#modalbutton").button();
 
  //dialogLayout레이아웃을 다이얼로그라고 정의
  $("#dialogLayout").dialog({
      //이벤트발생시 open해주기 위하여 false 로 지정
      autoOpen: false,
      //다이얼로그의 넓이지정
      width: 500,
      //버튼 설정
      buttons: [{
              text: "확인",
              click: function() {
                  $(this).dialog("close");
              }
      },{
          text: "취소",
          click: function() {
              $(this).dialog("close");
          }
      }]
  });
  
  //버튼 클릭시
  $("#modalbutton").click(function(e) {
      //dialogLayout 레이아웃내에 정의된 내용을 다이얼로그를 이용하여 OPEN
      $("#dialogLayout").dialog("open");
      e.preventDefault();
  });
 });
</script>
</head>
<body>
 <!--버튼UI적용을 위한 A태그 -->
 <p><a href="#" id="modalbutton">모달띄우기</a></p>
  
 <!-- 클릭이벤트 발생시 다이얼로그창에 띄워줄 레이어-->
 <div id="dialogLayout" title="이곳은 모달창 상단 제목 부분입니다.(title) ">
     <p>디자인이 심플하고 깔끔한 jqueryUI의 레이아웃 팝업창(모달창) 입니다.<br/>
      드래그 기능도 지원 됩니다.<br/>
      감사합니다.  
  </p>
 </div>
</body>

출처: http://sgroom.tistory.com/146 [★GuGu STORY★]