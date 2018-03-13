package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.Contest_qna_replyVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.persistence.user.Contest_qnaDAO;
import kr.co.trycatch.persistence.user.Contest_qna_replyDAO;

@Service
public class Contest_qna_replyServiceImpl implements Contest_qna_replyService {

	@Inject
	private Contest_qna_replyDAO qna_replyDao;
	
	@Inject
	private Contest_qnaDAO contest_qnaDao;

	@Override
	public void addReply(Contest_qna_replyVO qna_replyVo) throws Exception {
		qna_replyDao.create(qna_replyVo);
		//댓글 수 증가 추가
		contest_qnaDao.updateReplyCount(qna_replyVo.getQna_no(), 1);
		
	}

	@Override
	public List<Contest_qna_replyVO> list(int qna_no, Criteria cri) throws Exception {
		
		return qna_replyDao.list(qna_no, cri);
	}

	@Override
	public int count(int qna_no) throws Exception {
	
		return qna_replyDao.count(qna_no);
	}

	@Override
	public void modify(Contest_qna_replyVO qna_replyVo) throws Exception {
        qna_replyDao.update(qna_replyVo);
		
	}

	@Override
	public void remove(int reply_no) throws Exception {
		int qna_no = qna_replyDao.getReview_no(reply_no);
		qna_replyDao.delete(reply_no);
		//댓글 수 업데이트 추가 
		contest_qnaDao.updateReplyCount(qna_no, -1);//게시물 댓글 수 감소
		
	}
	
	
}
