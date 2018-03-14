<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	$('#com-user').on("click", function(){
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
					<li id='com-user' style='float: right; text-align: right;'>기업회원</li>
				</ul>
			</div>
			<div class='nav-list'></div>
		</div>
	</div>