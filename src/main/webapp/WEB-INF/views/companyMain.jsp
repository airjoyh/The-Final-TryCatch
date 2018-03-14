<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
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
		
		$('#openJoinModal').on("click", function(){
			console.log('회원가입 버튼 클릭');
			$('#companyModal').toggle();
			$('#registerForm input').val('');//초기화
			$('#idCheck').html('');
			$('select[name=company_size]').val('==선택==');
			$('select[name=company_line]').val('==선택==');
			$('#company_intro').val('');
		});//openJoinModal클릭
		
		$('#registerDiv').on("click", "#register", function(){
			console.log("회원가입 완료 버튼 클릭");
			
			var member_id = $('#member_id');
			var member_pass = $('#member_pass');
			var member_pass2 = $('#member_pass2');
			var company_name = $('#company_name');
			var company_year = $('#company_year');
			var company_turnover = $('#company_turnover');
			var company_size = $('select[name=company_size]');
			var company_line = $('select[name=company_line]');
			var company_number = $('#company_number');
			var company_addr = $('#company_addr');
			var company_site = $('#company_site');
			var company_intro = $('#company_intro');
			
			var member_idExp = /^[a-zA-z0-9]{6,15}$/;//아이디가 6~15자리
			var company_turnoverExp = /^[0-9]{1,14}$/;//수정 요망 숫자가 1~14
			var company_sizeExp = /^[0-9]{1,7}$/; 
			var company_numberExp = /^[0-9]{5,15}$/;//수정 요망
		
			//alert('option체크: '+ $("option").val()+'\ncompany_line체크: '+ $("select[name=company_line]").val())
			if (!member_idExp.test(member_id.val())) {
				alert("아이디는 6~15자리를 입력하시오.");
				member_id.focus();
			} else if (member_pass.val() == '') {
				alert("비밀번호를 입력하세요.");
				member_pass.focus();
			} else if (member_pass2.val() == '') {
				alert("비밀번호 확인을 입력하세요.");
				member_pass2.focus();
			} else if (member_pass.val() !== member_pass2.val()) {
				alert("비밀번호가 일치하지 않습니다.");
				member_pass.val('');
				member_pass2.val('');
				member_pass.focus();
			} else if (company_name.val() == '') {
				alert("기업명을 입력하세요.");
				company_name.focus();
			} else if (company_year.val() == '') {
				alert("기업 설립년도를 입력하세요.");
				company_year.focus();
			} else if (company_turnover.val()=='') {
				alert("매출액을 입력하세요.");
				company_turnover.focus();
			} else if (company_size.val()=='==선택==') {
				alert("기업 규모를 입력하세요.");
			} else if ( company_line.val()=='==선택==') {
				alert("산업군을 선택하세요.");
			} else if (company_number.val()=='') {
				alert("사업자 등록번호를 입력하세요.");
				company_number.focus();
			} else if (company_addr.val() == '') {
				alert("기업 주소를 입력하세요.");
				company_addr.focus();
			} else if (company_site.val() == '') {
				alert("기업 사이트를 입력하세요.");
				company_site.focus();
			} else if (company_intro.val() == '') {
				alert("기업 소개를 입력하세요.");
				company_intro.focus();
			} else {
				var idCheck = $('#idCheck').html();
				console.log(idCheck);
				
				if(idCheck.indexOf('사용 가능한 아이디입니다.')>=0){
					$.ajax({
						type: 'post',
						url: "register",
						data:{
							"member_id":member_id.val(), 
							"member_pass":member_pass.val(),
							"company_name":company_name.val(), 
							"company_year":company_year.val(),
							"company_turnover":company_turnover.val(), 
							"company_size":company_size.val(),
							"company_line":company_line.val(), 
							"company_number":company_number.val(),
							"company_addr":company_addr.val(), 
							"company_site":company_site.val(),
							"company_intro":company_intro.val()
							},
						success:function(result){
							console.log(result);
							if(result=='success'){
								alert('회원가입이 완료되었습니다.');
								$('#companyModal').modal('toggle');
							}else if(result=='duplication'){
								alert('이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.');
							}
						}//success
					});//ajax
					
				}else if(idCheck.indexOf('이미 사용중인 아이디입니다.')>=0){
					alert('이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.');
				}else{
					alert('중복확인을 해주세요');
				}
				
			}//if
		});//register클릭
		
		$('#idCheckDiv').on("click", "#idCheckBtn", function(){
			console.log('중복확인 버튼 클릭');
			var member_id = $('#member_id');
			var member_idExp = /^[a-zA-z0-9]{6,15}$/;
			
			if (!member_idExp.test(member_id.val())) {
				alert("아이디는 6~15자리를 입력하시오.");
				member_id.focus();
			}else{
				$.ajax({
					type:"post",
					url:"idCheck",
					data:{"member_id":member_id.val()},
					success:function(result){
						if(result=='duplication'){
							console.log(result);
							$('#idCheck').html('<font color=red size=1>이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.</font>');
						}else{
							$('#idCheck').html('<font color=red size=1>사용 가능한 아이디입니다.</font>');
						}
					}
				});
			}
		});
		
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
				
					}else{
						self.location = "loginComplete";
					}
				}
			});
			
		});
	});//function레디~

</script>
<title>기업회원 메인페이지</title>
</head>
<%@include file="companyNavBar.jsp" %>
<body>
	<h3>기업회원 메인페이지</h3>
	<hr>
	<form id="loginForm" action="/tcb/user/login">
		아이디: <input type="text" id="login_id" name="login_id"><br> 
		비밀번호: <input type="password" id="login_pass" name="login_pass"> 
		<input type="button" id="login" value="로그인"><br>
	</form>
	&nbsp;&nbsp;
	<a data-toggle="modal" data-target="#companyModal" id="openJoinModal"><font
		size="2">회원가입</font></a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a data-toggle="modal" data-target="#companyModal" id="openFindPassModal"><font
		size="2">비밀번호 찾기</font></a>
	
</body>
</html>
    <!--***********************************************************
    *                                                             *
    *                         companyModal                        *
    *                                                             *
    ************************************************************-->

	<div class="modal fade" id="companyModal" role="dialog">
		<div class="modal-dialog">


			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted ">기업 회원가입</h4>
				</div>


				<div class="modal-body" id="modalpadding">
					<form method="post" id="registerForm" name="registerForm">
						
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" id="member_id" name="member_id"
									type="text" placeholder="아이디를 입력하세요" equired autofocus>
								<div class="input-group-btn" id="idCheckDiv">
									<button class="btn btn-defalt" type="button"
										id="idCheckBtn">중복확인</button>
								</div>
							</div>
							<div id="idCheck"></div>
						</div>
						
						<br>
						<div class="row">
							<div class="col-md-6 form-group">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-lock"></i></span> <input
										class="form-control" id="member_pass" name="member_pass"
										type="password" style="font-family: 'arial'"
										placeholder="비밀번호를 입력하세요">
							 </div>	
							</div>	
							
							<div class="col-md-6 form-group">
							   <input class="form-control" id="member_pass2"
									name="member_pass2" type="password"
									style="font-family: 'arial'" placeholder="비밀번호 확인">
							   
							</div>
						</div>
                       
                       <br>
						<div class="row">
							<div class="col-md-12 form-group">
								<div class="input-group">
									<span class="input-group-addon">Name</span> <input
										class="form-control" id="company_name" name="company_name"
										type="text" aria-describedby="nameHelp"
										placeholder="기업명을 입력하세요">
								</div>
							</div>
						</div>

                       <br>
						<div class="row">
							<div class="col-md-6 form-group">
								<p>기업 설립년도를 선택하세요</p>
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i></span> <input
										class="form-control" id="company_year" name="company_year"
										type="month">
								</div>
							</div>
						<div class="col-md-6 form-group">
						  <p style="color:white">매출액을 입력해주세요</p>
						   <div class="input-group">
						     <span class="input-group-addon">Sales</span>
							 <input class="form-control" id="company_turnover" name="company_turnover" 
							        type="text" placeholder="매출액을 입력하세요">
						   </div>
						</div>
						</div>
                       
                        <br>
                        <div class="row">
						<div class="form-group">
						  <div class="col-md-5 form-group">
						  <label for="company_size">기업 규모</label>
						  <div class="input-group">
						     <span class="input-group-addon">Scale</span>
						     <select class="form-control" id="company_size" name="company_size">
						        <option value="==선택==">==선택==</option>
						        <option value="대기업(1000명 이상)">대기업 (1000명 이상)</option>
						        <option value="중견기업(500명 이상)">중견기업 (500명 이상)</option>
						        <option value="중소기업(50명 이상)">중소기업 (50명 이상)</option>
						        <option value="소기업">소기업 (50명 미만)</option>
						     </select>			
						  </div>
						  </div>   
						</div>
                        </div>
                       <br>
                       <div class="row">
					    <div class="col-md-9 form-group">
					    <label for="company_size">기업 산업군</label>		
						  <div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-collapse-down"></i></span>
							<select class="form-control" id="company_line" name="company_line">
								<option selected="selected" class="text-primary">==선택==</option>
								<optgroup label="사무직">
									<option value="frontend_developer">Front-End Developer</option>
									<option value="php_developor">PHP Developer</option>
									<option value="python_developer">Python Developer</option>
									<option value="rails_developer"> Rails Developer</option>
									<option value="web_designer">Web Designer</option>
									<option value="WordPress_developer">WordPress Developer</option>
								</optgroup>
								<optgroup label="Mobile">
									<option value="Android_developer">Androild Developer</option>
									<option value="iOS_developer">iOS Developer</option>
									<option value="mobile_designer">Mobile Designer</option>
								</optgroup>
								<optgroup label="Business">
									<option value="business_owner">Business Owner</option>
									<option value="freelancer">Freelancer</option>
								</optgroup>
								<optgroup label="Other">
									<option value="secretary">Secretary</option>
									<option value="maintenance">Maintenance</option>
								</optgroup>
							</select>
						   </div>	
						 </div>
					   </div>
						<br>
						<div class="row">
						<div class="col-md-12 form-group">
						   <div class="input-group">
						     <span class="input-group-addon">Number</span>
							 <input class="form-control" id="company_number" name="company_number" 
							        type="text" placeholder="사업자 등록번호를 입력하세요">
						   </div>   
						</div>
						</div>
						
						<br>
						<div class="form-group">
						   <div class="input-group">
						    <span class="input-group-addon">Address</span>
							<input class="form-control" id="company_addr" name="company_addr" 
							       type="text" placeholder="기업 주소를 입력하세요">
						   </div>		
						</div>
						
						<br>
						<div class="form-group">
						   <div class="input-group">
						     <span class="input-group-addon">Site</span>
							 <input class="form-control" id="company_site" name="company_site" 
							        type="text" placeholder="기업 홈페이지 주소를 입력하세요">
					       </div>			
						</div>
						
						<br>
						<div class="form-group">
						   <div class="input-group">
							<label for="company_intro">기업 소개</label><br>
							<textarea class="form-control" cols="67" rows="5" id="company_intro"
							          name="company_intro" placeholder="기업 소개글을 입력하세요"></textarea>
						   </div>
						</div>
						
					</form>
				</div>


				
				<div id="registerDiv" class="modal-footer">
					<a class="btn btn-primary btn-block" id="register">완료</a>
				</div>
				


			</div>
		</div>
	</div>