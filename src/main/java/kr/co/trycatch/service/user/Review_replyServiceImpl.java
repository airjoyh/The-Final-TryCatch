package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.Review_replyVO;
import kr.co.trycatch.persistence.user.ReviewDAO;
import kr.co.trycatch.persistence.user.Review_replyDAO;

@Service
public class Review_replyServiceImpl implements Review_replyService {

	@Inject
	private Review_replyDAO review_replyDao;
	
	@Inject
	private ReviewDAO reviewDao;
	
	@Transactional
	@Override
	public void addReply(Review_replyVO review_replyVo) throws Exception {
		review_replyDao.create(review_replyVo);
		//댓글 수 증가 추가.
		reviewDao.updateReplyCount(review_replyVo.getReview_no(), 1);
	}

	@Override
	public List<Review_replyVO> list(int review_no, Criteria cri) throws Exception {
		
		return review_replyDao.list(review_no, cri);
	}

	@Override
	public int count(int review_no) throws Exception {

		return review_replyDao.count(review_no);
	}

	@Override
	public void modify(Review_replyVO review_replyVo) throws Exception {
		review_replyDao.update(review_replyVo);
		
	}

	@Transactional
	@Override
	public void remove(int reply_no) throws Exception {
		int review_no = review_replyDao.getReview_no(reply_no);
		review_replyDao.delete(reply_no);
		//댓글 수 업데이트 추가
		reviewDao.updateReplyCount(review_no, -1);//게시물 댓글수 감소(-1)
		
	}

}
