package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.Review_replyVO;

public interface Review_replyService {
	public void addReply(Review_replyVO review_replyVo) throws Exception;

	public List<Review_replyVO> list(int review_no, Criteria cri) throws Exception;

	public int count(int review_no) throws Exception;

	public void modify(Review_replyVO review_replyVo) throws Exception;

	public void remove(int reply_no) throws Exception;
}
