<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>TryCatch</title>  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap3 for trycatch -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom jQuery -->
<script type="text/javascript"
	src="${initParam.rootPath }/js/trycatch.js"></script>
<!-- Custom styles -->
<link href="${initParam.rootPath }/css/font.css" rel="stylesheet">
<link href="${initParam.rootPath }/css/trycatch.css" rel="stylesheet">

</head>
<body>
	<div class="container-fluid"
		style="background-color: #2196F3; color: #fff; height: 200px; padding-left: 14em; padding-top: 2em;">
		<h1>조영환의 포트폴리오</h1>
		<h3>여그다가는 뭐쓰지 참....</h3>
		<p>원하는 기업같은거 쓰자 여기는 ㅋㅋㅋ</p>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<nav class="col-sm-3">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#intro">자기소개</a></li>
					<li><a href="#skills">기술</a></li>
					<li><a href="#hobby">관심 및 취미</a></li>
					<li><a href="#awards">수상경력</a></li>
					<li><a href="#portfolio">포트폴리오</a></li>
				</ul>
			</nav>
			<div class="col-sm-9">

				<div id="exp" style="padding-bottom: 15em;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1>경험</h1>
						</div>
						<div class="panel-body">
							<hr>
							<h5>나는 송다정입니다. 열심히해서 성공할거에요.</h5>
							<hr>
						</div>
						<div class="panel-footer">
							<button class="btn btn-info btn-sm" data-toggle="modal"
								data-target="#expModal">수정</button>
						</div>
					</div>
				</div>

				<div id="skill" style="padding-bottom: 15em;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1>스킬</h1>
						</div>
						<div class="panel-body">
							<hr>
							<ul>
								<li class="glyphicon glyphicon-pencil">JavaScript</li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pencil">Java</li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pencil">Spring</li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pencil">BootStrap</li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pencil">jQuery</li>
								<br>
								<br>
							</ul>
							<hr>
						</div>
						<div class="panel-footer">
							<button class="btn btn-info btn-sm" data-toggle="modal"
								data-target="#skillModal">수정</button>
						</div>
					</div>
				</div>

				<div id="interest" style="padding-bottom: 15em;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1>관심 및 취미</h1>
						</div>
						<div class="panel-body">
							<hr>
							<h5>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</h5>
							<hr>
						</div>
							<div class="panel-footer">
								<button class="btn btn-info btn-sm" data-toggle="modal"
								data-target="#interestModal">수정</button>
							</div>
					</div>
				</div>

				<div id="award" style="padding-bottom: 15em;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1>수상경력</h1>
						</div>
						<div class="panel-body">
							<hr>
							<ul>
								<li class="glyphicon glyphicon-king">아메리칸 코딩어워드</li>
								<br>
								<br>
								<li class="glyphicon glyphicon-king">코바코 공익광고제</li>
								<br>
								<br>
								<li class="glyphicon glyphicon-king">아스트라이드 어워드-골드위너</li>
								<br>
								<br>
							</ul>
							<hr>
						</div>
							<div class="panel-footer">
								<button class="btn btn-info btn-sm" data-toggle="modal"
									data-target="#awardModal">수정</button>
							</div>
					</div>
				</div>

				<div id="license" style="padding-bottom: 15em;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1>자격증</h1>
						</div>
						<div class="panel-body">
							<hr>
							<ul>
								<li class="glyphicon glyphicon-king">자바</li>
								<br>
								<br>
								<li class="glyphicon glyphicon-king">기사</li>
								<br>
								<br>
							</ul>
							<hr>
						</div>
							<div class="panel-footer">
								<button class="btn btn-info btn-sm" data-toggle="modal"
									data-target="#licenseModal">수정</button>
							</div>
					</div>
				</div>

				<div id="link" style="padding-bottom: 15em;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1>포트폴리오 링크</h1>
						</div>
						<div class="panel-body">
							<hr>
							<ul>
								<li class="glyphicon glyphicon-pushpin"><a
									href="http://github.com">포트폴리오1</a></li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pushpin"><a
									href="http://github.com">포트폴리오2</a></li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pushpin"><a
									href="http://github.com">포트폴리오3</a></li>
								<br>
								<br>

							</ul>

							<hr>
						</div>
						<div class="panel-footer">
							<button class="btn btn-info btn-sm" data-toggle="modal"
									data-target="#linkModal">수정</button>
						</div>
					</div>
				</div>

				<div id="img" style="padding-bottom: 15em;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1>포트폴리오 이미지</h1>
						</div>
						<div class="panel-body">
							<hr>
							<ul>
								<li class="glyphicon glyphicon-pushpin"><a
									href="http://github.com">포트폴리오1</a></li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pushpin"><a
									href="http://github.com">포트폴리오2</a></li>
								<br>
								<br>
								<li class="glyphicon glyphicon-pushpin"><a
									href="http://github.com">포트폴리오3</a></li>
								<br>
								<br>

							</ul>

							<hr>
						</div>
						<div class="panel-footer">
							<button class="btn btn-info btn-sm" data-toggle="modal"
									data-target="#imgModal">수정</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!--***********************************************************
	*                                                             *
	*                          modal port_exp                     *
	*                                                             *
	************************************************************-->
	<div class="modal fade" id="expModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted">수정 정보 입력</h4>
				</div>

				<div class="modal-body">
					<div class="row" style="padding-left: 1.2em; padding-right: 1.2em;">
						<form>
							<div class="form-group">
								<label for="comment">Comment:</label>
								<textarea class="form-control" rows="10" id="comment"></textarea>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-block"
						href="">완료</a>
				</div>
			</div>

		</div>
	</div>
	<!--***********************************************************
	*                                                             *
	*                          modal port_skill                   *
	*                                                             *
	************************************************************-->
	<div class="modal fade" id="skillModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted">추가할 스킬을 적어주세요</h4>
				</div>

				<div class="modal-body">
					<div id="skillModalBody" class="row" style="padding-left: 1.2em; padding-right: 1.2em;">
						<form>
							<div class="form-group">
								<label for="skillName">추가할 기술명을 적고 +를 눌러주세요</label>
								<input class="form-control" rows="10" id="skillName">
							</div>
							<div class="center-block">
								<button type="button" class="btn btn-info" style="color: #ffffff" id="skillAdd">
									<font style="font-size: large;">+</font>
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-block"
						href="">완료</a>
				</div>
			</div>

		</div>
	</div>
    <!--***********************************************************
	*                                                             *
	*                          modal port_interest                *
	*                                                             *
	************************************************************-->
	<div class="modal fade" id="interestModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted">관심 및 취미</h4>
				</div>

				<div class="modal-body">
					<div class="row" style="padding-left: 1.2em; padding-right: 1.2em;">
						<form>
							<div class="form-group">
								<label for="comment">Comment:</label>
								<textarea class="form-control" rows="10" id="comment"></textarea>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-block"
						href="">완료</a>
				</div>
			</div>

		</div>
	</div>
	<!--***********************************************************
	*                                                             *
	*                          modal port_awardModal              *
	*                                                             *
	************************************************************-->
	<div class="modal fade" id="awardModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted">추가할 수상명을 적어주세요</h4>
				</div>

				<div class="modal-body">
					<div id="awardModalBody" class="row" style="padding-left: 1.2em; padding-right: 1.2em;">
						<form>
							<div class="form-group">
								<label for="awardName">추가할 수상명을 적고 +를 눌러주세요</label>
								<input class="form-control" id="awardName">
							</div>
							<div class="center-block">
								<button type="button" class="btn btn-info" style="color: #ffffff" id="awardAdd">
									<font style="font-size: large;">+</font>
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-block"
						href="">완료</a>
				</div>
			</div>

		</div>
	</div>
	<!--***********************************************************
	*                                                             *
	*                          modal port_licenseModal            *
	*                                                             *
	************************************************************-->
	<div class="modal fade" id="licenseModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted">추가할 자격증을 적어주세요</h4>
				</div>

				<div class="modal-body">
					<div id="awardModalBody" class="row" style="padding-left: 1.2em; padding-right: 1.2em;">
						<form>
							<div class="form-group">
								<label for="awardName">추가할 자격증명을 적고 +를 눌러주세요</label>
								<input class="form-control" id="awardName">
							</div>
							<div class="center-block">
								<button type="button" class="btn btn-info" style="color: #ffffff" id="awardAdd">
									<font style="font-size: large;">+</font>
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-block"
						href="">완료</a>
				</div>
			</div>

		</div>
	</div>
	<!--***********************************************************
	*                                                             *
	*                       modal port_linkModal                  *
	*                                                             *
	************************************************************-->
	<div class="modal fade" id="linkModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted">추가할 링크를 적어주세요</h4>
				</div>

				<div class="modal-body">
					<div id="pfModalBody" class="row" style="padding-left: 1.2em; padding-right: 1.2em;">
						<form>
							<div class="form-group">
								<label for="pfName">추가할 포트폴리오명과 url을 적고 +를 눌러주세요</label>
								<input class="form-control" id="pfName" placeholder="포트폴리오 이름을 입력하세요">
								<input class="form-control" id="pfURL" placeholder="URL을 입력하세요">
							</div>
							<div class="center-block">
								<button type="button" class="btn btn-info" style="color: #ffffff" id="pfAdd">
									<font style="font-size: large;">+</font>
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-block"
						href="">완료</a>
				</div>
			</div>

		</div>
	</div>
	<!--***********************************************************
	*                                                             *
	*                       modal port_imgModal                   *
	*                                                             *
	************************************************************-->
	<div class="modal fade" id="imgModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-muted">추가할 이미지를 적어주세요</h4>
				</div>

				<div class="modal-body">
					<div id="pfModalBody" class="row" style="padding-left: 1.2em; padding-right: 1.2em;">
						<form>
							<div class="form-group">
								<label for="pfName">추가할 포트폴리오명과 url을 적고 +를 눌러주세요</label>
								<input class="form-control" id="pfName" placeholder="포트폴리오 이름을 입력하세요">
								<input class="form-control" id="pfURL" placeholder="URL을 입력하세요">
							</div>
							<div class="center-block">
								<button type="button" class="btn btn-info" style="color: #ffffff" id="pfAdd">
									<font style="font-size: large;">+</font>
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-block"
						href="">완료</a>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
	$('.nav').affix({
		offset : {
			top : 205
		}
	});
	
	 $('#expModal').click(function () {
		
		 
	 	$.ajax({
			type:'post',
			url:'${initParam.rootPath}/user/portfolio/'+user_id,
			data:{":" },
			success:function(result){
				getPage()
			
				
			} 
			
		});
	}); 
	
	$('#skillModal').click(function () {
		
	});
	
	$('#interestModal').click(function () {
		
	});
	
	$('#awardModal').click(function () {
		
	});
	
	$('#licenseModal').click(function () {
		
	});
	
	$('#linkModal').click(function () {
		
	});
	
	$('#imgModal').click(function () {
		
	});

/* 	$('#skillAdd').click(function() {
		$('#skillModalBody').prepend('<button name="skills" class="btn btn-info" onclick="script:$(this).hide(100)" style="margin-right:5px;margin-bottom:5px;">'
												+ '<li class="glyphicon glyphicon-pencil">'
												+ $('#skillName').val()
												+ '</li></button>');
		$('#skillName').val('');
	});
	
	$('#awardAdd').click(function() {
		$('#awardModalBody').prepend('<button name="awards" class="btn btn-info" onclick="script:$(this).hide(100)" style="margin-right:5px;margin-bottom:5px;">'
												+ '<li class="glyphicon glyphicon-king">'
												+ $('#awardName').val()
												+ '</li></button>');
		$('#awardName').val(''); 
	});
	
	$('#pfAdd').click(function() {
		$('#pfModalBody').prepend('<button name="pfs" class="btn btn-info" onclick="script:$(this).hide(100)" style="margin-right:5px;margin-bottom:5px;">'
												+ '<li class="glyphicon glyphicon-king">'
												+ $('#pfName').val()+':'+$('#pfURL').val()
												+ '</li></button>');
		$('#pfName').val('');
		$('#pfURL').val('');
	}); */
	
	</script>

</body>
</html>