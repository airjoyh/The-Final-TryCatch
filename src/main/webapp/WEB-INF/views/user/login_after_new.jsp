<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/zzim_jw.css" rel="stylesheet" type="text/css">
	
	
<div class="section_login">
	<div class="login-info">
		<div class="user-icon">
			<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">
		</div>
	<div class="id_div">
		<div id="logoutDiv" class="logout-btn">
			<a id="logout">로그아웃</a>
		</div>
	</div>
		<div class="user-email">${user_login_id}</div>
	</div>
	<div class="login-tab">
		<div class="mypage">마이페이지</div>
		<div class="note">
		쪽지 <label class="note-cnt"></label> <span id="note-cnt">${statusCount}</span>
	</div>
	<!-- hidden nav -->
	<div class="mypage-dropdown">
		<div class="line"></div>
			<div class="portfolio">포트폴리오 페이지</div>
			<div class="pwd-change">비밀번호 변경</div>
			</div>
		</div>
	</div>
	<!-- section_login -->
	<div class="section_zzim">
		<div class="title-wrapper">
			<div class="column-zzimtitle">관심기업 리스트</div>
		</div>
	<div class="wrapper">
		<div class="column-contents">
		
		<div class="zzim-content-box">
			<table class="zzim-table">
				<tbody>
			<!-- 찜한기업리스트  forEach-->
			<%-- <c:forEach varStatus="stat" items="${zzimList }" var="zzim">
			<tr>
				<td>${zzim.company_name}</td>
			</tr>
			</c:forEach> --%>
					
					<tr>
						<td><a href="#가라컴퍼니">가라컴퍼니</a></td>
					</tr>
					<tr>
						<td><a href="#가라컴퍼니">다정엔터테인먼트</a></td>
					</tr>
					<tr> 
						<td><a href="#가라컴퍼니">지원프로덕션</a></td>
					</tr>
					<!-- <tr>
						<td><a href="#가라컴퍼니">할리스커피</a></td>
					</tr>
					<tr>
						<td><a href="#가라컴퍼니">맥도날드</a></td>
					</tr> -->
					 
				</tbody>
			</table>
		</div>
		
			<div class="zzim-page-box">페이징</div>
			
		</div>
		
	</div>
</div>
<!-- section_zzim -->


