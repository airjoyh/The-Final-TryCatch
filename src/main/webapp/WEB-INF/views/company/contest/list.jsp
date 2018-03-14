<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>기업 콘테스트 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%--C태그를 사용하기 위한 라이브러리 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>기업 콘테스트 리스트</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.initial').hide();
		$('.tdTtl').mouseenter(function() {

		});
		
		

		$('#myTab a:last').tab('show');

		var loginState = '${company_loginState}';
		if(loginState != 'login'){
			alert('로그인되지 않은 상태입니다.');
			self.location = '${initParam.rootPath}/company/main';
		}
		
		
		
		$('#searchBtn').on("click", function(event) {
		//검색(Search) 버튼을 클릭하면
			self.location = "list" //'list'
							+ '${pageMaker.makeQuery(1)}'
							  //'list?page=1&perPageNum=10'
							+ "&searchType="
							//'list?page=1&perPageNum=10&searchType='
							+ $("select option:selected").val()
							//'list?page=1&perPageNum=10&searchType=t'
							+ "&keyword=" + $('#keywordInput').val()
							//'list?page=1&perPageNum=10&searchType=t&keyword=�ㅻ뒛'
							+"&company_id=${company_login_company_id}";
		});

		$('#newBtn').on("click", function(evt) {//글쓰기(New Board) 버튼을 클릭하면

			self.location = "register";//입력폼으로 이동

		});
		
		
		$('button[name=contestBtn]').each(function(i){
			console.log($(this).html());
			var status = $(this).html();
		
			if(status == 'Y'){
				$(this).html('<span id='+i+'>등록 완료<span>');
			}else if(status == 'N'){
				$(this).html('<span id='+i+'>등록</span>');
			}
			
			$(this).on("click", function(e){
				e.preventDefault();
				console.log(i+'번 버튼');
				var contest_id = $(this).val();
				console.log('contest_id >>> '+contest_id);
				
				var btn = $(this);
				
				if(confirm('이 콘테스트를 등록하시겠습니까?')){
					
					$.ajax({
						type:'post',
						url:'finalRegister',
						data:{"contest_id":contest_id},
						success:function(result){
							console.log(result);
							if(result=='finalRegister'){
								//btn.add('#'+i).html('등록 완료');
								btn.html('등록 완료');//이게 안먹음
								alert('해당 콘테스트가 등록되었습니다.');
								//$(this).attr("name", "contestComplete");
							}else if(result=='alreadyRegister'){
								alert('해당 콘테스트는 이미 등록되었습니다.');
							}
						}
					
					});//ajax
				}//if
					
			  });//button click
		});//button each
		
	});//document.ready
	/* 검색창 드롭다운 메뉴 */
	$('.taco').click(function(e) {
		var txt = $(e.target).text();
		$('.taco-input').val(txt);
	});

	function loginCheck() {

		var loginState = '${company_loginState }';
		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
		} else {
			location.href = '${initParam.rootPath }/company/contest/register';
			//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
		}
	}
</script>

<link href="${initParam.rootPath }/resources/css/trycatch.css" rel="stylesheet">
</head>
<body style="background-color: #f4f4f4;">
<%@include file="../../companyNavBar.jsp" %>
<div class="container" style="background-color: #ffffff;">
		<div class="row"
			style="padding-top: 3em; padding-left: 4em; padding-right: 4em; padding-bottom: 2em; margin-bottom: 1em;">
			<h3>후기게시판</h3>
			<hr>
		</div>
		<div class="row" style="padding-left: 3em; padding-right: 3em;">
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 30%;">제목</th>
							<th style="width: 20%;">시작시간</th>
							<th style="width: 20%;">끝나는 시간</th>
							<th style="width: 10%;">담당팀</th>
							<th style="width: 10%;">담당자</th>
							<th style="width: 10%;">등록 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="contest" varStatus="stat">
							<tr>
								<td style="width: 30%;"><a
									href="${initParam.rootPath }/company/contest/read${pageMaker.makeSearch(pageMaker.cri.page)}&company_id=${company_login_company_id }&no=${contest.contest_id }">${contest.contest_title }</a></td>
								<td style="width: 20%;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${contest.contest_startDate}" /></td>
								<td style="width: 20%;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${contest.contest_endDate}" /></td>
								<td style="width: 10%;">${contest.team_name }</td>
								<td style="width: 10%;">${contest.manager_name }</td>
								<td style="width: 10%;"><button type="button" name="contestBtn" value="${contest.contest_id }">${contest.contest_status }</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
			</div>
		</div>
		<div align="right">
			<a class="btn btn-default pull-right" href="javascript:loginCheck()"
				id="write">글쓰기</a>
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
		<div class='box-body'>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							검색조건</option>
						<option value="t"
							<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
							제목</option>						
						<option value="w"
							<c:out value="${cri.searchType eq 'b'?'selected':''}"/>>
							담당팀</option>
						<option value="tw"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							담당자</option>
						<option value="d"
							<c:out value="${cri.searchType eq 'd'?'selected':''}"/>>
							등록상태</option>	
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>

				</div>
	</div>
</body>
</html>
