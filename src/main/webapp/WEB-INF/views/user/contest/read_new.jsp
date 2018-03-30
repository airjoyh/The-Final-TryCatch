<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>커뮤니티 게시판</title>

<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/user_contest_read.css" rel="stylesheet" type="text/css">



<script type="text/javascript">

</script>
</head>
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<body>
  <!-- nav-area -->
  <%@ include file="../../user-nav_new.jsp" %>

    <div class='container'>

      <form id="readForm" name="readForm" method="POST">
        <input type="hidden" id="contest_id" name="contest_id" value="${contest.contest_id }">
        <input type='hidden' name='page' value="${cri.page}">
        <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
        <input type='hidden' name='searchType' value="${cri.searchType}">
        <input type='hidden' name='keyword' value="${cri.keyword}">
      </form>

      <!-- left section!!************************************************************** -->
      <div class='column-left'>

        <div class='user-contest-read'>

          <div class='title-wrapper'>
            <div class='column-title'>콘테스트 상세정보</div>
          </div>
          <div class="tabs effect-3">

            <input type="radio" id="tab-1" name="tab" checked="checked">
            <span href="#tab-item-1">콘테스트 내용</span> <input type="radio" id="tab-2" name="tab"> <span href="#tab-item-2">콘테스트
						참가</span>
            <div class="line ease"></div>

            <div class="tab-content">

              <section id="tab-item-1">
                <div class='read-title'>${contest.contest_title }</div>
                <div class='contest-info'>
                  <table cellspacing="20px">
                    <tr>
                      <td >개최 기업명</td><td>${contest.company_name }</td>
                      <td >채용 인원수</td><td>${contest.contest_hireNumber }</td>
                    </tr>
                    <tr>
                      <td>시작날짜</td><td>${contest.contest_startDate}</td>
                      <td>끝날짜</td><td>${contest.contest_endDate}</td>
                    </tr>
                    <tr>
                      <td>관련분야</td><td colspan="4">${contest.contest_field }</td>
                    </tr>
                  </table>
                </div>

                <div class='text-contents'>${contest.contest_contents }</div>
                <div class='contest-info'>
                  <table cellspacing="20px">
                    <tr>
                      <td >담당자명</td><td>${contest.company_name }</td>
                      <td >담당소속</td><td>${contest.contest_hireNumber }</td>
                    </tr>
                    <tr>
                      <td>이메일</td><td>${contest.contest_startDate}</td>
                      <td>연락처</td><td>${contest.contest_endDate}</td>
                    </tr>
                  </table>
                </div>
                <div id="goList">
                  <div class="btn-txt">목록보기</div>
                </div>


              </section>

              <section id="tab-item-2">

                <div class='contest-start-info'>
                  - 콘테스트 시작 가능 시각은 ${contest.contest_startDate} 입니다.<br>
                  - 콘테스트참가는 시작 시각 5분후까지 참가 가능합니다.
                </div>
                <div class='contest-start-btn' id="startContestBtn" style="border-bottom: 1px solid #ddd">
                  <div>콘테스트 시작</div>
                </div>
                <div class='contest-start-btn' id="goRankListBtn">
                  <div>점수 보러가기</div>
                </div>

              </section>

            </div>
          </div>
          <!-- tab -->
        </div>
        <!-- section_main_community -->

        <div class='contest-qna'>

          <div class='title-wrapper'>
            <div class='column-title'>${contest.contest_title } 콘테스트 Q&A</div>
          </div>

          <div class='company-contest-table'>
            <table cellspacing='0'>
              <tr>
                <th style="text-align: center;">제목</th>
                <th >작성자</th>
                <th >작성일</th>
                <th >조회수</th>
                <th>댓글</th>
              </tr>
              <c:forEach items="${list}" var="contest_qna" varStatus="stat">
                <tr>
                  <td style="width: 300px;"><a href='${initParam.rootPath}/user/contest/qna/read${pageMaker.makeSearch(pageMaker.cri.page)}&contest_id=${param.contest_id }&qna_no=${contest_qna.qna_no}'>
										${contest_qna.qna_title }</a></td>
                  <td style="width: 160px; display: table-cell;">${contest_qna.qna_writer }</td>
                  <td>
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${contest_qna.qna_wdate}" />
                  </td>
                  <td>${contest_qna.qna_viewCount }</td>
                  <td>${contest_qna.qna_replyCount }</td>
                </tr>
              </c:forEach>
            </table>
          </div>

          <div class="board-paging">
            <div class="board-pageline" align="center">
              <ul class="board-pagination">
                <c:if test="${pageMaker.prev}">
                  <li><a href="read${pageMaker.makeSearch(pageMaker.startPage - 1) }&contest_id=${param.contest_id }">&laquo;</a></li>
                </c:if>
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                  <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}" />>
                  <a href="read${pageMaker.makeSearch(idx)}&contest_id=${param.contest_id }">${idx}</a>
                  </li>
                </c:forEach>

                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                  <li><a href="read${pageMaker.makeSearch(pageMaker.endPage +1) }&contest_id=${param.contest_id }">&raquo;</a></li>
                </c:if>
              </ul>
            </div>
            <div class='board-search' align="center">
              <select name="searchType" class="board_select">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}"/>>
                   					 검색조건</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                    					제목</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                   					 작성자</option>
                   			<option value="tw"
								<c:out value="${cri.searchType eq 'tw'?'selected':''}"/>>
								제목+작성자</option>		 
						</select> <input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
              <button class="board-btn" id='searchBtn'>검색</button>
              <button class="board-btn" id='registBtn'>글쓰기</button>
            </div>
          </div>

        </div>
        <!-- contest-qna -->
      </div>
      <!-- column-left -->

      <!-- right section!!************************************************************** -->
      <div class='column-right'>
        <div id="rightDiv" class='column-right'>
          <div id="login_beforeDiv">
            <%@ include file="../../user/login_before_new.jsp"%>
          </div>
          <div id="login_afterDiv" style="display: none">
            <%@ include file="../login_after_new.jsp"%>
          </div>
        </div>
        <!-- column-right -->
      </div>
      <!-- modal 코드 -->
      <%@ include file="../user_modals_new.jsp" %>

    </div>
    <!-- container -->


    <!-- frame -->
    <script type="text/javascript">
      $(function() {

        $('#goList').on("click", function() {
          console.log('목록보기 버튼 클릭');
          self.location = "${initParam.rootPath }/user/contest/list?page=${cri.page }" +
            "&perPageNum=${cri.perPageNum }&searchType=${cri.searchType }" +
            "&keyword=${cri.keyword }";
        }); //goList클릭

        $('#startContestBtn').on("click", function() {
	          console.log('콘테스트 시작 버튼 클릭');
	          var loginState = '${user_loginState}';
	          var contest_id = $('#contest_id').val();
			  var user_id = '${user_login_id}';
			  
	          if (loginState != 'login') {
	            alert('콘테스트는 로그인을 하신 이후에 이용 가능합니다.');
	            login_id.focus();
	          } else {
	        	  $.ajax({
	        		  type: 'post',
	        		  url: '${initParam.rootPath}/user/contest/quiz/solveCount',
	        		  data: {"contest_id":contest_id, "user_id":user_id},
	        		  success:function(result){
	        			  console.log(result);
	        			  if(result == 'startYet'){
	        				  alert('아직 해당 콘테스트 시작날짜가 아닙니다.');
	        				  
	        			  }else if(result == 'endAlready'){
	        				  alert('해당 콘테스트 응시기간이 지났습니다.');
	        				  
	        			  }else if(result =='solveAlready'){
	        				  alert('이미 해당 콘테스트를 응시하셨습니다.');
	        				  
	        			  }else if(result=='solveYet'){
				              self.location = '${initParam.rootPath}/user/contest/quiz/solve?contest_id=' + contest_id + '&quiz_no=1';
	        				  
	        			  }
	        		  }
	        		  
	        	  });
	          }
        });

        $('#goRankListBtn').on("click", function() {
          console.log('점수보러가기 버튼 클릭');
          var contest_id = $('#contest_id').val();
          self.location = '${initParam.rootPath}/user/contest/rankList?contest_id=' + contest_id;
        });
        
        $('#registBtn').on("click", function(evt) {//글쓰기(New Board) 버튼을 클릭하면
			if(loginState!='login'){
				alert('글쓰기는 로그인한 후에 가능합니다.');
				login_id.focus();
			}else{
   	     		self.location = "${initParam.rootPath }/user/contest/qna/register?contest_id=${param.contest_id }";//입력폼으로 이동
				
			}

        });
// -------------------------------------- Q&A --------------------------------------         
        $('#searchBtn').on("click", function(event) {
    		//검색(Search) 버튼을 클릭하면
    			self.location = "read" //'list'
    							+ '${pageMaker.makeQuery(1)}'
    							  //'list?page=1&perPageNum=10'
    							+ "&searchType="
    							//'list?page=1&perPageNum=10&searchType='
    							+ $("select option:selected").val()
    							//'list?page=1&perPageNum=10&searchType=t'
    							+ "&keyword=" + $('#keywordInput').val()
    							//'list?page=1&perPageNum=10&searchType=t&keyword=�ㅻ뒛'
    							+"&contest_id=${param.contest_id}";
    		});

      }); //function
    </script>
</body>

</html>
