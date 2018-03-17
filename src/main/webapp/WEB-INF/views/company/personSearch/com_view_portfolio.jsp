<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 리스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/portfolio.css" rel="stylesheet" type="text/css">

<!-- 임시 js -->

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
			<div class='section_pf'>
			
				<div class='pf-header'>
					<div class='pf-img'>
						<img src="${initParam.rootPath }/resources/image/ing/pf-bg.svg">
						<div class='pf-user-icon'>
							<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">
						</div>
					</div>
					<div class='pf-info'>
						<div class='pf-title'>
							${port.user_id }
						</div>
						<div class='com-zzim-btn'>찜하기</div> 
					</div>
					<div class='pf-navbar'>
						<ul>
							<li id='self-intro'>자기소개</li>
							<li id='skill'>기술</li>
							<li id='lisence'>자격증</li>
							<li id='award'>수상경력</li>
							<li id='portfolio'>포트폴리오</li>
						</ul>
					</div>
				</div><!-- pf-header -->

				<div class='pf-body'>
					<div class='pf-intro'>
						<div class='body-title'>Self-introduce</div>
						<pre id='introduce'>${port.port_exp}</pre>     
					</div>
					<div class='pf-skill'>
						<p class='body-title'>Skills</p>
						
						<div class='skill-box'>${port.port_skill}</div>
						
					</div>
					<div class='pf-lisence'>
						<p class='body-title'>Lisence</p>
							<div class='lisence-box'>${port.port_license}</div>
					</div>
					<div class='pf-award'>
						<p class='body-title'>Award</p>
							<div class='award-box'>${port.port_award}</div>
					</div>
					<div class='pf-pflink'>
						<p class='body-title'>Portfolio site</p>
							<a class='portfolio-link'>${port.port_link }</a>
					</div>
				</div>

			</div><!-- section_pf -->				
		</div>
		
			<!-- right section!!************************************************************** -->
     <div id="rigthDiv" class="column-right">
       <div id="login_beforeDiv">
          <%@ include file="../../company/com_login_before_new.jsp" %>
       </div>
       <div id="login_afterDiv" style="display: none">
          <%@ include file="../../company/com_login_after_new.jsp" %>
       </div> 
       		<!-- modal import -->
		<%@ include file="../../company/company_modal_new.jsp" %>  
     </div>
			
	</div><!-- container -->

<script type="text/javascript">
	$(function(){
        $('a').click(function (e) {  
            e.preventDefault();  
            var url = "www.naver.com";  
            location.href=url;  
        }); 

	});
/* 
	  var skills= '${port.port_skill}';
	  var array = skills.split('-');
	  console.log(array[1]);
	 */
</script>

</body>
</html>
