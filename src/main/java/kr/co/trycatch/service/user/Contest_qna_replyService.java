package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.user.Contest_qna_replyVO;
import kr.co.trycatch.domain.user.Criteria;

public interface Contest_qna_replyService {

	public void addReply(Contest_qna_replyVO qna_replyVo) throws Exception;

	public List<Contest_qna_replyVO> list(int qna_no, Criteria cri) throws Exception;

	public int count(int qna_no) throws Exception;

	public void modify(Contest_qna_replyVO qna_replyVo) throws Exception;

	public void remove(int reply_no) throws Exception;
}
