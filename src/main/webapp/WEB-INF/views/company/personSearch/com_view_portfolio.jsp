<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 리스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/portfolio.css" rel="stylesheet" type="text/css">

<!-- 임시 js -->

</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
<!-- com-nav -->
	<%@include file="../../company-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
			<div class='section_pf'>
			
				<div class='pf-header'>
					<div class='pf-img'>
						<img src="${initParam.rootPath }/resources/image/ing/pf-bg.svg">
						<div class='pf-user-icon'>
							<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">
						</div>
					</div>
					<div class='pf-info'>
						<div class='pf-title'>
							<a id="noteA" href="#tcmail">${port.user_id }</a>
						</div>
							<div class="com-btn">
												<form action="${initParam.rootPath }/com/port/list" method="post" >
													<input type="hidden" id="zzim_select" name="zzim_select"
														value="${company_login_member_id }"> 
													<input type="hidden" name="zzim_selected" id="zzim_selected"
														value="${port.port_id}">
													<button style="float: right;" id="zzimBtn" type="submit">찜하기</button>
													<button style="float: right;" id="zzimOutBtn" type="button">찜하기 취소</button>
													<button style="float: right;" id="portList" type="button">목록보기</button>	
												</form>
											</div>
					</div>
					<div class='pf-navbar'>
						<ul>
							<li id='self-intro'>자기소개</li>
							<li id='skill'>기술</li>
							<li id='lisence'>자격증</li>
							<li id='award'>수상경력</li>
							<li id='portfolio'>포트폴리오</li>
						</ul>
					</div>
				</div><!-- pf-header -->

				<div class='pf-body'>
					<div class='pf-intro'>
						<div class='body-title'>Self-introduce</div>
						<pre id='introduce'>${port.port_exp}</pre>     
					</div>
					<div class='pf-skill'>
						<p class='body-title'>Skills</p>
						
						<div class='skill-box'>${port.port_skill}</div>
						
					</div>
					<div class='pf-lisence'>
						<p class='body-title'>Lisence</p>
							<div class='lisence-box'>${port.port_license}</div>
					</div>
					<div class='pf-award'>
						<p class='body-title'>Award</p>
							<div class='award-box'>${port.port_award}</div>
					</div>
					<div class='pf-pflink'>
						<p class='body-title'>Portfolio site</p>
							<a class='portfolio-link'>${port.port_link }</a>
					</div>
				</div>

			</div><!-- section_pf -->				
		</div>
		
			<!-- right section!!************************************************************** -->
     <div id="rigthDiv" class="column-right">
       <div id="login_beforeDiv">
          <%@ include file="../../company/com_login_before_new.jsp" %>
       </div>
       <div id="login_afterDiv" style="display: none">
          <%@ include file="../../company/com_login_after_new.jsp" %>
       </div> 
       		<!-- modal import -->
		<%@ include file="../../company/company_modal_new.jsp" %>  
     </div>
			
	</div><!-- container -->
	
	<!-- mail 모달	 -->
		<div class="modal" id="tcmail">
			<div class="notemodal-pannel">
				<div class="notemodal-title">쪽지보내기 <a href="#close">CLOSE</a></div>
				
				<div class="notemodal-body">
					<h4>보낸 기업 아이디</h4>
					<p>
						<input type="text" id="note_sender" value="${company_login_member_id}" 
						class="form-control" style="width: 90%; height: 15px;">
					</p>
					<h4>받는 구직자 아이디</h4>
					<p>
						<input type="text" id="note_receiver" value="${port.user_id}"
						 class="form-control" style="width: 90%; height: 15px;">
					</p>
					<textarea placeholder="보낼 쪽지 내용을입력하세요" class="notemodal-ta" id="note_contents"></textarea>
				</div>
					
				<div class="notemodal-footer">
					<input type="button" name="noteConfirm" id="noteModBtn" value="전송">
				</div>
			</div>
		</div><!-- 쪽지모달 -->
		
<script type="text/javascript">
  $(document).ready(function() {
	  if(loginState != 'login'){// 로그인을 하지 않았다면
		  $('#noteA').attr("href", "#"); //쪽지 못보내게 하기
		  $('#zzimBtn').hide('fast');
		  
	  }else {
		  $('#zzimBtn').show('fast');
		  $('#noteA').attr("href", "#tcmail"); //쪽지 보내게 하기
	  }
	  
	  
	  $('.pf-info').on("click", "#noteA", function(){
		  console.log('쪽지 보내기 버튼 클릭');
		  if(loginState != 'login'){
			  alert('쪽지는 로그인한 후에 보낼 수 있습니다.');
		  }
	  });
	  
	  //찜한 행 존재 유무  
 	  $.ajax({
		   url: '${initParam.rootPath}/com/port/zziminout',
		   type:'post',
		   data: {
			    zzim_selected:'${port.port_id}',
			    zzim_select:'${company_login_member_id }'
		   },
		   success: function (result) {
			   console.log(result);
	        		if(result=="exist"){
	        			 $('#zzimBtn').hide('fast');
	        		}else{
	        			 $('#zzimOutBtn').hide('fast');
	        		}
		     }//function

	  }); //ajax
		
        $('a').on("click", ".portfolio-link", function (e) {  
            e.preventDefault();  
            var url = "www.naver.com";  
            location.href=url;  
        }); //a
        
        $('#portList').on("click", function() {//포트폴리오목록보기
            
        	self.location="${initParam.rootPath}/company/personSearch/list?page=${cri.page }"
                 +"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
                 +"&keyword=${cri.keyword }"
         
         });//portList

       $('#zzimListBtn').on("click", function() {//찜리스트 보이기
			
			self.location="${initParam.rootPath}/com/port/zzimlist?zzim_select=${company_login_member_id}";
		
		});   //zzimlist
		
	 	 $('#zzimOutBtn').on("click", function () {//찜하기 취소버튼 클릭시
	 		 console.log('찜하기취소버튼');
	 		var form=$(this).parent(); 
	 		 form.attr('action','${initParam.rootPath}/com/port/remove');
			  //<form action="remove">
			  form.submit();	 		 
		});//zzimout

	
	 		$("#noteModBtn").on("click", function() {
	 		    var note_contents = $("#note_contents");
	 		    var note_sender= '${company_login_member_id}';
	 		    var note_receiver= '${port.user_id }';
	 		    
	 		    //console.log(note_receiver);
	 		    
	 			  $.ajax({
	 					type:'post',
	 					url:'${initParam.rootPath}/user/note/register',
	 					data:{"note_contents":note_contents.val(),"note_sender":note_sender, "note_receiver":note_receiver},
	 					success:function(result){
	 						console.log("result: " + result);
	 						if(result == 'success'){
	 							alert("등록 되었습니다.");
	 							//$("#tcmail").modal('hide');
	 							$("#tcmail").fadeOut();
	 						   self.location="${initParam.rootPath}/company/personSearch/read?page=${cri.page }"
	 	                            +"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
	 	                            +"&keyword=${cri.keyword }&port_id=${port.port_id }"
	 						}
	 				}//success 
	 					
	 			  });//ajax
	 		});//쪽지 보내기 버튼 클릭
	});//document	  


	
/* 
	  var skills= '${port.port_skill}';
	  var array = skills.split('-');
	  console.log(array[1]);
	 */
</script>

</body>
</html>
