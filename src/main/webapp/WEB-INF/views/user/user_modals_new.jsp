<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- modal 코드 -->

<!-- 회원가입 모달 ******************************************************************-->
<div class="modal" id="register">
	<div class="modal-pannel">
		<div class="modal-title">
			회원가입 <a href="#close">CLOSE</a>
		</div>
		<div class="modal-body">
			<input id="member_id" name="member_id" type="email"
				placeholder="이메일을 입력하세요"> 
			<input id="member_pass"
				name="member_pass" type="password" placeholder="비밀번호를 입력하세요">
			<input id="member_pass2" name="member_pass2" type="password"
				placeholder="비밀번호 확인" style="float: right;"> 
			<input
				id="user_authCode" name="user_authCode" type="text"
				size="20"> 
			<input
				type="button" name="sendEmail" id="sendEmail" value="인증코드 요청">
		<div id="timer">60초 안에 인증코드를 입력해주세요.</div>
		</div>

		<div class="modal-footer">
			<input type="button" name="emailConfirm" id="emailConfirm" value="완료">
		</div>
	</div>
</div>


<!-- 비밀번호 찾기 모달  ******************************************************************-->
<div class="modal" id="find-pwd">
	<div class="modal-pannel">
		<div class="modal-title">
			비밀번호 찾기 <a href="#close">CLOSE</a>
		</div>
		<div class="modal-body">
			<input id="member_id" name="member_id" type="email"
				placeholder="이메일을 입력하세요"> <i>*가입하신 이메일로 임시 비밀번호가 전송됩니다.</i>
		</div>

		<div class="modal-footer">
			<input type="button" name="emailConfirm" id="emailConfirm" value="완료">
		</div>
	</div>
</div>
