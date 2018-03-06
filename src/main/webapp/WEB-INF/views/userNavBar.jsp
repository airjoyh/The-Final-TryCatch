<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--***********************************************************
	*                                                             *
	*                          navbar                             *
	*                                                             *
	************************************************************-->
<nav class="navbar navbar-inverse navbar-fixed-top"
	style="padding-right: 2em; padding-left: 2em;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${initParam.rootPath }/user/main">TryCatch</a>
		</div>
<div class="collapse navbar-collapse" id="myNavbar">
         <ul class="nav navbar-nav">
         	<li><a href="${initParam.rootPath }/user/intro" style="color: #ffffff">소개</a></li>
            <li><a href="${initParam.rootPath }/user/com_info/rank" style="color: #ffffff">기업</a></li>
            <li><a href="${initParam.rootPath }/user/contest/list" style="color: #ffffff">콘테스트</a></li>
            <!-- 수정 요망 company_id-->
            <li><a href="${initParam.rootPath }/user/community/list" style="color: #ffffff">커뮤니티</a></li>
            <li><a href="${initParam.rootPath }/user/faq" style="color: #ffffff">FAQ</a></li>
         </ul>
         <form class="navbar-form navbar-left" action="/action_page.php">
            <div class="input-group">
               <input type="text" class="form-control" placeholder="Search"
                  name="search">
               <div class="input-group-btn">
                  <button class="btn btn-default" type="submit">
                     <i class="glyphicon glyphicon-search"></i>
                  </button>
               </div>
            </div>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${initParam.rootPath }/company/main"> <span class="glyphicon glyphicon-briefcase"
						style="color: #ffffff">기업회원</span>
				</a></li>
			</ul>
		</div>
	</div>
</nav>