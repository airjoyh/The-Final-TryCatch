<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
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
				<!-- 찜한기업리스트  forEach-->
				<c:forEach items="${zzimListFive }" begin="0" end="4" var="zzim">
					<tr>
						<td style="width: 25%;"><a href="${initParam.rootPath }/user/review/list?company_id=${zzim.zzim_selected }">${zzim.company_name }</a></td>
					</tr>
				</c:forEach>
			</table>	
			<a href="${initParam.rootPath }/user/zzimlist"><div class="more-btn">더보기</div></a>
		</div>
		</div>
		
	</div>
</div>
<!-- section_zzim -->


