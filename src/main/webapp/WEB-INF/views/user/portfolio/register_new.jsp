<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>포트폴리오</title>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	<%@ include file="../../user-nav_new.jsp" %>

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
							${user_login_id }
						</div>
						<div id='pf-modify-fin'>완료</div> 
						<div id='pf-modify-btn' style="display:none;">수정</div> 
						<div class='com-zzim-btn' style="display:none;">찜하기</div> 
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
						<div class='body-title'>Self-introduce</div><a class='type-cnt'></a>
						<textarea rows="10" placeholder="자기소개를 해주세요 (1000자 제한)" id='pf-intro-ta'></textarea>
					</div>
					<div class='pf-skill'>
						<p class='body-title'>Skills</p>
						<div class='skills'>
							<table class='pf-list'>
								
							</table>

							<div class='pf-modify'>
								<select style="color: #777;" name="port_skill">
									<option selected="selected" style="color: #ddd;">직군을선택해주세요</option>
									<option>웹 개발자</option>
									<option>서버 개발자</option>
									<option>자바 개발자</option>
									<option>프론트엔드 개발자</option>
									<option>iOS 개발자</option>
									<option>파이썬 개발자</option>
									<option>안드로이드 개발자</option>
									<option>C,C++ 개발자</option>
									<option>데이터 엔지니어</option>
									<option>시스템,네트워크 관리자</option>
									<option>DevOps 시스템 관리자</option>
									<option>Node.js 개발자</option>
									<option>PHP 개발자</option>
									<option>Spring 개발자</option>
									<option>개발 매니저</option>
									<option>프로덕트 매니저</option>
									<option>QA,테스트 엔지니어</option>
									<option>영상,음성 엔지니어</option>
									<option>보안 엔지니어</option>
									<option>웹 퍼블리셔</option>
									<option>.net개발자</option>
									<option>임베디드 개발자</option>
									<option>하드웨어 엔지니어</option>
									<option>루비온레일즈 개발자</option>
									<option>그래픽스 엔지니어</option>
									<option>CTO</option>
								</select> <span id='' class='add-btn'>추가하기</span>
							</div>
						</div>
					</div>
					<div class='pf-lisence'>
						<p class='body-title'>Lisence -  <i style="font-size: 12px;color: #555">자격증은 추후 면접 시 증명 가능하여야 합니다.</i></p>
						<div class='lisence'>
							<table class='pf-list'>
								
							</table>
							<div class='pf-modify'>
								<input type="text" id='lisence-name' placeholder="자격증명을 입력하세요.">
								<span id='' class='add-btn'>추가하기</span>
							</div>
						</div>
					</div>
					<div class='pf-award'>
						<p class='body-title'>Award</p>
						<div class='award'>
							<table class='pf-list'>
								
							</table>
							<div class='pf-modify'>
								<input type="text" id='award-name' placeholder="수상경력을 입력하세요.">
								<span id='' class='add-btn'>추가하기</span>
							</div>
						</div>
					</div>
					<div class='pf-pflink'>
						<p class='body-title'>Portfolio</p>
						<div class='pf-link'>
							<table class='pf-list'>
								
							</table>
							<div class='pf-modify'>
								<input type="text" id='pf-url' placeholder="사이트 url을 입력해주세요">
								<span id='' class='add-btn'>추가하기</span>
							</div>
						</div>
					</div>
				</div>
				
			</div><!-- section_pf -->
				
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->
			
		<!-- modal import --> 
		<%@ include file="../user_modals_new.jsp" %>


	</div><!-- container -->
	
	<!-- footer-area -->
	
<script type="text/javascript">
	$(function() {

		if(loginState != 'login'){
			alert('로그인되지 않은 상태입니다.');
			self.location = '${initParam.rootPath}/user/main';
		}
		
		//글자수 제한 1000자
		$('.type-cnt').text($('#pf-intro-ta').val().length+'자/1000자')
	    $('#pf-intro-ta').on('keyup', function() {
	        if($(this).val().length > 1000) {
	            $(this).val($(this).val().substring(0,1000));
	        }
	        $('.type-cnt').text($(this).val().length+'자/1000자')
	    });
		
		//추가버튼 클릭 액션
		$('.add-btn').on('click',function(){
			var insertData = $(this).prev().val();
			var test = $(this).closest('div').siblings().
			append('<tr><td width="552px">'+'-'+insertData+'</td><td class="del-td"><a class="pf-modify del-list">삭제</a></td></tr>');
			$(this).siblings().val('');
		});
		
		//삭제클릭
		$(document).on('click','.del-list',function(){
			$(this).closest('tr').remove();
		});
		
		//완료클릭
		$('#pf-modify-fin').on('click',function(){
			//$('#pf-intro-ta').attr('disabled','disabled');
			//$(this).hide();
			//$('#pf-modify-btn').show();
			//$('.pf-modify').hide();
			var user_login_id = '${user_login_id}';
			console.log('완료 버튼 클릭');
			var port_exp = $('#pf-intro-ta').val();
			var port_skills = $('.skills td:first-child').text();//$('select[name=port_skill]').val();//$('.pf-list td').html();
			var port_skill = port_skills.substring(1); //1번지부터 가져오겠다.
			console.log(port_skill);/* -개발전문가-spring개발자 */
		
			var port_licenses = $('.lisence td:first-child').text();	
			var port_license = port_licenses.substring(1);	
			
			var port_awards= $('.award td:first-child').text();
			var port_award = port_awards.substring(1);
			
		 	var port_links= $('.pf-link td:first-child').text();
		 	var port_link = port_links.substring(1);
		 	
		 	if(port_exp==''){
		 		alert('자기소개를 입력해주세요.');
		 	}else{
		 		$.ajax({
		 			type:'post',
		 			url: '${initParam.rootPath}/user/portfolio/register',
		 			data: {"port_exp":port_exp, "port_skill":port_skill, 
		 				   "port_license":port_license, "port_award":port_award,
		 				   "port_link":port_link, "user_id":user_login_id},
		 			success:function(result){
		 				if(result=='success'){
		 					alert('포트폴리오가 등록되었습니다');
		 					self.location = '${initParam.rootPath}/user/main';
		 				}
		 			}
		 		
		 		});
		 	}
			 
				
		
		});
		
		//수정클릭
		$('#pf-modify-btn').on('click',function(){
			$('#pf-intro-ta').removeAttr('disabled')
			$(this).hide();
			$('#pf-modify-fin').show();
			$('.pf-modify').show();
		});
		
	});

</script>
</body>
</html>
