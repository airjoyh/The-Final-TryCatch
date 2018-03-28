<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--ajax 통신을 위한 json설정 --%>

<!-- C태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%-- <link href="${initParam.rootPath }/css/font.css" rel="stylesheet"> --%>
<link href="${initParam.rootPath }/resources/css/review_post.css" rel="stylesheet">  
<script type="text/javascript">
$(function(){
	
	$('#goList').on("click", function() {
  		console.log('목록보기 버튼 클릭');
  		self.location="${initParam.rootPath }/user/contest/list?page=${cri.page }"
  					+"&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }"
  					+"&keyword=${cri.keyword }";
  	});//goList클릭	
  	
  	$('#startContestBtn').on("click", function(){
  		console.log('콘테스트 시작 버튼 클릭');
  		var loginState = '${user_loginState}';
  		var contest_id = $('#contest_id').val();
  		
  		if(loginState != 'login'){
  			alert('콘테스트는 로그인을 하신 이후에 이용 가능합니다.');
  		}else{
  			self.location = '${initParam.rootPath}/user/contest/quiz/solve?contest_id='+contest_id+'&quiz_no=1';
  		}
  	});
  	
  	$('#goRankListBtn').on("click", function(){
  		console.log('점수보러가기 버튼 클릭');
  		var contest_id = $('#contest_id').val();
  		self.location = '${initParam.rootPath}/user/contest/rankList?contest_id='+contest_id;
  	});
		
});//function()	  
</script>




  <title>글 상세정보</title>
  </head>
  <section class="content">
  <body style="background-color: #f4f4f4;">
	<!--***********************************************************
	*                                                             *
	*                            nav                              *
	*                                                             *
	************************************************************-->
	<%@include file="../../userNavBar.jsp" %>
	
	<!--***********************************************************
	*                                                             *
	*                            제목                                                                    *
	*                                                             *
	************************************************************-->
  
	<div class="container" style=" background-image: url('${initParam.rootPath}/resources//image/monitor/pencil.jpg');" >
		<div class="row" style="padding-top: 8em; padding-bottom: 1em; padding-right: 4em;padding-left: 4em">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1 style="font-weight: 600; ">콘테스트 상세정보</h1>
				<hr>
			</div>
		</div>
	</div>
	
	<!--***********************************************************
	*                                                             *
	*                           body - 수정                                                      *
	*                                                             *
	************************************************************-->	
	<div class="container"
		 style="background-color: #ffffff; margin-top: 1em;">
	  <div class="well well" style="margin-top: 2em; margin-left: 2em; margin-right: 2em;">
	  	 <div id="wrap">
	  	 	<br><br>
	  	 	<form id="readForm" name="readForm" method="POST">
	  	 		<input type="hidden" id="contest_id" name="contest_id" value="${contest.contest_id }">
	  	 		<input type='hidden' name='page' value="${cri.page}"> 
	  	 		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">
			</form>
	  	 		<div id="board" align="center">

	  	 			<table id="tdetail" border="3" bordercolor="lightgray" style="width:100% height: 90%">
	  	 				<tr style="height: 50px">
	  	 					<td style="text-align: center; font-weight: bold;">글번호</td>
	  	 					<!-- 컨트롤러에서 받아온 ArrayList detailAll에서 정보를 뽑는다. -->
	  	 					<td style="text-align: center;">${contest.contest_id }</td>
	  	 				</tr>
	  	 				<tr style="height: 50px">
	  	 					<td style="text-align: center; font-weight: bold;">제목</td>
	  	 					<td id="title" style="text-align: center;">${contest.contest_title }</td>
	  	 				</tr>
				        <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">개최 기업명</td>
				            <td style="text-align: center;" >${contest.company_name }</td>
				        </tr>
				        <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">콘테스트 시작날짜</td>
				            <td style="text-align: center;">${contest.contest_startDate}</td>
				        </tr>
				         <tr style="height: 50px">
				            <td style="text-align: center; font-weight: bold;">콘테스트 끝날짜</td>
				            <td style="text-align: center;">${contest.contest_endDate}</td>
				        </tr>
				        <tr style="height: 50px">
				        	<td style="text-align: center; font-weight: bold;">콘테스트 분야</td>
            				<td style="text-align: center;">${contest.contest_field }</td>		        	
				        </tr>	  	 				
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">채용할 인원 수</td>
            				<td style="text-align: center;">${contest.contest_hireNumber }</td>		        	
				        </tr>	  	 				
				        <tr style="height: 300">
				        	<td style="text-align: center; font-weight: bold;">콘테스트 내용</td>
            				<td style="text-align: center;">${contest.contest_contents }</td>		        	
				        </tr>
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당 소속</td>
            				<td style="text-align: center;">${contest.team_name }</td>		        	
				        </tr>	
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당자</td>
            				<td style="text-align: center;">${contest.manager_name }</td>		        	
				        </tr>	
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당자 이메일</td>
            				<td style="text-align: center;">${contest.manager_email }</td>		        	
				        </tr>	
				        <tr style="height: 150px">
				        	<td style="text-align: center; font-weight: bold;">담당자 이메일</td>
            				<td style="text-align: center;">${contest.manager_tel }</td>		        	
				        </tr>
				        <tr style="height: 50px">
				        	<td></td>
				        	<td align="center">			
							<button type="button" id="goList">목록보기</button>

							</td>
				        </tr>
				        	  	 				
	  	 			</table>
	  	 			<div>
	  	 				<button type="button" id="startContestBtn">콘테스트 시작</button>
	  	 				<button type="button" id="goRankListBtn">점수 보러가기</button>
	  	 			</div>
	  	 		</div>
	  	 		
	  	 </div>
	  </div><!-- well -->
	</div><!-- container -->
	 
	</section>
	
	<!--***********************************************************
	*                                                             *
	*                           footer                            *
	*                                                             *
	************************************************************-->	
</body>
</html>
