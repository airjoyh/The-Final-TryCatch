<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${initParam.rootPath }/company/main">TryCatch</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="${initParam.rootPath }/company/personSearch/list">인재검색</a></li>
				<li><a href="${initParam.rootPath }/company/contest/list">콘테스트개최</a></li>
				<li><a href="${initParam.rootPath }/company/faq">FAQ</a></li>
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
				<li><a href="${initParam.rootPath }/user/main"> <span class="glyphicon glyphicon-briefcase"></span>
						개인회원
				</a></li>
			</ul>
		</div>
	</nav>