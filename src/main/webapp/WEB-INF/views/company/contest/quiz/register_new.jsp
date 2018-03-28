<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트개최</title>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- com-nav area -->
	<%@include file="../../../company-nav_new.jsp" %>

	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		  <form name="quizRegisterForm" method="post">
  			<input type="hidden" id="action" name="action" value="">
   			<input type="hidden" id="contest_id" name="contest_id" value="${param.contest_id }">

			<div class='com-contest-info'>
				<div class='title-wrapper'>
					<input type="hidden" id="company_id" name="company_id" value="${company_login_company_id }">
					<div class='column-title'>문제제출</div>
				</div>

				<div class='wrapper'>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>문제번호</div>
						<input type="text" id="quiz_no" name="quiz_no" value="${param.quiz_no }" readonly="readonly">
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>문제배점</div>
						<input type="text" id="quiz_point" name="quiz_point"><br>
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>문제내용</div>
						<textarea id="quiz_contents" name="quiz_contents"></textarea><br>
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>문제형식</div>
            <div class='half-contents'>
						  <select name="quiz_type" id='quiz_type'>
						  	<option value="0">==선택==</option>
							  <option value="1">객관식</option>
							  <option value="2">주관식</option>
							  <option value="3">코딩</option>
						  </select>
              <!-- <select class="objectiveType-quiz_num subjectiveType-quiz_num" style="display:none"> -->
              <select id='quiz_num' name="quiz_num" style="display:none">
              	<option value="0">==문항수를 선택하세요==</option>
							  <option value="1">1</option>
							  <option value="2">2</option>
							  <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
						  </select>
              <div class="quizInput" style="margin-top:20px;"></div>
          </div>
					</div>
					<div class='cont-regist-contents'>
						<div id="load"></div>
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title' id="correctSpan" style="display:none;">
              문제정답(객관식의 경우 정답에 들어가는 텍스트를 입력하세요.)
						  <div id="quiz_answer">
							<textarea id="quiz_correct" name="quiz_correct"></textarea>
						 </div>
            </div>
					</div>



					<div class='cont-reg-btn-area'>
							<button type="button" id="quizAddBtn"
								style='display: block; width: 100%;background-color: #64d0d6;'>문제추가
							</button>
							<button type="button" id="contestCompleteBtn">콘테스트 등록 완료</button>
							<button type="reset">취소</button>
					</div>
					<div style="clear: left;height: 100px;"></div>

					</div>

			</div><!-- com-contest-info -->
			</form>
		</div><!-- column-left -->
		<!-- right section!!************************************************************** -->
		<div class='column-right'>


		</div><!-- column-right -->
	</div>
<script type="text/javascript">
     $(function(){
    	 
    	 if(loginState != 'login'){
    		 alert('해당 페이지는 로그인한 후에 이용가능합니다.');
    		 self.location = '${initParam.rootPath}/company/main';
    	 }
    	 
    	 $('#quiz_type').change(function(){



    		 var sel = $('#quiz_type').val();

    		 if(sel=='1'){
    			 //$('select[name=quiz_type]').val('1');
    			 $('#quiz_num').attr('class','objectiveType_num');
           $('#quiz_num').show();
           $('.objectiveType_num').val('0');
           $('.quizInput').empty();
           $(document).on('change','.objectiveType_num',function(){
             $('.quizInput').empty();
             var createInputNum = $('.objectiveType_num').val();
             console.log(createInputNum);
             for(var i=0;i<createInputNum;i++){
               $('.quizInput').append('<input name="item" placeholder="'+(i+1)+'번 보기의 내용을 입력하세요'+'">');
             }
             $('#correctSpan').show();
           });
    		 }else if(sel=='2'){
           $('#correctSpan').hide();
           $('#quiz_num').attr('class','subjectiveType_num');
           $('#quiz_num').show();
           $('.subjectiveType_num').val('0');
           $('.quizInput').empty();
           $(document).on('change','.subjectiveType_num',function(){
             $('.quizInput').empty();
             var createInputNum = $('.subjectiveType_num').val();
             console.log(createInputNum);
             for(var i=0;i<createInputNum;i++){
               $('.quizInput').append('<input name="item" placeholder="'+(i+1)+'번 빈칸의 정답을 입력하세요'+'">');
             }
           });
    		 }else if(sel=='3'){
           $('#correctSpan').show();
           $('#quiz_num').hide();
           $('.quizInput').empty();
    			 $('#load').load('codingType');
    		 }else if(sel=='0'){
    			 $('#load').html('');
    		 }
    	 });


		//문제 추가 버튼을 눌렀을 때
		$('#quizAddBtn').on("click", function(){

			$('#action').val('quizAdd');
			var contest_id = $('#contest_id');
			var quiz_no = $('#quiz_no');
			var quiz_point = $('#quiz_point');
			var quiz_contents = $('#quiz_contents');
			var quiz_type = $('select[name=quiz_type]');
			var quiz_correct = $('#quiz_correct');
			var quiz_pointExp = /^[0-9]*$/;

			//console.log($('input[name=item]').val());
			if(!quiz_pointExp.test(quiz_point.val()) || quiz_point.val()==''){
				alert('문제 배점은 숫자만 입력가능합니다.');
				quiz_point.focus();
				
			}else if(quiz_contents.val()==''){
				alert('문제 내용을 입력해주세요.');
				quiz_contents.focus();
				
			}else if(quiz_type.val()=='0'){
				alert('문제 형식을 선택해주세요.');
				
			}else if(quiz_type.val()!='0'){
				
				if(quiz_type.val() == '1'){
					if($('select[name=quiz_num]').val()=='0'){
						alert('문항 수를 선택하여 주세요.');
					}else if(quiz_correct.val()==''){
						alert('문제의 정답을 입력해주세요.');
						quiz_correct.focus();
					}else{
						console.log('else에 들어왔다');
						document.quizRegisterForm.submit();
					}
				}else if(quiz_type.val() == '2'){
					console.log('2');
					if($('select[name=quiz_num]').val()=='0'){
						alert('문항 수를 선택하여 주세요.');
					}else{
						console.log('else에 들어왔다');
						document.quizRegisterForm.submit();
					}
				}else if(quiz_type.val()=='3'){
					console.log('3');
					if($('textarea[name=item]').val()!=''){
						alert('해당 공간은 아무것도 입력할 수 없습니다.');
						$('textarea[name=item]').focus();
						
					}else if(quiz_correct.val()==''){
						alert('문제의 정답을 입력해주세요.');
						quiz_correct.focus();
				
					}else{
						console.log('else에 들어왔다');
						document.quizRegisterForm.submit();
					}
				}
	
			}

		});//문제 추가 버튼 클릭

		//콘테스트 등록 완료 버튼을 눌렀을 때
		$('#contestCompleteBtn').on("click", function(){

			$('#action').val('contestComplete');
			var contest_id = $('#contest_id');
			var quiz_no = $('#quiz_no');
			var quiz_point = $('#quiz_point');
			var quiz_contents = $('#quiz_contents');
			var quiz_type = $('select[name=quiz_type]');
			var quiz_correct = $('#quiz_correct');
			var quiz_pointExp = /^[0-9]*$/;

			//console.log($('input[name=item]').val());
			if(!quiz_pointExp.test(quiz_point.val()) || quiz_point.val()==''){
				alert('문제 배점은 숫자만 입력가능합니다.');
				quiz_point.focus();
				
			}else if(quiz_contents.val()==''){
				alert('문제 내용을 입력해주세요.');
				quiz_contents.focus();
				
			}else if(quiz_type.val()=='0'){
				alert('문제 형식을 선택해주세요.');
				
			}else if(quiz_type.val()!='0'){
				
				if(quiz_type.val() == '1'){
					if($('select[name=quiz_num]').val()=='0'){
						alert('문항 수를 선택하여 주세요.');
					}else if(quiz_correct.val()==''){
						alert('문제의 정답을 입력해주세요.');
						quiz_correct.focus();
					}else{
						console.log('else에 들어왔다');
						document.quizRegisterForm.submit();
					}
				}else if(quiz_type.val() == '2'){
					console.log('2');
					if($('select[name=quiz_num]').val()=='0'){
						alert('문항 수를 선택하여 주세요.');
					}else{
						console.log('else에 들어왔다');
						document.quizRegisterForm.submit();
					}
				}else if(quiz_type.val()=='3'){
					console.log('3');
					if(quiz_correct.val()==''){
						alert('문제의 정답을 입력해주세요.');
						quiz_correct.focus();
						
					}else{
						console.log('else에 들어왔다');
						document.quizRegisterForm.submit();
					}
				}
	
			}
		});//콘테스트 등록 완료 버튼 클릭

     });//function

  </script>
</body>
</html>
