<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="section_login">
	<div class="login-info">
		<div class="user-icon">
			<img src="${initParam.rootPath }/resources/image/ing/icon-1.jpg">
		</div>
		<div class="id_div">
			<div id="logoutDiv" class="logout-btn">
				<a id="logout">로그아웃</a>
			</div>
		</div>
		<div class="user-email">${company_login_member_id}</div>
	</div>
	<div class="login-tab">
		<div class="mypage">비밀번호 변경</div>
		<div class="note">
			쪽지 <label class="note-cnt"></label> <span id="note-cnt">${statusCount}</span>
		</div>
	</div>
</div>
<!-- section_login -->
<div class="section_zzim">
	<div class="title-wrapper">
		<div class="column-zzimtitle">관심회원 리스트</div>
	</div>
	<div class="wrapper">
		<div class="column-contents">
			<!-- 있으면 테이블 없으면 i -->
			<div class="zzim-content-box">
			<table class="zzim-table">
					<!-- 찜한회원리스트  forEach-->
				<c:forEach items="${comzzimList }" begin="0" end="4" var="zzim">
					<tr>
						<td style="width: 25%;"><a href="${initParam.rootPath }/company/personSearch/read?port_id=${zzim.zzim_selected }">${zzim.user_id }</a></td>
					</tr>
				</c:forEach> 
			</table>
			  <div class="zzim-more-btn">	
			  <a href="${initParam.rootPath }/com/port/zzimlist"><div class="more-btn">더보기</div></a> 
			  </div>
		</div>
		</div>
	</div>
</div>
<!-- section_zzim -->