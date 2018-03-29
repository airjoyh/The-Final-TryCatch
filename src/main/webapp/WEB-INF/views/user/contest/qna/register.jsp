<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 Q&A 글작성</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/contest_qna_register.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/community_register_sw.css" rel="stylesheet" type="text/css">


<style>
.simple-table{
	position: relative;
	text-align: left;
	font-size: 15px;
	border-bottom: 1px solid #bbb;
}
.simple-table .tbl-h1{
	width: 80%;
}
.simple-table .tbl-h2{
	width: 20%;
}

</style>
<script type="text/javascript">

</script>
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
           
                <div class='section-board-registe'>
                      <div class='title-wrapper'>
                           <div class='column-title'>콘테스트 Q&A 글작성</div>
                      </div>
                <div class='board-register-wrapper'>
                <div class="board-register-box">
                      
                      
                <form action="register" name="registerForm" method="post">
                      
                           <div class='board-register-top'>
                                      <div class="row" hidden="" >
                                   <input id="contest_id" name="contest_id" value="${param.contest_id }" type="hidden">
                                     </div>
                                       <div class='board-register-top-input'>
                                                 <label>제목</label>
                                                 <input class=" " id="qna_title" name="qna_title" type="text"
                                                    placeholder="제목을 입력하세요.">
                                  </div>
                                  <div class='board-register-top-input'>
                                             <label>작성자</label>
                                             <input class="board-register-top-input" id="qna_writer" name="qna_writer" type="text"
                                        			readonly="readonly" value="${user_login_id }" style="border:none;">
                                   </div>
                           	</div>
                           <div class='board-register-write'>
							 <div class='board-register-write-box'>
								<label class="" for="community_contents">글 내용</label><br>
                              	<textarea name="qna_contents" class="form-ta" id="qna_contents"></textarea>
                          	 </div>
							</div>
                           <div class="board-register-button">
                                 <div class='board-register-button-box' align="center">
                                 <input type="button" class='register-bottom-button' id="regist" onclick="validateCheck()" value='글 등록'>
                                 <input type="button" class='register-bottom-button' id="cancel" value='취소'>
                           </div>
                           </div>
                      </form>
                      </div>
                      </div>
                      
                </div><!-- section_main1 -->
                
           </div><!-- column-left -->

		   <!-- right section!!************************************************************** -->
      <div class='column-right'>
         <div id="rightDiv" class='column-right'>
            <div id="login_beforeDiv">
               <%@ include file="../../../user/login_before_new.jsp"%>
            </div>
            <div id="login_afterDiv" style="display: none">
               <%@ include file="../../login_after_new.jsp"%>
            </div>
         </div>
         <!-- column-right -->
      </div>
      <!-- modal 코드 --> 
       <%@ include file="../../user_modals_new.jsp" %>
         
   </div>
   <!-- container -->

<script type="text/javascript">
$(function(){
/*    $('#regist').on("click", function(){
      self.location="${initParam.rootPath }/conread"
   }); */
   $('#cancel').on("click", function(){
      self.location="${initParam.rootPath }/user/contest/qna/list?contest_id=${param.contest_id}";
   });
});

function validateCheck() {
   var f = document.registerForm;
   
   if ($('form[name=registerForm] input[name=qna_title]').val() == '') {
      alert('제목을 입력하세요.');
      f.qna_title.focus();

   } else if ($('form[name=registerForm] textarea[name=qna_contents]').val() == '') {
      alert('내용을 입력하세요.');
      f.qna_contents.focus();
   } else {
      document.registerForm.submit();
   }
}
</script>

</body>
</html>