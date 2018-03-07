<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<section class="content">
   <div class="row">
      <div class="col-md-12">
         <div class="box">
            <div class="box-header with-border">
               <h3 class="box-title">커뮤니티 리스트</h3>
            </div>
            <div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>댓글</th>
						</tr>

						<c:forEach items="${list}" var="communityVo" varStatus="stat">
							<tr>
								<td>${communityVo.community_no }</td>
								<td><a href='/user/community/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&community_no=${communityVo.community_no}'>
								    ${communityVo.community_title}</a></td>
								<td>${communityVo.community_writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${communityVo.community_wdate}" /></td>
								<td>${communityVo.community_viewCount}</td>
								<td>${communityVo.community_replyCount}</td>
								<!-- <td><span class="badge bg-red">${communityVo.community_viewCount}</span></td>
								<td><span class="badge bg-yellow">${community_replyCount_list.get(stat.index) }</span></td> -->
							</tr>
						</c:forEach>

					</table>
				</div>
				
			     <div class="text-center">
			    
			       <div class="text-center">
			          <ul class="pagination">
			          
			          <c:if test="${pageMaker.prev}">
			             <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
			          </c:if>
			          
			          <c:forEach begin="${pageMaker.startPage}"
			                     end="${pageMaker.endPage}"var="idx">
			                     <li
			                        <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
			                        <a href="list${pageMaaker.makeSearch(idx)}">${idx}</a>>
			                     </li>
			          </c:forEach>
			          
			          <c:if test="${pageMaaker.next && pageMaker.endPage > 0}">
			             <li><a 
			                 href="list${pageMake.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
			          </c:if>
			          
			          </ul>
			       </div>
			    </div>  
         
         </div>
      </div>
   </div>
</section>