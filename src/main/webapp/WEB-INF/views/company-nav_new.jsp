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
<link href="${initParam.rootPath }/resources/css/com_modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/com_contest.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/pagination.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var loginState = '${company_loginState}'; //로그인하면 'login'
	var loginState = '${user_loginState}'; //로그인하면 'login'
	var rootPath = '${initParam.rootPath}'; //  /tc
</script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/companyMain.js"></script>    
<script type="text/javascript">
$(function(){
	
	$('.brand').on("click", function(){
		self.location = "${initParam.rootPath }/company/main";
	});
	
	$('#com-intro').on("click", function(){
		self.location = "${initParam.rootPath }/company/intro";
	});
		
	$('#com-contest').on("click", function(){
		console.log('콘테스트개최 버튼 클릭');
		if(loginState != 'login'){
			alert('해당 페이지는 로그인하신 이후에 이용가능합니다.');
			login_id.focus();
		}else{
			self.location='${initParam.rootPath }/company/contest/list';
		}
	});
	
	$('#find-user').on("click", function(){
		self.location = "${initParam.rootPath }/company/personSearch/list";
	});
	
	$('#com-faq').on("click", function(){
		self.location = "${initParam.rootPath }/company/faq";
	});
	
	$('#com-user').on("click", function(){
		self.location = "${initParam.rootPath }/user/main";
	});
	
});//function()
</script>
<div class='com-nav'>
	<div class='com-navbar'>
		<div class='com-nav-item'>
			<div class='brand'>
				<img src="${initParam.rootPath }/resources/image/ing/brand.svg">
			</div>
			<div class=com-search></div>
			<ul>
				<li id="com-intro">소개</li>
				<li id='com-contest'>콘테스트 개최</li>
				<li id='find-user'>인재검색</li>
				<li id='com-faq' style="">FAQ</li>
				<li id='com-user' style='float: right; text-align: right;'>개인회원</li>
			</ul>
		</div>
		<div class='nav-list'></div>
	</div>
</div>