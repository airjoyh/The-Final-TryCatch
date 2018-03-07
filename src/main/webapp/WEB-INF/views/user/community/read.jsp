<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<section class="content">
   <div class="row">
      <div class="col-md-12">
         <div class="box box-primary">
            <div class="box-header">
               <h3 class="box-title">커뮤니티 페이지 읽기</h3>
            </div>
            
            
            <div class="box-body">
               <div class="form-group">
                  <label for="community_title">글 제목</label>
                  <input type="text" id="community_title"
                         name="community_title" class="form-control" value="${communityVo.community_title}"
                         readonly="readonly">
             </div>
             <div class="form-group">
                <label for="community_contents">글 내용</label>
                <textarea class="form-control" name="community_contents" rows="3" id="community_contents"
                          readonly="readonly">${communityVo.community_contents}</textarea>
             </div>
             <div class="form-group">
                <label for="community_writer">Community_writer</label>
                <input type="text" id="community_writer"
                       name="community_writer" class="form-control" value="${communityVo.community_writer}"
                       readonly="readonly">
             </div>
             
             <div class="box-footer">
             <ul class="mailbox-attachments clearfix uploadedList">
             </ul>
             <c:if test="${member.member_id == communityVo.community_writer}">
			    <button type="submit" class="btn btn-warning" id="modifyBtn">글 수정</button>
			    <button type="submit" class="btn btn-danger" id="removeBtn">글 삭제</button>
			  </c:if>
			    <button type="submit" class="btn btn-primary" id="goListBtn">글 리스트로</button>
             </div>
              
            </div>
         </div>
      </div>
   </div>
</section>