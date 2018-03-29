<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>소개 페이지</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/introduce.css" rel="stylesheet" type="text/css">


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
	<!-- nav-area -->
  <%@ include file="../user-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>
		
			<div class='section_introduce'>

					<div class='title-wrapper'>
						<div class='column-title'>TryCath Introduce</div>
					</div>
					
					<div class="wrapper">
					
					</div>
					

			</div><!-- section_introduce -->
				
		</div>

		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<div id="rightDiv" class='column-right'>
				<div id="login_beforeDiv">
					<%@ include file="../user/login_before_new.jsp"%>
				</div>
				<div id="login_afterDiv" style="display: none">
					<%@ include file="login_after_new.jsp"%>
				</div>
			</div>
			<!-- column-right -->
		</div>
		<!-- modal 코드 --> 
       <%@ include file="user_modals_new.jsp" %>
				
		</div><!-- container -->
			
	
	<!-- frame -->
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
		   	
			console.log('로그인 상태 >>> '+loginState)
			//alert("로그인 상태>>>" + loginState);
			if (loginState != "login") {
				//loginState라는 변수는 userMain.js에 있고 user-nav_new에 js가 들어있음 그걸 include했기 때문에 사용가능
				alert('로그인하신 후에 이용 가능합니다.');
				login_id.focus();
			} else {
				//alert('현재 로그인상태입니다')
				location.href = '${initParam.rootPath}/user/community/register';
				//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
			}
	  
	   });// 여기에 글쓰기 버튼을 눌렀을때 로그인을 한 상태가 아니라면 
	      // 로그인 요청페이지가 뜨고 확인을 누르면 로그인 페이지로 이동해야한다
	

	});//function

</script>
</body>
</html>