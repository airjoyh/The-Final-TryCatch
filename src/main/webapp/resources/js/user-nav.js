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