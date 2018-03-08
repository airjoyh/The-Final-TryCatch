<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<script type="text/javascript">
	$(function(){
		
		//콘테스트 들어갈때 로그인 체크
		 $('#contestA').on("click",function(){
			console.log('콘테스트개최 버튼 클릭');
			var loginState = '${company_loginState}';
			if(loginState != 'login'){
				alert('해당 페이지는 로그인하신 이후에 이용가능합니다.');
			}else{
				self.location='${initParam.rootPath }/company/contest/list';
			}
		});
		
	});
</script>    
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${initParam.rootPath }/company/main">TryCatch</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="${initParam.rootPath }/company/personSearch/list">인재검색</a></li>
				<li id="contestLi"><a id="contestA" >콘테스트개최</a></li>
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