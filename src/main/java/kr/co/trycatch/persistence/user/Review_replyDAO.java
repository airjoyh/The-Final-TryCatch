package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.Review_replyVO;

public interface Review_replyDAO {
	
	public void create(Review_replyVO review_replyVo) throws Exception;
	
	public List<Review_replyVO> list(int review_no, Criteria cri) throws Exception;
	
	public int count(int review_no) throws Exception;
	
	public int getReview_no(int reply_no) throws Exception;
	
	public void update(Review_replyVO review_replyVo) throws Exception;
	
	public void delete(int reply_no) throws Exception;
}
