<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>콘테스트 리스트</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/userMain.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/checkbox.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/modal.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/tabs.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/contestTable.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/com_contest.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/portfolio.css"
	rel="stylesheet" type="text/css">
<!-- ICON -->

<script type="text/javascript"
	src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>

<!-- 임시 js -->
<script type="text/javascript">
	
</script>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<link href="${initParam.rootPath }/resources/css/userMain.css"
	rel="stylesheet" type="text/css">
<body>
	<!-- com-nav area -->
	<%@include file="../../ing/com/com-nav.jsp"%>
	<div class='container'>
		<!-- left section!!************************************************************** -->
		<div class='column-left'>
			<div class='user-search'>

				<div class='title-wrapper'>
					<div class='column-title'>인재검색</div>
				</div>
				<div class='wrapper'>
					<!-- 검색조건 -->
					<select>
						<option>기술</option>
						<option>자격증</option>
						<option>기술+자격증</option>
					</select> <input type="search" placeholder="검색어를 입력하세요.">

					<!-- list -->

					<div class='company-contest-table'>
							<table cellspacing='0'>
								<tr>
									<th style="width: 500px;">유저아이디</th>
									<th style="width: 20%;">찜하기유무</th>
									<th style="width: 20%;">방문자수</th>
								</tr>
								<c:forEach begin="1" end="10">
								<tr>
									<td><a href="#">brakky@gmail.com</a></td>
									<td>N</td>
									<td>254</td>
								</tr>
								</c:forEach>
							</table>
					</div>
					<!-- pagenation area -->
				</div>


			</div>
		</div><!-- column-left -->


		<!-- right section!!************************************************************** -->
		<div class='column-right'>
			<!-- login include -->

		</div>
		<!-- column-right -->




	</div>
	<!-- container -->



</body>
</html>
