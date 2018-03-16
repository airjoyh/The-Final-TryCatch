<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>그리드 테스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/portfolio.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Mina:400,700" rel="stylesheet">

<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>


<style>

</style>

<script type="text/javascript">

$(function() {
	//글자수 제한 1000자
	$('.type-cnt').text($('#pf-intro-ta').val().length+'자/1000자')
    $('#pf-intro-ta').on('keyup', function() {
        if($(this).val().length > 1000) {
            $(this).val($(this).val().substring(0,1000));
        }
        $('.type-cnt').text($(this).val().length+'자/1000자')
    });
});

</script>



</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- nav-area -->
	<div class='nav'>
		<div class='navbar'>
			<div class='nav-item'>
				<div class='brand'>
					<img src="${initParam.rootPath }/resources/image/ing/brand.svg">
				</div>
				<div class=search></div>
				<ul>
					<li id='intro'>소개</li>
					<li id='contest'>콘테스트</li>
					<li id='company'>기업</li>
					<li id='community'>커뮤니티</li>
					<li id='faq' style="">FAQ</li>
					<li id='com-user' style='float: right; text-align: right;'>기업회원</li>
				</ul>
			</div>
			<div class='nav-list'></div>
		</div>
	</div>



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
							bluecatseyes
						</div>
						<div class='com-zzim-btn' style="display:none;">찜하기</div> 
						<div id='pf-modify-fin' style="display:none;">완료</div> 
						<div id='pf-modify-btn'>수정</div> 
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
						<div class='body-title'>Skills</div>
						<div class='skill-list'>
							<table class='pf-list'>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>	
							</table>
						</div>
						<div class='pf-modify'>
							<select style="color: #777;">
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
							</select>
							<span id='' class='add-btn'>추가하기</span>
						</div>
					</div>
					<div class='pf-lisence'>
						<div class='body-title'>Lisence</div>
						<div class='skill-list'>
							<table class='pf-list'>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>
							</table>
						</div>
						<div class='pf-modify'>
							<input type="text" id='lisence-name' placeholder="자격증명을 입력하세요.">
							<span id='' class='add-btn'>추가하기</span>
						</div>
					</div>
					<div class='pf-award'>
						<div class='body-title'>Award</div>
												<div class='skill-list'>
							<table class='pf-list'>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>	
							</table>
						</div>
						<div class='pf-modify'>
							<input type="text" id='award-name' placeholder="수상경력을 입력하세요.">
							<span id='' class='add-btn'>추가하기</span>
						</div>
					</div>
					<div class='pf-pflink'>
						<div class='body-title'>Portfolio</div>
						<div class='skill-list'>
							<table class='pf-list'>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>
								<tr>
									<td width="552px">웹 개발자</td>
									<td class='del-td'><a class='pf-modify del-list'>삭제</a></td>
								</tr>
							</table>
						</div>
						<div class='pf-modify'>
							<input type="text" id='pf-url' placeholder="사이트 url을 입력해주세요">
							<span id='' class='add-btn'>추가하기</span>
						</div>
					</div>
				</div>
				
			</div><!-- section_pf -->
				
		</div><!-- column-left -->
		
		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<%@include file="userMain/login_after.jsp" %>
		</div><!-- column-right -->


	</div><!-- container -->
	
	<!-- footer-area -->

</body>
</html>
