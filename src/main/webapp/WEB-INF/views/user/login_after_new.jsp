<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- CSS -->
<link href="${initParam.rootPath }/resources/css/zzim_jw.css" rel="stylesheet" type="text/css">
	
	
<div class="section_login">
	<div class="login-info">
		<div class="user-icon">
			<img src="${initParam.rootPath }/resources/image/ing/icon-2.svg">
		</div>
	<div class="id_div">
		<div id="logoutDiv" class="logout-btn">
			<a id="logout">로그아웃</a>
		</div>
	</div>
		<div class="user-email">${user_login_id}</div>
	</div>
	<div class="login-tab">
		<div class="mypage">마이페이지</div>
		<div class="note">
		쪽지 <label class="note-cnt"></label> <span id="note-cnt">${statusCount}</span>
	</div>
	<!-- hidden nav -->
	<div class="mypage-dropdown">
		<div class="line"></div>
			<div class="portfolio">포트폴리오 페이지</div>
			<div class="pwd-change">비밀번호 변경</div>
			</div>
		</div>
	</div>
	<!-- section_login -->
	<div class="section_zzim">
		<div class="title-wrapper">
			<div class="column-zzimtitle">관심기업 리스트</div>
		</div>
	<div class="wrapper">
		<div class="column-contents">
		
		<div class="zzim-content-box">
			<table class="zzim-table">
				<tbody>
			<!-- 찜한기업리스트  forEach-->
						<c:forEach items="${zzimList }" var="zzim" varStatus="stat">
							<tr>
								<td style="width: 25%;"><a
									href="${initParam.rootPath }/user/review/list?company_id=${zzim.ZZIM_SELECTED }">${zzim.COMPANY_NAME }</a></td>
							</tr>
						</c:forEach>
						<!-- <tr>
						<td><a href="#가라컴퍼니">가라컴퍼니</a></td>
					</tr>
					<tr>
						<td><a href="#가라컴퍼니">다정엔터테인먼트</a></td>
					</tr>
					<tr> 
						<td><a href="#가라컴퍼니">지원프로덕션</a></td>
					</tr> -->
					<!-- <tr>
						<td><a href="#가라컴퍼니">할리스커피</a></td>
					</tr>
					<tr>
						<td><a href="#가라컴퍼니">맥도날드</a></td>
					</tr> -->
					 
				</tbody>
			</table>	
		</div>
		<%-- 	<!-- <div class="zzim-page-box">페이징</div> -->
			<div align="center">
				<ul class="zzim-page-box">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="zzimlist${pageMaker.makeSearch(pageMaker.startPage - 1) }&zzim_select=${param.zzim_select }">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a
							href="zzimlist${pageMaker.makeSearch(idx)}&zzim_select=${param.zzim_select }">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="zzimlist${pageMaker.makeSearch(pageMaker.endPage +1) }&zzim_select=${param.zzim_select }">&raquo;</a></li>
					</c:if>
				</ul>
			</div> --%>
		</div>
		
	</div>
</div>
<!-- section_zzim -->


