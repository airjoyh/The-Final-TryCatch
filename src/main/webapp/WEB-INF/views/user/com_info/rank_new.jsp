<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- C태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업순위</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/comRank_sw.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>


<style>
.simple-table{
	position: relative;
	text-align: left;
	font-size: 15px;
	border-bottom: 1px solid #bbb;
}
.simple-table .tbl-h1{
	width: 80%;
}
.simple-table .tbl-h2{
	width: 20%;
}

</style>
<script type="text/javascript">

</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_main'>
				<div class='com-contest-head'>
					<div class='title-wrapper'>
						<div class='column-title'>기업 평점순위</div>
					</div>
				</div><!-- com-contest-head -->
				<div class="com-contest-box">
					<div class="review-content">
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>종합만족도</label><br>	
												<c:forEach items="${total }" var="total">
												<div class="star-rank-box">
													<label for="a_${total.rank}">
														<font>${total.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${total.company_id }" style="text-decoration: none; color: black;">${total.company_name }</a>
													</label>
													<label class="star-label" style="float: right;">
														<span class="badge a${total.rank}"><b>${total.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${total.rank}">
														<progress id="progressBar" max="100" value="${total.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/totalRank?action=totalRank"><button class="star-btn">더보기</button></a>
											</div>
											<div class="star-right">
												<label>승진 및 기회가능성</label><br>	
												<c:forEach items="${possibility }" var="possibility">
												<div class="star-rank-box">
													<label for="a_${possibility.rank}">
														<font>${possibility.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${possibility.company_id }" style="text-decoration: none; color: black;">${possibility.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${possibility.rank}"><b>${possibility.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${possibility.rank}">
														<progress id="progressBar" max="100" value="${possibility.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/com_info/list/possibilityRank?action=posibility"><button class="star-btn">더보기</button></a>
											</div>
										</div>
									</div>
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>복지 및 급여</label><br>																					
												<c:forEach items="${welSal }" var="welSal">
												<div class="star-rank-box">
													<label for="a_${welSal.rank}">
														<font>${welSal.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${welSal.company_id }" style="text-decoration: none; color: black;">${welSal.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${welSal.rank}"><b>${welSal.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${welSal.rank}">
														<progress id="progressBar" max="100" value="${welSal.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/cominfo/list/welSalRank?action=welSal"><button class="star-btn">더보기</button></a>
											</div>
											<div class="star-right">
												<label>업무와 삶의 균형</label><br>										
												<c:forEach items="${balance }" var="balance">
												<div class="star-rank-box">
													<label for="a_${balance.rank}">
														<font>${balance.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${balance.company_id }" style="text-decoration: none; color: black;">${balance.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${balance.rank}"><b>${balance.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${balance.rank}">
														<progress id="progressBar" max="100" value="${balance.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/cominfo/list/balanceRank?action=balance"><button class="star-btn">더보기</button></a>
											</div>
										</div>
									</div>
									<div class="review-box">
										<div class="star-box">
											<div class="star-left">
												<label>사내문화</label><br>																					
												<c:forEach items="${culture }" var="culture">
												<div class="star-rank-box">
													<label for="a_${culture.rank}">
														<font>${culture.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${culture.company_id }" style="text-decoration: none; color: black;">${culture.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${culture.rank}" style="background-color: teal;"><b>${culture.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${culture.rank}">
														<progress id="progressBar" max="100" value="${culture.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/cominfo/list/cultureRank?action=culture"><button class="star-btn">더보기</button></a>
											</div>
											<div class="star-right">
												<label>경영진</label><br>										
												<c:forEach items="${manager }" var="manager">
												<div class="star-rank-box">
													<label for="a_${manager.rank}">
														<font>${manager.rank}위</font>
														<a href="${initParam.rootPath }/user/review/list?company_id=${manager.company_id }" style="text-decoration: none; color: black;">${manager.company_name }</a>
													</label>
													<label class="star-label">
														<span class="badge a${manager.rank}" style="background-color: teal;"><b>${manager.avg_all }</b>/5점</span>
													</label><br>
													<div class="star-rank" id="a_${manager.rank}">
														<progress id="progressBar" max="100" value="${manager.avg_all*20 }"></progress>								
													</div>
												</div>
												</c:forEach>
												<a href="${initParam.rootPath }/user/cominfo/list/managerRank?action=manager"><button class="star-btn">더보기</button></a>
											</div>
										</div>
									</div>
					</div>
					<!-- review-content -->
				</div>
			</div><!-- section_main1 -->
				
		</div>
		
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
			
			
			
		<!-- modal 코드 -->
		
		<!-- 회원가입 모달 -->
		<div class="modal" id="register">
			<div class="modal-pannel">
				<div class="modal-title">회원가입 <a href="#close">CLOSE</a></div>
				<div class="modal-body">
					<input id="member_id" name="member_id" 
				       	type="email" placeholder="이메일을 입력하세요">
					<input id="member_pass" name="member_pass"
					   	type="password" placeholder="비밀번호를 입력하세요">
					<input id="member_pass" name="member_pass"
					   	type="password" placeholder="비밀번호 확인" style="float: right;">
					<input id="user_authCode" name="user_authCode"
					  	type="text" placeholder="60초 안에 인증코드를 입력해주세요" size="20">
					<input type="button" name="sendEmail" id="sendEmail"
				       	value="인증코드 요청">
					</div>
					
				<div class="modal-footer">
					<input type="button" name="emailConfirm" id="emailConfirm"
				       	value="완료">
					</div>
				</div>
			</div>
			
		<!-- 비밀번호 찾기 모달 -->	
		<div class="modal" id="find-pwd">
		<div class="modal-pannel">
				<div class="modal-title">회원가입 <a href="#close">CLOSE</a></div>
				<div class="modal-body">
					<input id="member_id" name="member_id" 
				       	type="email" placeholder="이메일을 입력하세요">
					<i>*가입하신 이메일로 임시 비밀번호가 전송됩니다.</i>
					</div>
					
				<div class="modal-footer">
					<input type="button" name="emailConfirm" id="emailConfirm"
				       	value="완료">
					</div>
				</div>
			</div>
		</div>

	<!-- frame -->
<script type="text/javascript">
$(function(){
	$('.star-btn').on("click", function(){
		self.location="${initParam.rootPath }/blist"
	});
});
</script>

</body>
</html>
