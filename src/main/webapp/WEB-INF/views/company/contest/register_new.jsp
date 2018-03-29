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
	<!-- com-nav -->
	<%@include file="../../company-nav_new.jsp" %>

	<div class='container'>
	<!-- left section!!************************************************************** -->

		<div class='column-left'>

			<div class='com-contest-info'>

			<form action="register" name="contestRegisterForm" method="post">
				<div class='title-wrapper'>
					<input type="hidden" id="contest_id" name="contest_id" value="${contest_id }">
					<input type="hidden" id="company_id" name="company_id" value="${company_login_company_id }">
					<div class='column-title'>콘테스트 개최정보 입력</div>
				</div>

				<div class='wrapper'>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>콘테스트 타이틀</div>
						<input type="text" id="contest_title" name="contest_title" placeholder="개최할 콘테스트의 타이틀을 입력해주세요">
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'>콘테스트 시작 일자선택</div>
						<div class='half-contents'>
							<input type="date" id="contest_startDate" name="contest_startDate">
							<select name="contest_startHour" style="width:25%">
								<option>시간 선택</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
								<option>22</option>
								<option>23</option>
								<option>24</option>
							</select>
							<select name="contest_startMin" style="width:25%">
								<option>분 선택</option>
								<option>00</option>
								<option>15</option>
								<option>30</option>
								<option>45</option>
							</select>
						</div>
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title' style="margin-top:60px;">콘테스트 끝 일자선택</div>
						<div class='half-contents'>
							<input type="date" id="contest_endDate" name="contest_startDate">
							<select name="contest_endHour" style="width:25%">
								<option>시간 선택</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
								<option>22</option>
								<option>23</option>
								<option>24</option>
							</select>
							<select name="contest_endMin" style="width:25%">
								<option>분 선택</option>
								<option>00</option>
								<option>15</option>
								<option>30</option>
								<option>45</option>
							</select>
						</div>
					</div>
					<div class='cont-regist-contents'>
						<div class='cont-reg-title'style="margin-top:60px;">채용인원수</div>
						<input id="contest_hireNumber" name="contest_hireNumber" placeholder="채용 인원 수를 입력해주세요">
					</div>
					<div class='cont-regist-contents'>
						<input id="contest_field" name="contest_field" placeholder="분야를 입력해주세요.">

						</div>

						<div class='cont-regist-contents'>
							<div class='cont-reg-title'>콘테스트 내용 작성</div>
							<textarea name="contest_contents" rows="10" class="form-control"
								id="contest_contents"></textarea>
						</div>
						<div class='cont-reg-title'>담당자명</div>
						<input id="manager_name" name="manager_name" placeholder="담당자 이름">
						<div class='cont-reg-title'>담당부서</div>
						<input id="team_name" name="team_name" placeholder="담당자 소속">
						<div class='cont-reg-title'>담당자 이메일</div>
						<input id="manager_email" name="manager_email" placeholder="담당자 이메일">
						<div class='cont-reg-title'>담당자 연락처</div>
						<input id="manager_tel" name="manager_tel" placeholder="담당자 연락처">
					</div>
						<div class='cont-reg-btn-area'>
							<button type="button" id="contestRegisterBtn">다음</button>
							<button type="reset" >취소</button>
						</div>

				</form>
			</div><!-- com-contest-info -->
		</div><!-- column-left -->

		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../com_login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../com_login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->

		<!-- modal import -->
		<%@ include file="../company_modal_new.jsp" %>
	</div>
<script type="text/javascript">
$(document).ready(function() {

	if(loginState != 'login'){
		alert('로그인되지 않은 상태입니다.');
		self.location = '${initParam.rootPath}/company/main';
	}

	$('#contestRegisterBtn').on("click", function(){
		console.log('콘테스트 등록버튼 클릭');
		//var contest_hireNumberExp = /^[0-9]{1,3}/;
		var contest_startDate = $('#contest_startDate').val()+' '+$('select[name=contest_startHour]').val()+':'+$('select[name=contest_startMin]').val();
		var contest_endDate = $('#contest_endDate').val()+' '+$('select[name=contest_endHour]').val()+':'+$('select[name=contest_endMin]').val();
		console.log('시작 날짜 >>> '+contest_startDate);
		console.log('끝 날짜 >>> '+contest_endDate);
		
		if($('#contest_title').val()==''){
			alert('제목을 입력하세요.');
			$('#contest_title').focus();
		}else if($('#contest_startDate').val()==''){
			alert('시작 날짜를 입력하세요.');
			
		}else if($('select[name=contest_startHour]').val()=='시간 선택'){
			alert('시작 시간을선택하세요.');
		
		}else if($('select[name=contest_startMin]').val()=='분 선택'){
			alert('시작 분을 선택하세요');
		
		}else if($('#contest_endDate').val()==''){
			alert('끝 날짜을 입력하세요.');
			
		}else if($('select[name=contest_endHour]').val()=='시간 선택'){
			alert('끝나는 시간을 선택하세요.');
		
		}else if($('select[name=contest_endMin]').val()=='분 선택'){
			alert('끝나는 분을 선택하세요.');
		
		}else if($('#contest_hireNumber').val()==''){
			alert('채용 인원 수를 입력하세요.');
			$('#contest_hireNumber').focus();
			
		}else if($('#contest_field').val()==''){
			alert('분야를 입력하세요.');
			$('#contest_field').focus();
			
		}else if($('#contest_contents').val()==''){
			alert('내용을 입력하세요.');
			$('#contest_contents').focus();
			
		}else if($('#manager_name').val()==''){
			alert('담당자 이름을 입력하세요.');
			$('#manager_name').focus();
			
		}else if($('#team_name').val()==''){
			alert('담당자 소속을 입력하세요.');
			$('#team_name').focus();
			
		}else if($('#manager_email').val()==''){
			alert('담당자 이메일을 입력하세요.');
			$('#manager_email').focus();
			
		}else if($('#manager_tel').val()==''){
			alert('담당자 번호를 입력하세요.');
			$('#manager_tel').focus();
			
		}else{
			
			
			$.ajax({
				type: 'post',
				url: '${initParam.rootPath}/company/contest/register',
				data:{
					"company_id":$('#company_id').val(),
					"contest_title":$('#contest_title').val(),
					"contest_startDate":contest_startDate,
					"contest_endDate":contest_endDate,
					"contest_field":$('#contest_field').val(),
					"contest_hireNumber":$('#contest_hireNumber').val(),
					"contest_contents":$('#contest_contents').val(),
					"manager_name":$('#manager_name').val(),
					"team_name":$('#team_name').val(),
					"manager_email":$('#manager_email').val(),
					"manager_tel":$('#manager_tel').val()
				},
				success:function(result){
					if(result == 'success'){
						alert('콘테스트 등록에 필요한 문제를 출제하는 페이지로 이동합니다.');
						var contest_id = $('#contest_id').val();
						//alert('콘테스트 아이디 >>> '+contest_id);
						self.location='${initParam.rootPath}/company/contest/quiz/register?contest_id='+contest_id+'&quiz_no=1';
					}
				}
			});
			//document.contestRegisterForm.submit();
		}
	});
	
});

</script>
</body>
</html>
