<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- C태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/portfolio.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">


<!-- JS -->	
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>	
<script type="text/javascript">
	var loginState = '${user_loginState}'; //로그인하면 'login'
	var rootPath = '${initParam.rootPath}'; //  /tc
</script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/userMain.js"></script>	
<script type="text/javascript">
$(function(){
	
	$('.brand').on("click", function(){
		self.location = "${initParam.rootPath }/user/main";
	});
	
	$('#intro').on("click", function(){
		self.location = "${initParam.rootPath }/user/intro";
	});
		
	$('#company').on("click", function(){
		self.location = "${initParam.rootPath }/user/com_info/rank";
	});
	
	$('#contest').on("click", function(){
		self.location = "${initParam.rootPath }/user/contest/list";
	});
	
	$('#community').on("click", function(){
		self.location = "${initParam.rootPath }/user/community/list";
	});
	
	$('#faq').on("click", function(){
		self.location = "${initParam.rootPath }/user/faq";
	});
	
	$('#user-com').on("click", function(){
		self.location = "${initParam.rootPath }/company/main";
	});
	
});//function()
</script>


	<div class='nav'>
		<div class='navbar'>
			<div class='nav-item'>
				<div class='brand'>
					<img src="${initParam.rootPath }/resources/image/ing/brand.svg">
				</div>
				<div class=search></div>
				<ul>
					<li id='intro'>소개</li>
					<li id='company'>기업</li>
					<li id='contest'>콘테스트</li>
					<li id='community'>커뮤니티</li>
					<li id='faq' style="">FAQ</li>
					<li id='user-com' style='float: right; text-align: right;'>기업회원</li>
				</ul>
			</div>
			<div class='nav-list'></div>
		</div>
	</div>