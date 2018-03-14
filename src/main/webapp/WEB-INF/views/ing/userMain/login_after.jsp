<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="section_login">
	<div class='login-info'>
		<div class='user-icon'>
			<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">
		</div>
		<div class='id_div'>
			<div class='logout-btn'>
				<a>로그아웃</a>
			</div>
		</div>
		<div class='user-email'>bluecayseyes@naver.com</div>
	</div>
	<div class='login-tab'>
		<div class='mypage'>마이페이지</div>
		<div class='note'>
			쪽지 <label class='note-cnt'></label> <span id='note-cnt'>0</span>
		</div>
		<!-- hidden nav -->
		<div class='mypage-dropdown'>
			<div class='line'></div>
			<div class='portfolio'>포트폴리오 페이지</div>
			<div class='pwd-change'>비밀번호 변경</div>
		</div>
	</div>
</div>
<!-- section_login -->

<div class="section_zzim">
	<div class="title-wrapper">
		<div class='column-title'>관심기업 리스트</div>
	</div>
	<div class='wrapper'>
		<div class='column-contents'>
			<i>현재 찜한 기업이 없습니다.</i>
			<!-- 있으면 테이블 없으면 i -->
			<table class='zzim-table'>
				<thead>
					<tr>
						<th>기업명</th>
						<th>평점</th>
					</tr>
				</thead>
				<tbody>
					<!-- 찜한기업리스트  forEach-->
					<c:forEach begin="1" end="5" var="ss">
					<tr>
						<td></td>
						<td></td>
					</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
</div>
<!-- section_zzim -->