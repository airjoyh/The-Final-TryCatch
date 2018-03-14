<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="content">
       <div class="row">
          <div class="col-md-12">   
             <div class="box nox-primary">
                <div class="box-header">
                   <h3 class="box-title">MODIFY COMMUNITY</h3>
                </div>
          
    <form role="form" id="modifyForm" action="modify" method="post">
       
       <input type='hidden' name='page' value="${cri.page}"> 
	   <input type='hidden' name='perPageNum' value="${cri.perPageNum}">

       <div class="box-body">
          <div class="form-group">
             <label for="community_no">글 번호</label>
             <input type="text" id="community_no"
                   name="community_no" class="form-control" value="${community.community_no}"
                   readonly="readonly">
          </div>
          
          <div class="form-group">
             <label for="community_title">제목</label>
             <input type="text" id="community_title"
                   name="community_title" class="form-control" value="${community.community_title}"
                   >
          </div>
          
          <div class="form-group">
             <label for="community_contents">내용</label>
			 <textarea class="form-control" id="community_contents" name="community_contents" rows="3"
				       >${community.community_contents}</textarea>
          </div>
         
          <div class="form-group">
		     <label for="community_writer">작성자</label> 
		     <input type="text"  id="community_writer"
				   name="community_writer" class="form-control" value="${user_login_id }" >
		  </div>
		  
       </div>
       <!-- /.box-body -->

       </form>
	   <div class="box-footer">
		   <button type="submit" class="btn btn-primary">수정</button>
		   <button type="submit" class="btn btn-warning">취소</button>
	   </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
             </div>
          </div>
       </div>
    </section>