<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class='section_login'>
	<div class="wrapper">
		<div>
			<input class="login-input" type="email" id="login_id" name="login_id"
				placeholder="이메일">
		</div>
		<div>
			<input class="login-input" type="password" id="login_pass"
				name="login_pass" placeholder="비밀번호">
		</div>
		<div>
			<input type="button" id="login" value="로그인" class="login-btn">
		</div>
		<span class="pure-checkbox" style="float: left;"> <input
			id="checkboxtoggle" name="checkbox" type="checkbox"> <label
			for="checkboxtoggle">정보기억</label>
		</span> <span style="float: right; padding: 2px 0 0 6px;"> <a
			href="#comModal" class="openFindPassModal" id="openFindPassModal">비밀번호
				찾기</a>
		</span> <span style="float: right; padding: 2px 6px;"> <a
			href="#comModal" class="openJoinModal" id="openJoinModal">회원가입</a>
		</span>
	</div>
</div>