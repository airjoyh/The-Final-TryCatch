<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>	
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html lang="kr">
<head>


<title>TryCatch</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap3 for trycatch -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom styles -->
<%-- <link href="${initParam.rootPath }/resources/css/font.css" rel="stylesheet"> --%>
<link href="${initParam.rootPath }/resources/css/trycatch.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	
	$('#contestRegisterBtn').on("click", function(){
		console.log('콘테스트 등록 버튼 클릭');
		var startDate = $('#contest_startDate').val();
		console.log('시작날짜 >>> '+startDate);
		
		document.registerForm.submit();
	}); 
	
	
	function validateCheck() {
		var f = document.registerForm;
		$.ajax({
			
		});
		//console.log($('input[name=review_possibility]').val());
		/* if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($b('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		} */
	}
	
});
</script>

</head>
<body style="background-color: #f4f4f4;">
	<!-- nav -->
	<%@include file="../../companyNavBar.jsp" %> 
	<form action="register" name="registerForm" method="post">
		  <%-- value에 ${company_login_id} --%>		
		 <input type="hidden" id="company_id" name="company_id" value="${company_login_company_id }">
		<div class="container"
			style="background-image: url('${initParam.rootPath}/resources/image/monitor/pencil.jpg');">
			<div class="row"
				style="padding-top: 8em; padding-bottom: 1em; padding-right: 4em; padding-left: 4em">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<h1 style="font-weight: 600;">콘테스트 작성</h1>
					<hr>
				</div>
			</div>
		</div>

		<div class="container"
			style="background-color: #ffffff; margin-top: 1em;">
			<div class="well well"
				style="margin-top: 2em; margin-left: 2em; margin-right: 2em;">

				<div class="row" style="padding-top: 2em; padding-bottom: 1em;">
					<div class="col-sm-2"></div>
					<div class="col-sm-5">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-modal-window"></i></span> <input
								class="form-control" id="contest_title" name="contest_title" type="text"
								placeholder="제목을 입력하세요." value="제목">
						</div>
					</div>
					</div>
					</div>
					<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> 
								<input class="form-control" id="contest_startDate" name="contest_startDate" placeholder="시작 날짜  ex)2018/03/07 18:30">
								~
								<input class="form-control" id="contest_endDate" name="contest_endDate" placeholder="끝날짜 ex)2013/03/07 19:30:00">
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div class="form-group">
							<label for="good">해당 콘테스트의 분야를 입력해주세요.</label>
							<input class="form-control" id="contest_field" name="contest_field" placeholder="분야" value="입력분야">
							<label for="bad">채용 인원수</label>
							<input class="form-control" id="contest_hireNumber" name="contest_hireNumber" placeholder="숫자만 입력해주세요" value="10">명
						</div>
					</div>
				<hr>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div class="form-group">
							<label for="want">내용</label>
							<textarea name="contest_contents" rows="10" class="form-control" id="contest_contents">잘하세요</textarea>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div class="form-group">
							<label for="good">담당자 이름</label>
							<input class="form-control" id="manager_name" name="manager_name" placeholder="담당자 이름" value="홍길동">
							<label for="bad">담당자 소속</label>
							<input class="form-control" id="team_name" name="team_name" placeholder="담당자 소속" value="개발부">
							<label for="good">담당자 이메일</label>
							<input class="form-control" id="manager_email" name="manager_email" placeholder="담당자 이메일" value="gildong@daum.net">
							<label for="bad">담당자 번호</label>
							<input class="form-control" id="manager_tel" name="manager_tel" placeholder="담당자 번호" value="010-1234-4567">
						</div>
					</div>
				<hr>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<button type="button" id="contestRegisterBtn" class="btn btn-info btn-block"
							>다음</button>
					</div>
					<div class="col-sm-4">
						<a href="#"><button type="button" class="btn btn-block">취소</button></a>
					</div>
				</div>
				</div>

			</div>
			<!-- well -->
		</div>
		<!-- container -->
	</form>

	<!-- footer -->
	<%-- <%@include file="/view/main/footer.jsp"%> --%>

</body>

</html>