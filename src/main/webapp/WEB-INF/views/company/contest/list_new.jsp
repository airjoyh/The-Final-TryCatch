<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>기업 콘테스트 개최 리스트</title>
</head>
<!--[if lt IE 9]> 
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]-->
<body>
	<!-- com-nav -->
	<%@include file="../../company-nav_new.jsp" %>
	
	<div class='container'>
	<!-- left section!!************************************************************** -->
		<div class='column-left'>

         <div class='com-contest-head'>
            <div class='title-wrapper'>
               <div class='column-title'>콘테스트 개최 리스트</div>
            </div>
            <div class='wrapper'>
               <div class='com-inline-txt'>
                  <p class='inline-txt-head'>콘테스트 등록 시 참고 사항</p>
                  <p class='inline-txt-body'>
                     - 콘테스트 개최 버튼을 클릭하여 콘테스트를 등록할 수 있습니다.<br>
                     - 콘테스트 리스트 우측의 '등록'버튼을 누르시면 구직자들에게 공개됩니다.<br>
                     - 문제 유형과 정답을 정확히 입력하여 주셔야 올바른 채점이 가능합니다.<br>
                     - 시험시 유의사항을 꼼꼼히 작성해 주시고 질의 게시판에 상시 답변 부탁드립니다.<br>
                  </p>
               
               </div>
               <div class='com-inline-btn'>
                  <input type="button" class='register-contest' onclick="loginCheck()" value='콘테스트 등록'>
               </div>
               
               </div>
            </div><!-- section_main1 -->

			<div class='section_contesttable'>
				<div class='wrapper'>
					<div class='company-contest-table'>
						<table cellspacing='0'>
							<tr>
								<th style="text-align: center;">콘테스트명</th>
								<th style="width:100%; display: table-cell;">시작 날짜</th>
								<th style="width: 160px">끝 날짜</th>
								<th style="width: 85px">담당부서</th>
								<th style="width: 75px">담장자명</th>
								<th style="width: 80px">등록 상태</th>
							</tr>
							<c:forEach items="${list }" var="contest" varStatus="stat">
								<tr>
									<td><a
										href="${initParam.rootPath }/company/contest/read${pageMaker.makeSearch(pageMaker.cri.page)}&company_id=${company_login_company_id }&no=${contest.contest_id }">${contest.contest_title }</a></td>
									<td style="width:100%; display: table-cell;">${contest.contest_startDate}</td>
									<td style="width: 170px">${contest.contest_endDate}</td>
									<td style="width: 85px">${contest.team_name }</td>
									<td style="width: 75px">${contest.manager_name }</td>
									<td style="width: 80px"><button type="button" class='fin-contest'
											name="contestBtn" value="${contest.contest_id }">${contest.contest_status }</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- 페이징 처리 -->
					<div class="board-paging">
						<div class="board-pageline" align="center">
							<ul class="board-pagination">
								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }&company_id=${param.company_id }">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a
										href="list${pageMaker.makeSearch(idx)}&company_id=${param.company_id }">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }&company_id=${param.company_id }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- 페이징 -->
					<!-- 검색 -->
					<div class='board-search' align="center">
						<select name="searchType" class="board_select">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}"/>>
							검색조건</option>
							<option value="a"
								<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
							제목</option>
							<option value="b"
								<c:out value="${cri.searchType eq 'b'?'selected':''}"/>>
							담당팀</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							담당자</option>
							<option value="d
						"
								<c:out value="${cri.searchType eq 'd'?'selected':''}"/>>
							등록상태</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button class="board-btn" id='searchBtn'>검색</button>

					</div>
					<!-- 검색  -->
				</div>
				<!-- wrapper -->

			</div>
			<!-- section_main2 -->

		</div>
		<!-- column-left -->


		<!-- right section!!************************************************************** -->
		<div id="rightDiv" class='column-right'>
			<div id="login_beforeDiv">
				<%@ include file="../com_login_before_new.jsp" %>
			</div>
			<div id="login_afterDiv" style="display: none">
				<%@ include file="../com_login_after_new.jsp" %>
			</div>
		</div><!-- column-right -->
		
		<!-- modal import -->
		<%@ include file="../company_modal_new.jsp" %>

	<!-- frame -->
	</div>

<script type="text/javascript">
	$(document).ready(function() {

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
				$(this).html('등록 완료');
			}else if(status == 'N'){
				$(this).html('등록');
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
								//$(this).add('#'+i).html('등록 완료');
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

		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
		} else {
			location.href = '${initParam.rootPath }/company/contest/register';
			//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
		}
	}
</script>
</body>
</html>
