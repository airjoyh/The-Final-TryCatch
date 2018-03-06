<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html lang="kr">
<head>
<title>TryCatch_companyInfo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap3 for trycatch -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src=""></script>
<!-- Custom jQuery -->

<!-- Custom styles -->

<!-- Custom styles -->
<%-- <link href="${initParam.rootPath }/css/font.css" rel="stylesheet"> --%>
<link href="${initParam.rootPath }/resources/css/trycatch.css" rel="stylesheet">


</head>
<body style="background-color: #f4f4f4;">
	<section>
		<!--***********************************************************
		*                                                             *
		*                            nav                              *
		*                                                             *
		************************************************************-->
		<%@include file="../../userNavBar.jsp" %>
	</section>
		<!--***********************************************************
		*                                                             *
		*                           body                              *
		*                                                             *
		************************************************************-->
	<div class="container"
		style="background-color: #ffffff; margin-top: 2em">
		<div class="row"
			style="padding-top: 7em; padding-bottom: 2em; padding-left: 10em; padding-right: 10em;">
			
			<div class="col-sm-4">
				<h3>총평점</h3>
				<ul class="list-group" style="padding-top: 0.6em;padding-right: 1em;">
					<c:forEach items="${total }" var="total">
						<li class="list-group-item">
						<label for="a_${total.rank}">
							<font style="color: teal;font-size: large;">${total.rank}위</font>
							<a href="${initParam.rootPath }/user/review/list?company_id=${total.company_id }" style="text-decoration: none; color: black;">${total.company_name }</a>
						</label>
						<label style="float: right;">
							<span class="badge a${total.rank}" style="background-color: teal;"><b>${total.avg_all }</b>/5점</span>
						</label>
						<div class="progress" id="a_${total.rank}">
							<div class="progress-bar progress-bar-warning"
								role="progressbar" aria-valuenow="90" aria-valuemin="0"
								aria-valuemax="100" style="width: ${total.avg_all*20 }%">
							</div>
						</div>
						</li>
					</c:forEach>
					<li class="list-group-item"><a href="${initParam.rootPath }/user/com_info/list/totalRank"><button class="btn btn-default btn-block btn-lg">더보기</button></a></li>
				</ul>
			</div>
			
			<div class="col-sm-4">
				<h3>승진 기회 및 가능성</h3>
				<ul class="list-group" style="padding-top: 0.6em;padding-right: 1em;">
					<c:forEach items="${possibility }" var="possibility">
						<li class="list-group-item">
						<label for="b_${possibility.rank}">
							<font style="color: teal;font-size: large;">${possibility.rank}위</font>
							<a href="${initParam.rootPath }/user/review/list?company_id=${possibility.company_id }" style="text-decoration: none; color: black;">${possibility.company_name}</a>
						</label>
						<label style="float: right;">
							<span class="badge b${possibility.rank}" style="background-color: teal;"><b>${possibility.avg_possibility }</b>/5점</span>
						</label>
						<div class="progress" id="b_${possibility.rank}">
							<div class="progress-bar progress-bar-info"
								role="progressbar" aria-valuenow="90" aria-valuemin="0"
								aria-valuemax="100" style="width: ${possibility.avg_possibility*20}%">
							</div>
						</div>
						</li>
					</c:forEach>
					<li class="list-group-item"><a href="${initParam.rootPath }/user/com_info/list/possibilityRank"><button class="btn btn-default btn-block btn-lg">더보기</button></a></li>
				</ul>
			</div>
			
			<div class="col-sm-4">
				<h3>복지 및 급여</h3>
				<ul class="list-group" style="padding-top: 0.6em;padding-right: 1em;">
					<c:forEach items="${welSal }" var="welSal">
						<li class="list-group-item">
						<label for="c_${welSal.rank }">
							<font style="color: teal;font-size: large;">${welSal.rank}위</font>
							<a href="${initParam.rootPath }/user/review/list?company_id=${welSal.company_id }" style="text-decoration: none; color: black;">${welSal.company_name }</a>
						</label>
						<label style="float: right;">
							<span class="badge c${welSal.rank}" style="background-color: teal;"><b>${welSal.avg_welSal }</b>/5점</span>
						</label>
						<div class="progress" id="c_${welSal.rank}">
							<div class="progress-bar progress-bar-info"
								role="progressbar" aria-valuenow="90" aria-valuemin="0"
								aria-valuemax="100" style="width: ${welSal.avg_welSal*20 }%">
							</div>
						</div>
						</li>
					</c:forEach>
					<li class="list-group-item"><a href="${initParam.rootPath }/user/com_info/list/welSalRank"><button class="btn btn-default btn-block btn-lg">더보기</button></a></li>
				</ul>
			</div>
		</div>
		
		<div class="row"
			style="padding-top: 2em; padding-bottom: 2em; padding-left: 10em; padding-right: 10em;">
			
			<div class="col-sm-4">
				<h3>업무와 삶의 균형</h3>
				<ul class="list-group" style="padding-top: 0.6em;padding-right: 1em;">
					<c:forEach items="${balance }" var="balance">
						<li class="list-group-item">
						<label for="d_${balance.rank}">
							<font style="color: teal;font-size: large;">${balance.rank}위</font>
							<a href="${initParam.rootPath }/user/review/list?company_id=${balance.company_id }" style="text-decoration: none; color: black;">${balance.company_name}</a>
						</label>
						<label style="float: right;">
							<span class="badge d${balance.rank}" style="background-color: teal;"><b>${balance.avg_balance}</b>/5점</span>
						</label>
						<div class="progress" id="d_${balance.rank}">
							<div class="progress-bar progress-bar-info"
								role="progressbar" aria-valuenow="90" aria-valuemin="0"
								aria-valuemax="100" style="width: ${balance.avg_balance*20}%">
							</div>
						</div>
						</li>
					</c:forEach>
					<li class="list-group-item"><a href="${initParam.rootPath }/user/com_info/list/balanceRank"><button class="btn btn-default btn-block btn-lg">더보기</button></a></li>
				</ul>
			</div>
			
			<div class="col-sm-4">
				<h3>사내문화</h3>
				<ul class="list-group" style="padding-top: 0.6em;padding-right: 1em;">
					<c:forEach items="${culture }" var="culture">
						<li class="list-group-item">
						<label for="e_${culture.rank }">
							<font style="color: teal;font-size: large;">${culture.rank }위</font>
							<a href="${initParam.rootPath }/user/review/list?company_id=${culture.company_id }" style="text-decoration: none; color: black;">${culture.company_name }</a>
						</label>
						<label style="float: right;">
							<span class="badge e${culture.rank }" style="background-color: teal;"><b>${culture.avg_culture }</b>/5점</span>
						</label>
						<div class="progress" id="e_${culture.rank }">
							<div class="progress-bar progress-bar-info"
								role="progressbar" aria-valuenow="90" aria-valuemin="0"
								aria-valuemax="100" style="width: ${culture.avg_culture*20 }%">
							</div>
						</div>
						</li>
					</c:forEach>
					<li class="list-group-item"><a href="${initParam.rootPath }/user/com_info/list/cultureRank"><button class="btn btn-default btn-block btn-lg">더보기</button></a></li>
				</ul>
			</div>
			
			<div class="col-sm-4">
				<h3>경영진</h3>
				<ul class="list-group" style="padding-top: 0.6em;padding-right: 1em;">
					<c:forEach items="${manager }" var="manager">
						<li class="list-group-item">
						<label for="f_${manager.rank }">
							<font style="color: teal;font-size: large;">${manager.rank }위</font>
							<a href="${initParam.rootPath }/user/review/list?company_id=${manager.company_id }" style="text-decoration: none; color: black;">${manager.company_name }</a>
						</label>
						<label style="float: right;">
							<span class="badge f${manager.rank }" style="background-color: teal;"><b>${manager.avg_manager }</b>/5점</span>
						</label>
						<div class="progress" id="f_${manager.rank }">
							<div class="progress-bar progress-bar-info"
								role="progressbar" aria-valuenow="90" aria-valuemin="0"
								aria-valuemax="100" style="width: ${manager.avg_manager*20 }%">
							</div>
						</div>
						</li>
					</c:forEach>
					<li class="list-group-item"><a href="${initParam.rootPath }/user/com_info/list/managerRank"><button class="btn btn-default btn-block btn-lg">더보기</button></a></li>
				</ul>
			</div>
		</div>
		
		
	</div><!-- container -->

</body>
</html>