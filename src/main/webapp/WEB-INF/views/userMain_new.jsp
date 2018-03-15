<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>그리드 테스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<%-- <script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script> --%>
<%-- <script type="text/javascript" src="${initParam.rootPath }/resources/js/user-nav.js"></script> --%>

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

//나중에 로그인, 로그아웃 클릭 function이랑 div.html하는 function을 js로 묶어서 각 jsp파일마다 넣어줘야함!!!!!!
$(document).ready(function() { 
		$('.mypage').on('click', function() {
			$('.mypage-dropdown').toggle();
		});
		
		
		
		//로그인 상태 확인해서 jsp 페이지 로드
		var loginState = '${user_loginState}';//로그인하면 'login'
		if(loginState != 'login'){
			//$('#rightDiv').load('${initParam.rootPath}/user/beforeLogin');
			//로드를 할경우 그 안에 있는 요소들이 제이쿼리가 안먹음!!
			beforeLogin();
			
		}else if(loginState == 'login'){
			//$('#rightDiv').load('${initParam.rootPath}/user/afterLogin');			
			afterLogin();
		}
				
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
					}else if(result=='login'){
						afterLogin();							
						
					}
				}
			});
			
		});
		
/* ---------------------------------------- 로그아웃 ----------------------------------------*/
		$('.logout-btn').on("click", '#logout', function(){
			console.log('로그아웃 버튼 클릭');
			location.href = '${initParam.rootPath}/user/logout';
			beforeLogin();
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
						url:"emailConfirm",
						data:{"member_id":member_id.val(), "user_authCode":user_authCode.val()},
						success:function(result){
							console.log(result)
							if(result=='success'){
								alert('회원가입이 완료되었습니다.')
								clearInterval(timer);//타이머도 꺼줘야지.
								clearTimeout(timer2);//회원가입이 완료되면 setTimeout꺼줘야한다.
								self.location = '${initParam.rootPath}/user/main';//url에 #userModal 뜨지 않게 하기위해
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
	 			$('#action').html('비밀번호 찾기');
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
							url:"changePass",
							data:{"member_id":member_id.val(), "member_pass":member_pass.val(), "user_authCode":user_authCode.val()},
							success:function(result){
								console.log(result)
								if(result=='success'){
									alert('비밀번호 변경이 완료되었습니다.')
									clearInterval(timer);//타이머도 꺼줘야지.
									$('#userModal').fadeOut();
									self.location = '${initParam.rootPath}/user/main';//url에 #userModal 뜨지 않게 하기위해
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
		         
            	   self.location="${initParam.rootPath }/user/note/list"
	          }); 
			 	 
	});//function	
	
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
	
	function beforeLogin(){
		$('#rightDiv').html('<div class="wrapper">'
				+'<div><input class="login-input" type="email" id="login_id" name="login_id" placeholder="이메일"></div>'
				+'<div><input class="login-input" type="password" id="login_pass" name="login_pass" placeholder="비밀번호"></div>'
				+'<div><input type="button" id="login" value="로그인" class="login-btn"> </div>'
				+'<span class="pure-checkbox" style="float: left;">'
				+'    <input id="checkboxtoggle" name="checkbox" type="checkbox">'
				+'    <label for="checkboxtoggle">정보기억</label>'
				+'    </span>'
				+'<span style="float: right;padding: 2px 0 0 6px;">'
				+'    <a href="#userModal" class="openFindPassModal" id="openFindPassModal">비밀번호 찾기</a>'
				+'    </span>'
				+'<span style="float: right;padding: 2px 6px;">'
				+'    <a href="#userModal" class="openJoinModal" id="openJoinModal">회원가입</a>'
				+'    </span>'
				+'</div>');
	}
	
	function afterLogin(){
		$('#rightDiv').html('<div class="section_login">'
				+'<div class="login-info">'
				+'<div class="user-icon">'
				+'	<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">'
				+'</div>'
				+'<div class="id_div">'
				+'	<div id="logoutDiv" class="logout-btn">'
				+'		<a id="logout">로그아웃</a>'
				+'	</div>'
				+'</div>'
				+'<div class="user-email">${user_login_id}</div>'
				+'</div>'
				+'<div class="login-tab">'
				+'<div class="mypage">마이페이지</div>'
				+'<div class="note">'
				+'	쪽지 <label class="note-cnt"></label> <span id="note-cnt">${statusCount}</span>'
				+'</div>'
				+'<!-- hidden nav -->'
				+'<div class="mypage-dropdown">'
				+'	<div class="line"></div>'
				+'	<div class="portfolio">포트폴리오 페이지</div>'
				+'	<div class="pwd-change">비밀번호 변경</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<!-- section_login -->'
				+'<div class="section_zzim">'
				+'<div class="title-wrapper">'
				+'<div class="column-title">관심기업 리스트</div>'
				+'</div>'
				+'<div class="wrapper">'
				+'<div class="column-contents">'
				+'	<i>현재 찜한 기업이 없습니다.</i>'
				+'	<!-- 있으면 테이블 없으면 i -->'
				+'	<table class="zzim-table">'
				+'		<thead>'
				+'			<tr>'
				+'				<th>기업명</th>'
				+'				<th>평점</th>'
				+'			</tr>'
				+'		</thead>'
				+'		<tbody>'
				+'			<!-- 찜한기업리스트  forEach-->'
				+'			<c:forEach begin="1" end="5" var="ss">'
				+'			<tr>'
				+'				<td></td>'
				+'				<td></td>'
				+'			</tr>'
				+'			</c:forEach>'
				+'		</tbody>'
				+'	</table>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<!-- section_zzim -->');
	}
	
</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	<%@ include file="user-nav_new.jsp" %>
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main1'>
				
			</div><!-- section_main1 -->
				
			<div class='section_main2'>
			
			</div><!-- section_main2 -->
				
		</div>
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			
		</div><!-- column-right -->
		<!-- modal import -->
		<%-- <%@ include file="user/user_modals_new.jsp" %> --%>
		<!-- modal 코드 -->

		<!-- 회원가입 모달 ******************************************************************-->
		<div class="modal" id="userModal">
			<div class="modal-pannel">
				<div id="action" class="modal-title">
					
				</div>
				<div class="modal-body">
					<input id="member_id" name="member_id" type="email"
						placeholder="이메일을 입력하세요"> 
					<input id="member_pass"
						name="member_pass" type="password" placeholder="비밀번호를 입력하세요">
					<input id="member_pass2" name="member_pass2" type="password"
						placeholder="비밀번호 확인" style="float: right;"> 
					<input
						id="user_authCode" name="user_authCode" type="text"
						size="20"> 
					<input
						type="button" name="sendEmail" id="sendEmail" value="인증코드 요청">
				<div id="timer">60초 안에 인증코드를 입력해주세요.</div>
				</div>
		
				<div class="modal-footer">
					<input type="button" name="emailConfirm" id="emailConfirm" value="완료">
				</div>
			</div>
		</div>

	<!-- frame -->
	</div>
	<!-- footer-area -->

</body>
</html>
