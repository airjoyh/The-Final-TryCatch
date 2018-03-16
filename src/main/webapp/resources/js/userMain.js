
//나중에 로그인, 로그아웃 클릭 function이랑 div.html하는 function을 js로 묶어서 각 jsp파일마다 넣어줘야함!!!!!!
$(document).ready(function() { 
		$('.mypage').on('click', function() {
			$('.mypage-dropdown').toggle();
		});
		
		
		
		//로그인 상태 확인해서 jsp 페이지 로드
		if(loginState != 'login'){//로그인상태가 아닐때
			$('#login_beforeDiv').show();
			$('#login_afterDiv').hide();
			
		}else if(loginState == 'login'){//로그인 상태일때			
			$('#login_beforeDiv').hide();
			$('#login_afterDiv').show();
			
		}
				
/* ---------------------------------------- 로그인 ----------------------------------------*/
		
		$('#login').on("click",function() {
			var login_id = $('#login_id');
			var login_pass = $('#login_pass');
			
			$.ajax({
				type: "post", 
				url: rootPath+"/user/loginPost", // /loginPost // ${initParam.rootPath}/user/loginPost 
				data:{"login_id":login_id.val(), "login_pass":login_pass.val()},
				success:function(result){
					console.log(result);//result = "noRegister" 또는 "noAuth" 또는 "login|7"
					var strArr = result.split('|'); //strArr[] = ["login","7"];
					//if(result=='noRegister'){
					if(strArr[0]=='noRegister'){
						alert('아이디와 비밀번호가 일치하지 않습니다.');
					}else if(strArr[0]=='noAuth'){
						alert('메일 인증이 완료되지 않았습니다.')
						self.location = 'noAuth?id='+login_id.val();
					}else if(strArr[0]=='login'){
						afterLogin(strArr[1]);
						$('#login_beforeDiv').hide();
						$('#login_afterDiv').show();
					}
				}
			});
			
		});
		
/* ---------------------------------------- 로그아웃 ----------------------------------------*/
		$('.logout-btn').on("click", '#logout', function(){
			console.log('로그아웃 버튼 클릭');
			location.href = rootPath+'/user/logout'; //'${initParam.rootPath}/user/logout';
			$('#login_beforeDiv').show();
			$('#login_afterDiv').hide();
		});
		
		
		$('#member_id').val('');
		$('#member_pass').val('');
		$('#member_pass2').val('');
		$('#user_authCode').val('');
		var timer;
		var timer2;
			
/* ---------------------------------------- 회원가입 ----------------------------------------*/
 		
 		$('.openJoinModal').on("click", function(){
 			//$('#userModal').toggle();
 			console.log('회원가입 버튼 클릭');
 			//$('#userModal').fadeIn();
 			//$('#userModal').show();
 			
 			$('#action').html('회원가입 <a href="#close">CLOSE</a>');
 			$('input[name=sendEmail]').attr("id", "sendEmail1");
 			$('input[name=emailConfirm]').attr("id", "emailConfirm1");
 			$('#emailConfirm1').html('회원가입 완료');
 			
 			clearInterval(timer);//타이머도 꺼줘야지.
			clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
			$('#member_id').val('');
			$('#member_pass').val('');
			$('#member_pass2').val('');
			$('#user_authCode').val('');
			$('#timer').html('60초 안에 인증코드를 입력해주세요.');
 			
 			
 		});//>>> openJoinModal클릭
 		
 		$('.modal-body').on("click", '#sendEmail1', function() {
				console.log("(회원가입)인증코드 요청 버튼 클릭");
				var member_id = $('#member_id');
				var member_pass = $('#member_pass');
				var member_pass2 = $('#member_pass2'); 
				console.log('아이디 >>> '+member_id.val());
				
				//유효성 검사 들어가야함!
				var member_idExp = /^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/;
				if(!member_idExp.test(member_id.val())){
					alert('올바른 이메일을 입력하세요');
					member_id.focus();
				}else if(member_pass.val()==''){
					alert('비밀번호를 입력하세요.')
				}else if(member_pass2.val()==''){
					alert('비밀번호 확인을 입력하세요.');
				}else if(member_pass.val() != member_pass2.val()){
					alert('비밀번호가 일치하지 않습니다.')
				}else{
				
					$.ajax({
						type:'post',
						url: rootPath+"/user/register",
						data:{"member_id":member_id.val(), "member_pass":member_pass.val()},
						success:function(result){
							console.log(result);
							if(result=='registComplete'){
								alert('이미 가입된 회원 이메일입니다. 다른 이메일을 입력해주세요.');
								
							}else if(result=='noEmailConfirm'){
								alert('이메일 인증코드가 이미 발송되었습니다.');
								
							}else if(result=='registNew'){
								alert('등록하신 이메일로 인증코드가 발송되었습니다. 확인하시고 인증코드를 입력해주세요.');
								var count = 60;
								$('#timer').html(count);
								timer=setInterval(function(){
									$('#timer').html(count+"초");
						
									if(count==0){
										console.log('타이머 종료');
										$('#timer').html('인증코드를 다시 요청해주세요.');
										clearInterval(timer);
									}else{
										count--;
									}
								},1000);
								timer2=setTimeout("removeRegist()" , 60000);//60초 후에 실행!
								
							}
						}
					});
				}	
			});//sendEmail1클릭
				
			$('.modal-footer').on("click", '#emailConfirm1',function(){
				console.log('회원가입 완료 버튼 클릭');
				var member_id = $('#member_id');
				var user_authCode = $('#user_authCode');
				var timer = $('#timer').html();
				
				if(timer.indexOf('60초 안에 인증코드를 입력해주세요.')>=0){
					alert('인증코드 요청 버튼을 클릭해주세요.');
				}else{
					$.ajax({
						type:'post',
						url: rootPath+"/user/emailConfirm",
						data:{"member_id":member_id.val(), "user_authCode":user_authCode.val()},
						success:function(result){
							console.log(result)
							if(result=='success'){
								alert('회원가입이 완료되었습니다.')
								clearInterval(timer);//타이머도 꺼줘야지.
								clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
								self.location = 'main'; //'${initParam.rootPath}/user/main';//url에 #userModal 뜨지 않게 하기위해
								$('#userModal').fadeOut();
								//$('#userModal').modal('toggle');//회원가입 모달창 닫기
							}else{
								alert('인증코드가 일치하지 않습니다. 다시 한번 확인해주세요.');
							}
						}
					});
					
				}
				
			});//emailConfirm1클릭
		
/* ---------------------------------------- 비밀번호 찾기 ----------------------------------------*/
		 	
	 		$('.openFindPassModal').on("click", function(){
	 			//$('#userModal').toggle();
	 			$('#action').html('비밀번호 찾기 <a href="#close">CLOSE</a>');
	 			$('input[name=sendEmail]').attr("id", "sendEmail2");
	 			$('input[name=emailConfirm]').attr("id", "emailConfirm2");
	 			$('#emailConfirm2').html('비밀번호 변경 완료');
	 			
	 			clearInterval(timer);//타이머도 꺼줘야지.
				clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
				$('#member_id').val('');
				$('#member_pass').val('');
				$('#member_pass2').val('');
				$('#user_authCode').val('');
				$('#timer').html('60초 안에 인증코드를 입력해주세요.');
	 			
	 			
	 		});//>>>>openFindPassModal
			
	 		$('.modal-body').on("click",'#sendEmail2',function() {
					console.log("(비밀번호찾기)인증코드 요청 버튼 클릭");
					var member_id = $('#member_id');
					var member_pass = $('#member_pass');
					var member_pass2 = $('#member_pass2');
					
					//유효성 검사 들어가야함!
					var member_idExp = /^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/;
					if(!member_idExp.test(member_id.val())){
						alert('올바른 이메일을 입력하세요');
						member_id.focus();
					}else if(member_pass.val()==''){
						alert('비밀번호를 입력하세요.')
					}else if(member_pass2.val()==''){
						alert('비밀번호 확인을 입력하세요.');
					}else if(member_pass.val() != member_pass2.val()){
						alert('비밀번호가 일치하지 않습니다.')
					}else{
					
						$.ajax({
							type:'post',
							url: rootPath+"/user/findUser",
							data:{"member_id":member_id.val()},
							success:function(result){
								console.log(result);
								if(result=='noFindUser'){
									alert('등록되지않은 이메일입니다. 회원가입을 먼저 해주세요.');
									
								}else if(result=='findUser'){
									alert('등록하신 이메일로 인증코드가 발송되었습니다. 확인하시고 인증코드를 입력해주세요.');
									var count = 60;
									$('#timer').html(count);
									timer=setInterval(function(){
										$('#timer').html(count+"초");
							
										if(count==0){
											console.log('타이머 종료');
											$('#timer').html('인증코드를 다시 요청해주세요.');
											clearInterval(timer);
										}else{
											count--;
										}
									},1000);
									
									
								}
							}
						});
					}	
				});//sendEmail2클릭
					
				$('.modal-footer').on("click", '#emailConfirm2',function(){
					console.log('비밀번호 변경 완료 버튼 클릭');
					var member_id = $('#member_id');
					var member_pass = $('#member_pass')
					var user_authCode = $('#user_authCode');
					console.log("비밀번호 >>> "+member_pass.val());
					var timer = $('#timer').html();
					
					if(timer.indexOf('60초 안에 인증코드를 입력해주세요.')>=0){
						alert('인증코드 요청 버튼을 클릭해주세요.');
					}else{
						
						$.ajax({
							type:'post',
							url: rootPath+"/user/changePass",
							data:{"member_id":member_id.val(), "member_pass":member_pass.val(), "user_authCode":user_authCode.val()},
							success:function(result){
								console.log(result)
								if(result=='success'){
									alert('비밀번호 변경이 완료되었습니다.')
									clearInterval(timer);//타이머도 꺼줘야지.
									$('#userModal').fadeOut();
									self.location = 'main';//'${initParam.rootPath}/user/main';//url에 #userModal 뜨지 않게 하기위해
									//clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
									//$('#userModal').modal('toggle');//회원가입 모달창 닫기
								}else if(result=='fail'){
									alert('인증코드가 일치하지 않습니다. 다시 한번 확인해주세요.');
								}else if(result=='noFindUser'){
									alert('등록되지 않은 이메일입니다.');
								}
							}
						});
					}
					
				});//emailConfirm2클릭	

/* ---------------------------------------- 쪽지 ----------------------------------------*/
               $('.login-tab').on("click",'.note', function () {
            	   console.log('쪽지 버튼 클릭');
		         
            	   self.location= rootPath+'/user/note/list'; //"${initParam.rootPath }/user/note/list";
	          }); 	
				
	});//function	
	
	function removeRegist() {//인증안된 아이디 삭제
		console.log('setTimeout 작동');
		var member_id = $('#member_id');
		var user_authCode = $('#user_authCode');
		
		$.ajax({
			type:'post',
			url: rootPath+"/user/removeRegist",
			data:{"member_id":member_id.val()},
			success:function(result){
				console.log(result)
				if(result=='removeRegist'){
					//alert('이메일 인증 시간이 지났습니다. 다시 요청하여 주세요.');
					$('#timer').html('<font color="red">이메일 인증 시간이 지났습니다. 다시 요청하여 주세요.</font>');
				}
			}
		});
	}
	
	function afterLogin(noteCount){
		console.log('afterLogin>>>');
		var login_id = $('#login_id').val();
		//var statusCount = '${statusCount}';
		
		if($('#rightDiv .user-email').html()==''){
			console.log('if:'+ login_id)//airjoyh@naver.com
		   //$('#rightDiv .user-email').html($('#login_id').val());
		  $('#rightDiv .user-email').html(login_id);
		}else{
			console.log('else')
		}
		
		if($('#rightDiv #note-cnt').html()==''){
			console.log('쪽지 갯수 >>> '+noteCount);
			$('#rightDiv #note-cnt').html(noteCount);
		}
	}