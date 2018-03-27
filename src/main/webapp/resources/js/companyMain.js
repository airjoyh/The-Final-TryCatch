
$(document).ready(function(){
	
	//로그인 상태 확인해서 jsp 페이지 로드
	if(loginState != 'login'){//로그인상태가 아닐때
		$('#login_beforeDiv').show();
		$('#login_afterDiv').hide();
		
	}else if(loginState == 'login'){//로그인 상태일때			
		$('#login_beforeDiv').hide();
		$('#login_afterDiv').show();
		
	}
/* ---------------------------------------- 로그인 ----------------------------------------*/
	
	//로그인 버튼 클릭
	$('#login').on("click",function() {
		var login_id = $('#login_id');
		var login_pass = $('#login_pass');
		
		$.ajax({
			type: "post",
			url: rootPath+"/company/loginPost",//"loginPost",
			data:{"login_id":login_id.val(), "login_pass":login_pass.val()},
			success:function(result){ //result = "noRegister" 또는 "noAuth" 또는 "login|7"
				console.log(result); //strArr[] = ["login","7"];
				var strArr = result.split('|');
				//if(result=='noRegister'){
				if(strArr[0]=='noRegister'){
					alert('아이디와 비밀번호가 일치하지 않습니다.');
			
				}else if(strArr[0]=='login'){
					//alert("strArr[1] >>> "+strArr[1]);
					afterLogin(strArr[1]);
					$('#login_beforeDiv').hide();
					$('#login_afterDiv').show();
					loginState = 'login';
					location.reload();
				}
			}
		});
		
	});//login버튼 클릭

/* ---------------------------------------- 로그아웃 ----------------------------------------*/
	
	$('.logout-btn').on("click", '#logout', function(){
		console.log('로그아웃 버튼 클릭');
		location.href = rootPath+'/company/logout'; //'${initParam.rootPath}/user/logout';
		$('#login_beforeDiv').show();
		$('#login_afterDiv').hide();
	});
	
/* ---------------------------------------- 회원가입 ----------------------------------------*/
	
	//회원 가입 버튼 클릭
	$('.openJoinModal').on("click", function(){
		console.log('회원가입 버튼 클릭');
		//$('#companyModal').toggle();
		
		$('#action').html('기업 회원가입 <a href="#close">CLOSE</a>');
		$('#registerForm input').val('');//초기화
		$('#idCheck').html('');
		$('select[name=company_size]').val('==선택==');
		$('select[name=company_line]').val('==선택==');
		$('#company_intro').val('');
	});//openJoinModal클릭
	
	
	$('.modal-footer').on("click", "#registerBtn", function(){
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
			var idCheck = $('#idCheckDiv').html();
			console.log(idCheck);
			
			if(idCheck.indexOf('사용 가능한 아이디입니다.')>=0){
				$.ajax({
					type: 'post',
					url: rootPath+"/company/register",//"register",
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
							$('#comModal').fadeOut();
							//$('#companyModal').modal('toggle');
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
	
/* ---------------------------------------- 중복확인  ----------------------------------------*/

	$('.modal-body').on("click", "#idCheckBtn", function(){
		console.log('중복확인 버튼 클릭');
		var member_id = $('#member_id');
		var member_idExp = /^[a-zA-z0-9]{6,15}$/;
		
		if (!member_idExp.test(member_id.val())) {
			alert("아이디는 6~15자리를 입력하시오.");
			member_id.focus();
		}else{
			$.ajax({
				type:"post",
				url: rootPath+"/company/idCheck",//"idCheck",
				data:{"member_id":member_id.val()},
				success:function(result){
					if(result=='duplication'){
						console.log(result);
						$('#idCheckDiv').html('<font color=red size=1>이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.</font>');
					}else{
						$('#idCheckDiv').html('<font color=red size=1>사용 가능한 아이디입니다.</font>');
					}
				}
			});
		}
	});//idCheck버튼 클릭
	
/* ---------------------------------------- 쪽지 ----------------------------------------*/
	
	$('.login-tab').on("click",'.note', function () {
 	   console.log('쪽지 버튼 클릭');
      
 	   self.location= rootPath+'/company/note/list'; //"${initParam.rootPath }/user/note/list";
   }); 
	
});//ready function()

	// 로그인한 후에 아이디랑 쪽지 숫자 뜨게 하기
	function afterLogin(noteCount) {
		console.log('afterLogin>>>');
		console.log('afterLogin에 들어오는 쪽지 갯수 >>> '+noteCount);
		var login_id = $('#login_id').val();
		// var statusCount = '${statusCount}';
	
		if ($('#rightDiv .user-email').html() == '') {
			console.log('if:' + login_id)// airjoyh@naver.com
			// $('#rightDiv .user-email').html($('#login_id').val());
			$('#rightDiv .user-email').html(login_id);
		} else {
			console.log('else')
		}
	
		if ($('#rightDiv #note-cnt').html() == '') {
			console.log('쪽지 갯수 >>> ' + noteCount);
			$('#rightDiv #note-cnt').html(noteCount);
		}
	}

