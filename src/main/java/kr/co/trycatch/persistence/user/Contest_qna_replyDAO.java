package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.Contest_qna_replyVO;
import kr.co.trycatch.domain.user.Criteria;

public interface Contest_qna_replyDAO {

public void create(Contest_qna_replyVO qna_replyVo) throws Exception;
	
	public List<Contest_qna_replyVO> list(int qna_no, Criteria cri) throws Exception;
	
	public int count(int qna_no) throws Exception;
	
	public int getReview_no(int reply_no) throws Exception;
	
	public void update(Contest_qna_replyVO qna_replyVo) throws Exception;
	
	public void delete(int reply_no) throws Exception;
}
