<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<!-- user/community/list.jsp -->
<!-- j-Query 업로드 소스 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
	   //alert("list페이지에 들어올 때 로그인 상태 >>> ${user_loginState}, ${user_login_id}")
	   	   
			   $('#searchBtn').on( //Search 버튼 을 클릭하면
					   "click",
					   function(event){
						   
				          self.location = "list"
				             + '${pageMaker.makeQuery(1)}'
				             + "&searchType="
				             +$("select option:selected").val()
				             +"&keyword="+$('#keywordInput').val();
					   
			   });
			   $('#newBtn').on("click", function(evt){

				   self.location = "register";//입력폼으로 이동
			  
			   });// 여기에 글쓰기 버튼을 눌렀을때 로그인을 한 상태가 아니라면 
			      // 로그인 요청페이지가 뜨고 확인을 누르면 로그인 페이지로 이동해야한다
			
   
              /* $('#writeBtn').on("click", function () {
            	 self.location="${initParam.rootPath}/user/community/register"; 
            	  
              }); */
   });//function
   function loginCheck() {

		var loginState = '${user_loginState}';
		var login_id = '${user_login_id}';
		console.log("로그인 아이디 >>> "+login_id);
		
		//alert("로그인 상태>>>" + loginState);
		if (loginState != "login") {
			alert('로그인하신 후에 이용 가능합니다.');
		} else {
			//alert('현재 로그인상태입니다')
			location.href = '${initParam.rootPath}/user/community/register?community_no=${param.community_no}';
			//location.href = '${initParam.rootPath }/review/control.do?action=inputForm&company_id=${cominfo.company_id}';
		}
	}
   
</script>
<!-- user/community/list.jsp -->
<section class="content">
   <div class="row">
      <div class="col-md-12">
         <div class="box">
            <div class="box-header with-border">
               <h3 class="box-title">커뮤니티 리스트</h3>
            </div>
            <div class="box-body">
               
                  <select name="searchType">
                     <option value="n"
                        <c:out value="${cri.searchType == null?'selected':''}"/>>
                        ---</option>
                     <option value="t"
                        <c:out value="${(cri.searchType eq 't')?'selected':''}"/>>
                                             글 제목</option>
                     <option value="w"
                        <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                                             작성자</option>                             
                  </select> <input type="text" name='keyword' id="keywordInput"
                     value='${cri.keyword}'>
                  <button id='searchBtn'>검색</button>     
                  <!-- <button id='writeBtn'>글쓰기</button> -->     
                      
                     
			</div>
         </div>
         
         <div class="box">
            <div class="box-header with-border">
               <h3 class="box-title">LIST PAGING</h3>
            </div>
            <div class="box-body">
               <table class="table table-bordered">
                  <tr>
                     <th>글 번호</th>
                     <th>글 제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>조회수</th>
                     <th>댓글</th>
                  </tr>
                  
                  <c:forEach items="${list}" var="communityVo" varStatus="stat">
                     <tr>
                        <td>${communityVo.community_no}</td>
                        <td><a href='/tc/user/community/read${pageMaker.makeSearch(pageMaker.cri.page)}&community_no=${communityVo.community_no}'>
                            ${communityVo.community_title}</a></td>
                        <td>${communityVo.community_writer}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                  value="${communityVo.community_wdate}"/></td>
                        <td>${communityVo.community_viewCount}</td> 
                        <td>${communityVo.community_replyCount}</td>             
                     </tr>
                  </c:forEach>
                  
               </table>
         
             <div align="right">
			    <a class="btn btn-default pull-right" href="javascript:loginCheck()"
				    id="write">글쓰기</a>
		     </div>  
            </div>
            <!-- <button id='newBtn'>New Board</button> -->
             <div class="text-center">
               <ul class="pagination">
                  <c:if test="${pageMaker.prev}">
						<li><a
						   href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
				  </c:if>
				  
				  <c:forEach begin="${pageMaker.startPage}"
					   end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
				   </c:forEach>
				   
				  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
			      </c:if>        
               </ul>
             </div>
           </div>
           <!-- /.box-footer-->    
         </div>
      </div>
      <!--/.col (left) -->
      
  
   <!-- /.row -->
</section>
<!-- /.content -->
