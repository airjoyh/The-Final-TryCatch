<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>임시 유저 메인 뷰</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap3 for trycatch -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#member_id').val('');
		$('#member_pass').val('');
		$('#member_pass2').val('');
		$('#user_authCode').val('');
		var timer;
		var timer2;
			
/* ---------------------------------------- 회원가입 ----------------------------------------*/
 		
 		$('#openJoinModal').on("click", function(){
 			$('#userModal').toggle();
 			$('#userModal h4').html('회원가입');
 			$('button[name=sendEmail]').attr("id", "sendEmail1");
 			$('button[name=emailConfirm]').attr("id", "emailConfirm1");
 			$('#emailConfirm1').html('회원가입 완료');
 			
 			clearInterval(timer);//타이머도 꺼줘야지.
			clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
			$('#member_id').val('');
			$('#member_pass').val('');
			$('#member_pass2').val('');
			$('#user_authCode').val('');
			$('#timer').html('60초 안에 인증코드를 입력해주세요.');
 			
 			
 		});//>>> openJoinModal클릭
 		
 		$('#authRequest').on("click",'#sendEmail1',function() {
				console.log("(회원가입)인증코드 요청 버튼 클릭");
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
						url:"register",
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
				
			$('#complete').on("click", '#emailConfirm1',function(){
				console.log('회원가입 완료 버튼 클릭');
				var member_id = $('#member_id');
				var user_authCode = $('#user_authCode');
				var timer = $('#timer').html();
				
				if(timer.indexOf('60초 안에 인증코드를 입력해주세요.')>=0){
					alert('인증코드 요청 버튼을 클릭해주세요.');
				}else{
					$.ajax({
						type:'post',
						url:"emailConfirm",
						data:{"member_id":member_id.val(), "user_authCode":user_authCode.val()},
						success:function(result){
							console.log(result)
							if(result=='success'){
								alert('회원가입이 완료되었습니다.')
								clearInterval(timer);//타이머도 꺼줘야지.
								clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
								$('#userModal').modal('toggle');//회원가입 모달창 닫기
							}else{
								alert('인증코드가 일치하지 않습니다. 다시 한번 확인해주세요.');
							}
						}
					});
					
				}
				
			});//emailConfirm1클릭
 		
/* ---------------------------------------- 비밀번호 찾기 ----------------------------------------*/
 	
 		$('#openFindPassModal').on("click", function(){
 			$('#userModal').toggle();
 			$('#userModal h4').html('비밀번호 찾기');
 			$('button[name=sendEmail]').attr("id", "sendEmail2");
 			$('button[name=emailConfirm]').attr("id", "emailConfirm2");
 			$('#emailConfirm2').html('비밀번호 변경 완료');
 			
 			clearInterval(timer);//타이머도 꺼줘야지.
			clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
			$('#member_id').val('');
			$('#member_pass').val('');
			$('#member_pass2').val('');
			$('#user_authCode').val('');
			$('#timer').html('60초 안에 인증코드를 입력해주세요.');
 			
 			
 		});//>>>>openFindPassModal
		
 		$('#authRequest').on("click",'#sendEmail2',function() {
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
						url:"findUser",
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
				
			$('#complete').on("click", '#emailConfirm2',function(){
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
						url:"changePass",
						data:{"member_id":member_id.val(), "member_pass":member_pass.val(), "user_authCode":user_authCode.val()},
						success:function(result){
							console.log(result)
							if(result=='success'){
								alert('비밀번호 변경이 완료되었습니다.')
								clearInterval(timer);//타이머도 꺼줘야지.
								//clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
								$('#userModal').modal('toggle');//회원가입 모달창 닫기
							}else if(result=='fail'){
								alert('인증코드가 일치하지 않습니다. 다시 한번 확인해주세요.');
							}else if(result=='noFindUser'){
								alert('등록되지 않은 이메일입니다.');
							}
						}
					});
				}
				
			});//emailConfirm2클릭
 		
 		
/* ---------------------------------------- 로그인 ----------------------------------------*/
		
		$('#login').on("click",function() {
			var login_id = $('#login_id');
			var login_pass = $('#login_pass');
			
			$.ajax({
				type: "post",
				url: "loginPost",
				data:{"login_id":login_id.val(), "login_pass":login_pass.val()},
				success:function(result){
					console.log(result);
					if(result=='noRegister'){
						alert('아이디와 비밀번호가 일치하지 않습니다.');
					}else if(result=='noAuth'){
						alert('메일 인증이 완료되지 않았습니다.')
						self.location = 'noAuth?id='+login_id.val();
					}else{
						self.location = "loginComplete";
					}
				}
			});
			
		});
 		
 		
 
 
	});//function()
		
	function removeRegist() {//인증안된 아이디 삭제
		console.log('setTimeout 작동');
		var member_id = $('#member_id');
		var user_authCode = $('#user_authCode');
		
		$.ajax({
			type:'post',
			url:"removeRegist",
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
	
</script>
<%@include file="userNavBar.jsp" %>
</head>
<body>

	<h3>임시 유저 메인 뷰</h3>
	<hr>
	<form id="loginForm" action="/tcb/user/login">
		아이디: <input type="text" id="login_id" name="login_id"><br> 비밀번호: <input
			type="password" id="login_pass" name="login_pass"> <input type="button" id="login"
			value="로그인"><br>
	</form>
	&nbsp;&nbsp;
	<a data-toggle="modal" data-target="#userModal" id="openJoinModal"><font
		size="2">회원가입</font></a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a data-toggle="modal" data-target="#userModal" id="openFindPassModal"><font
		size="2">비밀번호 찾기</font></a>
</body>
</html>
<!--***********************************************************
	*                                                             *
	*                       joinmodal                             *
	*                                                             *
	************************************************************-->
<div class="modal fade" id="userModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title text-muted">회원가입</h4>
			</div>

			<div id="modalpadding" class="modal-body">
				<form action="/tcb/user/register" method="post" name="userForm">
					<div class="form-group">
						<div class="input-group">
							<input class="form-control" id="member_id" name="member_id"
								type="email" aria-describedby="emailHelp"
								placeholder="이메일을 입력하세요">

						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<!-- <label for="pwd"></label> -->
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input
									class="form-control" id="member_pass" name="member_pass"
									type="password" style="font-family: 'arial'"
									placeholder="비밀번호를 입력하세요">
							</div>
						</div>
						<br>
						<div class="col-md-6 form-group">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input
									class="form-control" id="member_pass2" name="member_pass2"
									type="password" style="font-family: 'arial'"
									placeholder="비밀번호 확인">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input
									class="form-control" id="user_authCode" name="user_authCode"
									type="text" placeholder="인증코드" size="20">
								<div class="input-group-btn" id="authRequest">
									<button class="btn btn-info" type="button" name="sendEmail" id="sendEmail">인증코드
										요청</button>
								</div>
							</div>
							<div id="timer">60초 안에 인증코드를 입력해주세요.</div>
						</div>
					</div>
					<div id="complete">
					<button class="btn btn-primary btn-block" type="button"
						name="emailConfirm" id="emailConfirm">완료</button>
					</div>
						
				</form>
			</div>

		</div>
	</div>
</div>
















