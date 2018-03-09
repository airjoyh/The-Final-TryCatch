<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>기업후기</title>
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

<title>Board List</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.initial').hide();
		$('.tdTtl').mouseenter(function() {

		});

		$('#myTab a:last').tab('show');

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
							+"&company_id=${param.company_id}";
		});

		$('#newBtn').on("click", function(evt) {//글쓰기(New Board) 버튼을 클릭하면

			self.location = "register";//입력폼으로 이동

		});
		 
	 	 $('#zzimlistBtn').on("click", function() {//찜리스트 보이기
			
			self.location="${initParam.rootPath}/ing/zzimlist?zzim_select=${user_login_id}";
		
		});   
	 	 
	 	 $('#zzimOutBtn').on("click", function () {//찜하기 취소버튼 클릭시
	 		 console.log('찜하기취소버튼');
	 		var form=$(this).parent(); 
	 		 form.attr('action','${initParam.rootPath}/remove');
			  //<form action="remove">
			  form.submit();	 		 
		});

	 	 
	 	 //찜한 행 존재 유무  
	 	  $.ajax({
			   url: '${initParam.rootPath}/zziminout',
			   type:'post',
			   data: {
				    zzim_selected:${company_info.company_id},
				    zzim_select:'${user_login_id }'
			   },
			   success: function (result) {
				   console.log(result);
		        		if(result=="exist"){
		        			 $('#zzimBtn').hide();
		        		}else{
		        			 $('#zzimOutBtn').hide();
		        		}
			    }
			  
			  
		  }); 
	 	 
		
	});//document.ready
	/* 검색창 드롭다운 메뉴 */
	$('.taco').click(function(e) {
		var txt = $(e.target).text();
		$('.taco-input').val(txt);
	});

	function loginCheck() {

		var loginState = '${user_loginState }';
		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
		} else {
			location.href = '${initParam.rootPath }/user/review/register?company_id=${param.company_id}';
			//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
		}
	}

	/* function loginCheckzzim() {

		var loginState = '${user_loginState }';
		//alert("로그인 상태>>>" + loginState);
		if (loginState != 'login') {
			alert('로그인하신 후에 이용 가능합니다.');
			location.href = '${initParam.rootPath }/user/main';
		} else {
			location.href = '${initParam.rootPath }/user/review/list?company_id=${param.company_id}';
		}
	} */

	
</script>

<!-- Custom jQuery -->
<!-- Custom styles -->
<%-- <link href="${initParam.rootPath }/css/font.css" rel="stylesheet"> --%>
<link href="${initParam.rootPath }/resources/css/trycatch.css" rel="stylesheet">

</head>
<body style="background-color: #f4f4f4;">    

	<!--***********************************************************
		*                                                             *
		*                            nav                              *
		*                                                             *
		************************************************************-->
	<%@include file="../../../userNavBar.jsp" %>

	<!--***********************************************************
	*                                                             *
	*                          기업베너                                                                 *
	*                                                             *
	************************************************************-->
	<div class="container-fluid">
		<div class="row"
			style="padding-top: 10em; padding-bottom: 5em;
		                        padding-left: 12em; padding-right: 3em; background-image: url('${initParam.rootPath }/resources/image/building/building_5.jpg');">
			<h1 style="color: white; font-weight: 700;">${company_info.company_name }</h1>
			<h4 style="color: white;">${company_info.company_site }</h4>
		</div>
	</div>
	<!--***********************************************************
	*                                                             *
	*                           기업소개                                                                *
	*                                                             *
	************************************************************-->
	<div class="container"
		style="background-color: #ffffff; margin-top: 2em">
		<!-- 탭공간  -->
		<ul id="myTab" class="nav nav-tabs nav-justified"
			style="font-weight: bold; font-size: 1.2em;">
			<li role="presentatioin" class="active"><a href="#comInfo"
				aria-controls="cominfo" role="tab" data-toggle="tab">기업소개</a></li>
			<li role="presentatioin"><a href="#review"
				aria-controls="review" role="tab" data-toggle="tab">후기</a></li>
		</ul>
		<div class="tab-content"
			style="padding-top: 5em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
			<div role="tabpanel" class="tab-pane active" id="comInfo"
				style="background-color: #ffffff; margin-top: 2em">
				
				<div class="row">
				 <form method="post">
				  <input type="hidden" id="zzim_select" name="zzim_select" value="${user_login_id }">
				  <input type="hidden" name="zzim_selected" id="zzim_selected" value="${company_info.company_id}">
				  <%-- <input type="hidden" name="company_id" value="${company_info.company_id}"> --%>
				<button style="float: right;" id="zzimBtn" type="submit">찜하기</button>	  			  				  		  				  
				<button style="float: right;" id="zzimOutBtn" type="button">찜하기 취소</button>	  			  				  		  				  
				</form>
				<button style="float: right;" id="zzimlistBtn">리스트보기</button>		  			  				  
				<!-- <div align="right">
		         	<a class="btn btn-default pull-right" href="javascript:loginCheckzzim()"
			    	id="write">찜하기</a>
		             </div> -->
				</div>
				
				<div class="row"
					style="padding-top: 5em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
					<div class="col-sm-6">
						<div class="form-group">
							<label id="company_name" style="text-align: right;">기업명</label>
							<div>${company_info.company_name }</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label id="company_year">설립 년도</label>
							<div>${company_info.company_year }</div>
						</div>
					</div>
				</div>
				<div class="row"
					style="padding-top: 5em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
					<div class="col-sm-6">
						<div class="form-group">
							<label id="company_site">기업 사이트</label>
							<div>${company_info.company_site }</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label id="company_addr">기업 주소</label>
							<div>${company_info.company_addr }</div>
						</div>
					</div>
				</div>
				<div class="row"
					style="padding-top: 5em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
					<div class="col-sm-6">
						<div class="form-group">
							<label id="company_size">기업 규모</label>
							<div>${company_info.company_size }</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label id="company_turnover">매출액</label>
							<div>${company_info.company_turnover }</div>
						</div>
					</div>
				</div>
				<div class="row"
					style="padding-top: 5em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
					<div class="col-sm-6">
						<div class="form-group">
							<label id="company_line">산업군</label>
							<div>${company_info.company_line }</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label id="com_intro">기업소개</label>
							<div>${company_info.company_intro }</div>
						</div>
					</div>
					
				</div>
			</div>
			<!--***********************************************************
		*                                                             *
		*                           후기                                                                      *
		*                                                             *
		************************************************************-->
			<div role="tabpanel" class="tab-pane" id="review"
				style="background-color: #ffffff; margin-top: 2em">
				<!-- 평점란 -->
				<div class="row"
					style="padding-top: 5em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
					<div class="col-sm-4">
						<div class="form-group">
							<label for="progress_1">총평점</label>
							<div class="progress" id="progress_1">
								<div id="total" class="progress-bar progress-bar-warning"
									role="progressbar" aria-valuenow="90" aria-valuemin="0"
									aria-valuemax="100" style="width: ${total*20 }%">
									<span class="sr-only">70% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2" style="padding-top: 25px;">${total }
						/ 5</div>

					<div class="col-sm-4">
						<div class="form-group">
							<label for="progress_1">승진 기회 및 가능성</label>
							<div class="progress" id="progress_1">
								<div id="possibility" class="progress-bar" role="progressbar"
									aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
									style="width: ${avgScore.avg_possibility*20 }%">
									<span class="sr-only">70% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2" style="padding-top: 25px;">${avgScore.avg_possibility }
						/ 5</div>
				</div>

				<div class="row"
					style="padding-top: 1em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
					<div class="col-sm-4">
						<div class="form-group">
							<label for="progress_1">복지 및 급여</label>
							<div class="progress" id="progress_1">
								<div id="welSal" class="progress-bar" role="progressbar"
									aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
									style="width: ${avgScore.avg_welSal*20 }%">
									<span class="sr-only">70% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2" style="padding-top: 25px;">${avgScore.avg_welSal }
						/ 5</div>

					<div class="col-sm-4">
						<div class="form-group">
							<label for="progress_1">업무와 삶의 균형</label>
							<div class="progress" id="progress_1">
								<div id="balance" class="progress-bar" role="progressbar"
									aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
									style="width: ${avgScore.avg_balance*20 }%">
									<span class="sr-only">70% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2" style="padding-top: 25px;">${avgScore.avg_balance }
						/ 5</div>
				</div>

				<div class="row"
					style="padding-top: 1em; padding-bottom: 2em; padding-left: 3em; padding-right: 3em;">
					<div class="col-sm-4">
						<div class="form-group">
							<label for="progress_1">사내문화</label>
							<div class="progress" id="progress_1">
								<div id="culture" class="progress-bar" role="progressbar"
									aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
									style="width: ${avgScore.avg_culture*20 }%">
									<span class="sr-only">70% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2" style="padding-top: 25px;">${avgScore.avg_culture }
						/ 5</div>

					<div class="col-sm-4">
						<div class="form-group">
							<label for="progress_1">경영진</label>
							<div class="progress" id="progress_1">
								<div id="manager" class="progress-bar" role="progressbar"
									aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
									style="width: ${avgScore.avg_manager*20 }%">
									<span class="sr-only">70% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2" style="padding-top: 25px;">${avgScore.avg_manager }
						/ 5</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<!--  	<script type="text/javascript">
 		$(function(){
			$('#myTab a:last').tab('show')
 		});
 	</script> 	 -->



	<!--***********************************************************
	*                                                             *
	*                           후기게시판-상현                                                    *
	*                                                             *
	************************************************************-->
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
							<th style="width: 10%;">글번호</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 10%;">작성자</th>
							<th style="width: 15%;">작성일</th>
							<th style="width: 10%;">조회수</th>
							<th style="width: 7%;">댓글</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="review" varStatus="stat">
							<tr>
								<td style="width: 10%;">${review.review_no }</td>
								<td style="width: 40%;"><a
									href="${initParam.rootPath }/user/review/read${pageMaker.makeSearch(pageMaker.cri.page)}&company_id=${param.company_id }&no=${review.review_no }">${review.review_title }</a></td>
								<td style="width: 10%;">${review.review_writer }</td>
								<td style="width: 15%;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.review_wdate}" /></td>
								<td id="count" style="width: 10%;">${review.review_viewCount }</td>
								<td><span class="badge">${review.review_replyCount }</span></td>
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
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>						
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자</option>
						<option value="tw"
							<c:out value="${cri.searchType eq 'tw'?'selected':''}"/>>
							제목+작성자</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>

				</div>
	</div>
	
<!-- 	<script type="text/javascript">
	    var msg = '${msg}';
	    if(msg != ""){
	    	alert(msg);
	    	
	    }
	</script> -->
	
</body>
</html>