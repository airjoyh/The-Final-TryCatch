<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Custom jQuery -->
<script type="text/javascript">
/* 		
		$('#searchBtn').on("click", function(event) {
			//검색(Search) 버튼을 클릭하면
				self.location = "${action}" //'list'
								+ '${pageMaker.makeQuery(1)}'
								  //'list?page=1&perPageNum=10'
								+ "&searchType="
								//'list?page=1&perPageNum=10&searchType='
								+ $("select option:selected").val()
								//'list?page=1&perPageNum=10&searchType=t'
								+ "&keyword=" + $('#keywordInput').val()
								//'list?page=1&perPageNum=10&searchType=t&keyword=�ㅻ뒛'
								+"&company_id=${param.company_id}";
			});
	}); */

	
</script>

<!-- Custom styles -->
<%-- <link href="${initParam.rootPath }/css/font.css" rel="stylesheet"> --%>
<link href="${initParam.rootPath }/resources/css/com_companyInfo.css" rel="stylesheet">

<%--C태그를 사용하기 위한 라이브러리 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>

		<!--***********************************************************
		*                                                             *
		*                            nav                              *
		*                                                             *
		************************************************************-->
	<%-- 	<%@include file="../../userNavBar.jsp" %> --%>

	<section>
	<!--***********************************************************
	*                                                             *
	*                           기업게시판-상현                                                    *
	*                                                             *
	************************************************************-->
	<div class="container" style="background-color: #ffffff;">
		<div class="row"
			style="padding-top: 3em; padding-left: 4em; padding-right: 4em; padding-bottom: 2em;margin-bottom: 1em;">
			<h3 id="title"></h3>
			<hr>
		</div>
		<div class="row"
			style="padding-left: 3em; padding-right: 3em;">
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 10%;">번호</th>
							<th style="width: 25%;">찜한기업</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${comzzimList }" var="zzim" varStatus="stat">
					<tr>
					    <td style="width: 10%;">${zzim.ZZIM_NO }</td>
						<td style="width: 25%;"><a href="${initParam.rootPath }/company/personSearch/com_view_portfolio?port_id=${zzim.ZZIM_SELECTED }">${zzim.USER_ID }</a></td>
					                                                        	
					</tr>
					</c:forEach>
					</tbody>
				</table>
			<hr>
			</div>
		</div>
		
		<div align="center">
		<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="/com/port/zzimlist${pageMaker.makeSearch(pageMaker.startPage - 1) }&zzim_select=${param.zzim_select }">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
		<li 
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="/com/port/zzimlist${pageMaker.makeSearch(idx)}&zzim_select=${param.zzim_select }">${idx}</a>
		</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="/com/port/zzimlist${pageMaker.makeSearch(pageMaker.endPage +1) }&zzim_select=${param.zzim_select }">&raquo;</a></li>
		</c:if>			
		</ul>
		</div>
		</div>


	
	</section>
	<%-- <%@include file="/view/main/footer.jsp" %> --%>
</body>
</html>