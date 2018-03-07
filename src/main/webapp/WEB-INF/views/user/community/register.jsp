<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="content">
       <div class="row">
          <div class="col-md-12">   
             <div class="box nox-primary">
                <div class="box-header">
                   <h3 class="box-title">REGISTER COMMUNITY</h3>
                </div>
          
    <form method="post">
       <div class="box-body">
          <div class="form-group">
             <label for="community_title">제목</label>
             <input type="text" id="community_title"
                   name="community_title" class="form-control" placeholder="제목을 쓰세요">
          </div>
          <div class="form-group">
		     <label for="community_writer">작성자</label> 
		     <input type="text"
				   name="community_writer" class="form-control" value="${user_login_id }" readonly>
		  </div>
          <div class="form-group">
             <label for="community_contents">내용</label>
			 <textarea class="form-control" name="community_contents" rows="3"
				   placeholder="내용을 입력하세요"></textarea>
          </div>
       </div>
       <!-- /.box-body -->

	   <div class="box-footer">
		   <button type="submit" class="btn btn-primary">등록</button>
	   </div>
    
    </form>       
             </div>
          </div>
       </div>
    </section>