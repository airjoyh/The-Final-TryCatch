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
	<%@include file="com-nav.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='com-contest-info'>
			
				<div class='title-wrapper'>
					<input type="hidden" id="company_id" name="company_id" value="${company_login_company_id }">
					<div class='column-title'>콘테스트 개최정보 입력</div>
				</div>
				
				<div class='wrapper'>
					<div class='cont-regist-contents'> 
						<div class='cont-reg-title'>콘테스트 타이틀</div>
						<input type="text" id="contest_title" name="contest_title" placeholder="개최할 콘테스트의 타이틀을 입력해주세요">
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>일자선택</div>
						<div class='half-contents'>
							<input id="contest_startDate" name="contest_startDate" placeholder="시작 날짜  ex)2018/03/07 18:30">
							<input id="contest_endDate" name="contest_endDate" 
								placeholder="끝날짜 ex)2013/03/07 19:30:00" style="border-top: 0;">
						</div>
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>채용인원수</div>
						<input id="contest_hireNumber" name="contest_hireNumber" placeholder="숫자만 입력해주세요" value="10">
					</div>
					<div class='cont-regist-contents'>
						<div class='select' id="contest_field" name="contest_field">
							<div class='cont-reg-title'>관련분야를 추가해주세요</div>
							<select style="color: #777; width:75%">
								<option selected="selected" style="color: #ddd;">관련 직군을 선택해주세요</option>
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

						<div class='cont-regist-contents'>
							<div class='cont-reg-title'>콘테스트 내용 작성</div>
							<textarea name="contest_contents" rows="10" class="form-control"
								id="contest_contents">잘하세요</textarea>
						</div>
						<div class='cont-reg-title'>담당자명</div>
						<input id="manager_name" name="manager_name" placeholder="담당자 이름"
							value="홍길동"> 
						<div class='cont-reg-title'>담당부서</div>
						<input id="team_name" name="team_name" placeholder="담당자 소속" value="개발부"> 
						<div class='cont-reg-title'>담당자 이메일</div>
						<input id="manager_email" name="manager_email" placeholder="담당자 이메일" value="gildong@daum.net"> 
						<div class='cont-reg-title'>담당자 연락처</div>
						<input id="manager_tel" name="manager_tel" placeholder="담당자 연락처" value="010-1234-4567">

						<div class='cont-reg-btn-area'>
							<button type="button" id="contestRegisterBtn">다음</button>
							<button type="button" >취소</button>
						</div>

					</div>
					
			</div><!-- com-contest-info -->
		</div><!-- column-left -->
		<!-- right section!!************************************************************** -->
		<div class='column-right'>
		
			<div class="section_login">
				<div class="wrapper">
				    <div><input class='login-input' type="email" name="email" placeholder="이메일"></div>
				    <div><input class='login-input' type="password" name="password" placeholder="비밀번호"></div>
				    <div><input type="button" value="로그인" class='login-btn'> </div>
				    <span class="pure-checkbox" style="float: left;">
                  	  <input id="checkboxtoggle" name="checkbox" type="checkbox">
                      <label for="checkboxtoggle">정보기억</label>
                      </span>
                    <span style="float: right;padding: 2px 0 0 6px;">
                	  <a href='#find-pwd'>비밀번호 찾기</a>
                	  </span>
                    <span style="float: right;padding: 2px 6px;">
                	  <a href='#register'>회원가입</a>
                	  </span>
				  </div>
				</div><!-- section_login -->
				
				<div class="section_zzim">
					<div class="title-wrapper">
						<div class='column-title'>관심기업 리스트</div>
					</div>
					<div class='wrapper'>
						<div class='column-contents'>
							<i>현재 찜한 기업이 없습니다.</i><!-- 있으면 테이블 없으면 i -->
							<table class='zzim-table'>
								<thead>
									<tr>
										<th>기업명</th>
										<th>평점</th>
										</tr>
									</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										</tr>
									</tbody>
								
							</table>
						</div>
					</div>
						
						
						
				</div><!-- section_zzim -->
				
			</div><!-- column-right -->
	</div>

</body>
</html>
