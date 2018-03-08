/* 
 * 
 * 18/02/25 메인페이지 js파일 tc_user_main.jsp
 * 
 */

//스크롤하면 헤더 없어짐
$(window).scroll(function () {
	var height = $(document).scrollTop();
	if(height>50){
		$('.nav-header').slideUp(200);
		$('.nav').css('background-color','rgba(255,255,255,0.7)');
		
	}else{
		$('.nav-header').slideDown(200);
		$('.nav').css('background-color','#fff');
		
	}
});



$(function(){

	
});