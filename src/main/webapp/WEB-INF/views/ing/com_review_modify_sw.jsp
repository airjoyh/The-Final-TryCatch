<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 Q&A 글수정</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contest_qna_register.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>

<!-- 임시 js -->
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
			<div class='com-contest-head'>
				<div class='title-wrapper'>
					<div class='column-title'>콘테스트 Q&A 글수정</div>
				</div>
				<div class='wrapper'>
					<div class='com-qna-title'>
							<div class="row" hidden="" >
						        <div class="input-group">
						            <span class="input-group-addon">글번호</span> <input
						            	  class="form-control" id="title" name="title" type="text"
						                  style="width: 35%" placeholder="글번호 자동입력." readonly="readonly">
						            <span class="input-group-addon" style="padding-left: 3em;">작성일</span> <input
						                  class="form-control" id="writer" name="writer"
						                  style="width: 35%" placeholder="yy-mm-dd hh-MM-ss">
						        </div>
						    </div>
							<span class="input-group-addon" >제목</span>&nbsp;&nbsp;&nbsp; <input
				                  class="qna-title" id="title" name="title" type="text"
				                  style="width: 35%" placeholder="제목을 입력하세요." readonly="readonly">
				            <span class="input-group-addon" style="padding-left: 3em;">작성자</span> <input
				                  class="qna-writer" id="writer" name="writer"
				                  style="width: 35%" placeholder="작성자를 입력하세요." readonly="readonly">
					</div>
					<div class='com-qna-good'>
						<label for="good">해당 기업의 장점을 적어주세요</label><br>
				        <textarea name="strong" rows="3" class="form-ta" id="good"></textarea>
					</div>
					<div class='com-qna-bad'>
						<label for="bad">해당 기업의 단점을 적어주세요</label><br>
				        <textarea name="weak" rows="3" class="form-ta" id="bad"></textarea>
					</div>
					<div class='com-qna-ceo'>
						<label for="want">경영진에게 바라는점을 적어주세요</label><br>
				        <textarea name="toCEO" rows="3" class="form-ta" id="want"></textarea>
					</div>
					<div class='com-qna-star'>
						<label for="starPoint" style="padding-bottom: 10px;">평점</label>
							<div class="star-line">
					            <ul class="list-group">
					               <li class="list-group-item">승진기회 및 가능성 
					               	  <span class="star-input" id="star-A" style="float: right;">
						                  <span class="input"> 
						                  <input type="radio" name="possibility" id="p1" value="1"> <label for="p1">1</label> 
						                  <input type="radio" name="possibility" id="p2" value="2"> <label for="p2">2</label> 
						                  <input type="radio" name="possibility" id="p3" value="3"> <label for="p3">3</label> 
						                  <input type="radio" name="possibility" id="p4" value="4"> <label for="p4">4</label> 
						                  <input type="radio" name="possibility" id="p5" value="5"> <label for="p5">5</label> 
						                  </span> &nbsp;
									 </span>
					              </li><br>
					              <li class="list-group-item">복지 및 급여 
					              	 <span class="star-input" id="star-B" style="float: right;">
					                      <span class="input"> 
					                      <input type="radio" name="welSal" id="p6" value="1"> <label for="p6">1</label>
					                      <input type="radio" name="welSal" id="p7" value="2"> <label for="p7">2</label> 
					                      <input type="radio" name="welSal" id="p8" value="3"> <label for="p8">3</label> 
					                      <input type="radio" name="welSal" id="p9" value="4"> <label for="p9">4</label> 
					                      <input type="radio" name="welSal" id="p10" value="5"> <label for="p10">5</label> 
					                      </span> &nbsp;
					                 </span>
					             </li><br>
					             <li class="list-group-item">업무와 삶의 균형
					              <span class="star-input" id="star-C" style="float: right;">
					                   <span class="input"> 
					                   <input type="radio" name="balance" id="p11" value="1"> <label for="p11">1</label>
					                   <input type="radio" name="balance" id="p12" value="2"> <label for="p12">2</label> 
					                   <input type="radio" name="balance" id="p13" value="3"> <label for="p13">3</label>
					                   <input type="radio" name="balance" id="p14" value="4"> <label for="p14">4</label>
					                   <input type="radio" name="balance" id="p15" value="5"> <label for="p15">5</label>
					                   </span> &nbsp;
					             </span>
					            </li><br>
					            <li class="list-group-item">사내문화 
					             <span class="star-input" id="star-D" style="float: right;"> 
					             	  <span class="input">
					                  <input type="radio" name="culture" id="p16" value="1"> <label for="p16">1</label> 
					                  <input type="radio" name="culture" id="p17" value="2"> <label for="p17">2</label>
					                  <input type="radio" name="culture" id="p18" value="3"> <label for="p18">3</label> 
					                  <input type="radio" name="culture" id="p19" value="4"> <label for="p19">4</label>
					                  <input type="radio" name="culture" id="p20" value="5"> <label for="p20">5</label>
					                  </span> &nbsp;
					            </span>
					           </li><br>
					           <li class="list-group-item">경영진 
					            <span class="star-input" id="star-E" style="float: right;"> 
					            	<span class="input">
					                <input type="radio" name="manager" id="p21" value="1"> <label for="p21">1</label> 
					                <input type="radio" name="manager" id="p22" value="2"> <label for="p22">2</label>
					                <input type="radio" name="manager" id="p23" value="3"> <label for="p23">3</label> 
					                <input type="radio" name="manager" id="p24" value="4"> <label for="p24">4</label>
					                <input type="radio" name="manager" id="p25" value="5"> <label for="p25">5</label>
					                </span> &nbsp;
					           </span>
					          </li>
					         </ul>
					      </div>
					</div>
					<div class='com-inline-btn'>
						<input type="button" class='register-qna' value='글 등록'>
						<input type="button" class='register-qna' value='취소'>
					</div>
					
					</div>
			</div><!-- section_main1 -->
			
		</div><!-- column-left -->
		
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


</body>
</html>
