<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/com_modal.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/com_contest.css" rel="stylesheet" type="text/css">
<!-- ICON -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- JS,JQUERY -->
<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>    

<div class='com-nav'>
	<div class='com-navbar'>
		<div class='com-nav-item'>
			<div class='brand'>
				<img src="${initParam.rootPath }/resources/image/ing/brand.svg">
			</div>
			<div class=com-search></div>
			<ul>
				<li id='com-contest'>콘테스트 개최</li>
				<li id='find-user'>인재검색</li>
				<li id='com-faq' style="">FAQ</li>
				<li id='user-user' style='float: right; text-align: right;'>개인회원</li>
			</ul>
		</div>
		<div class='nav-list'></div>
	</div>
</div>