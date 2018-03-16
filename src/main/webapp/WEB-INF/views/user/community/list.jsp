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
<title>커뮤니티 게시판</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/navbar.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/community_list_sw.css" rel="stylesheet" type="text/css">
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
$(function(){
	   //alert("list페이지에 들어올 때 로그인 상태 >>> ${user_loginState}, ${user_login_id}")
	   	   
			   $('#searchBtn').on( //Search 버튼 을 클릭하면
					   "click",
					   function(event){
						   
				          self.location = "list"
				             + '${pageMaker.makeQuery(1)}'
				             + "&searchType="
				             +$("select option:selected").val()
				             +"&keyword="+$('#keywordInput').val();
					   
			   });
			   $('#registBtn').on("click", function(evt){

				   self.location = "register_new";//입력폼으로 이동
			  
			   });// 여기에 글쓰기 버튼을 눌렀을때 로그인을 한 상태가 아니라면 
			      // 로그인 요청페이지가 뜨고 확인을 누르면 로그인 페이지로 이동해야한다
			

           /* $('#writeBtn').on("click", function () {
         	 self.location="${initParam.rootPath}/user/community/register"; 
         	  
           }); */
});//function
function loginCheck() {

		var loginState = '${user_loginState}';
		var login_id = '${user_login_id}';
		console.log("로그인 아이디 >>> "+login_id);
		
		//alert("로그인 상태>>>" + loginState);
		if (loginState != "login") {
			alert('로그인하신 후에 이용 가능합니다.');
		} else {
			//alert('현재 로그인상태입니다')
			location.href = '${initParam.rootPath}/user/community/register?community_no=${param.community_no}';
			//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
		}
	}
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
						<div class='column-title'>커뮤니티 게시판</div>
					</div>
					<div class='company-contest-table'>
						<div class='wrapper'>
							<table cellspacing='0'>
								<tr>
									<th style="width: 10%">글번호</th>
									<th style="width: 35%">제목</th>
									<th style="width: 15%">작성자</th>									
									<th style="width: 20%">작성일</th>									
									<th style="width: 10%">조회수</th>									
									<th style="width: 10%">댓글</th>									
								</tr>
								  <c:forEach items="${list}" var="communityVo" varStatus="stat">
				                     <tr>
				                        <td>${communityVo.community_no}</td>
				                        <td><a href='/tc/user/community/read${pageMaker.makeSearch(pageMaker.cri.page)}&community_no=${communityVo.community_no}'>
				                            ${communityVo.community_title}</a></td>
				                        <td>${communityVo.community_writer}</td>
				                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				                                  value="${communityVo.community_wdate}"/></td>
				                        <td>${communityVo.community_viewCount}</td> 
				                        <td>${communityVo.community_replyCount}</td>             
				                     </tr>
				                  </c:forEach>				
										
											
							</table>
						</div>
					</div>
				</div><!-- com-contest-head -->
				<div>
					<div class="com-contest-paging">
						<div class="cont-qna-page">
						      <ul class="pagination">
						      <c:if test="${pageMaker.prev}">
						         <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
						      </c:if>
						      <c:forEach begin="${pageMaker.startPage }"
						            end="${pageMaker.endPage }" var="idx">
						      <li 
						         <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						         <a href="list${pageMaker.makeSearch(idx)}&company_id=${param.company_id }">${idx}</a>
						      </li>
						      </c:forEach>
						
						      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						         <li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&company_id=${param.company_id }">&raquo;</a></li>
						      </c:if>         
						      </ul>
					    </div>
					    <div class='cont-qna-search'>
					               <select name="searchType">
					                  <option value="n"
					                     <c:out value="${cri.searchType == null?'selected':''}"/>>
                    					 검색조건</option>
					                  <option value="t"
					                     <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                     					제목</option>                  
					                  <option value="w"
					                     <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                    					 작성자</option>
					               </select> <input type="text" name='keyword' id="keywordInput"
					                  value='${cri.keyword }'>
					               <button id='searchBtn'>검색</button>
					               <button id='registBtn'>글쓰기</button>
					
					   </div>
					</div><!-- com-contest-paging -->
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
	$('#registBtn').on("click", function(){
		self.location="${initParam.rootPath }/user/community/register"
	});
});
</script>

</body>
</html>
