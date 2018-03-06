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
	$(function(){
		var action='${action }';
		var msg = '';
		var title = document.getElementById('title');
		//alert(action);
		if(action=='totalRank'){
			msg= '총 평점';
			//alert(msg);
		}else if(action=='possibilityRank'){
			msg='승진 기회 및 가능성';
		}else if(action=='welSalRank'){
			msg='복지 및 급여';
		}else if(action=='balanceRank'){
			msg='업무와 삶의 균형';
		}else if(action=='cultureRank'){
			msg='사내문화';
		}else if(action=='managerRank'){
			msg='경영진';
		}
		title.innerHTML='기업 '+msg+' 순위 게시판';
		
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
	});
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
		<%@include file="../../userNavBar.jsp" %>
	
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
							<th style="width: 10%;">순위</th>
							<th style="width: 25%;">기업명</th>
							<th style="width: 20%;">기업규모</th>
							<th style="width: 20%;">매출액</th>
							<th style="width: 20%;">산업군</th>
							<th style="width: 20%;">후기</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list }" var="avgScore" varStatus="stat">
					<tr>
						<td style="width: 10%;">${avgScore.rank }</td>
						<td style="width: 25%;"><a href="${initParam.rootPath }/user/review/list?company_id=${avgScore.company_id }">${avgScore.company_name }</a></td>
						<td style="width: 20%;">${avgScore.company_size }</td>
						<td style="width: 20%;">${avgScore.company_turnover }</td>
						<td style="width: 20%;">${avgScore.company_line }</td>
						<td><span class="badge">${review_cnt.get(stat.index) }</span></td>
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
			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
		<li 
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="list${pageMaker.makeSearch(idx)}&company_id=${param.company_id }">${idx}</a>
		</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&company_id=${param.company_id }">&raquo;</a></li>
		</c:if>			
		</ul>
		</div>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
			검색조건</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
			기업명</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
			기업 규모</option>						
		</select> 
			<input type="text" name='keyword' id="keywordInput"
				value='${cri.keyword }'>
			<button id='searchBtn'>검색</button>
		</div>


	
	</section>
	<%-- <%@include file="/view/main/footer.jsp" %> --%>
</body>
</html>