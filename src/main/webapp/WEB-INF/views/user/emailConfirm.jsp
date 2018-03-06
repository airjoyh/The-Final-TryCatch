<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#emailConfirm').on("click", function(){
		console.log('이메일 인증 완료 버튼 클릭');
		var member_id = '${id}';
		var user_authCode = $('#user_authCode');
		
		$.ajax({
			type:'post',
			url:"emailConfirm",
			data:{"member_id":member_id, "user_authCode":user_authCode.val()},
			success:function(result){
				console.log(result)
				if(result=='success'){
					alert('이메일 인증이 완료되었습니다.');
					location.href='${initParam.rootPath }/umain';					
				}else{
					alert('인증코드가 일치하지 않습니다. 다시 한번 확인해주세요.');
				}
			}
		});
	});
	
	$('#requestAuthCode').on("click", function(){
		
	});
});

</script>
</head>
<body>
	아이디: ${id}<br>
	인증코드: <input type="text" id="user_authCode">
	<input type="button" id="requestAuthCode" value="인증번호 재요청">
	<input type="button" id="emailConfirm" value="이메일 인증 완료">	
	
	
</body>
</html>