package kr.co.trycatch.persistence.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.Review_replyVO;

@Repository
public class Review_replyDaoImpl implements Review_replyDAO {

	@Inject
	private SqlSession session;

	@Override
	public void create(Review_replyVO review_replyVo) throws Exception {
		session.insert("review_reply.create", review_replyVo);

	}

	@Override
	public List<Review_replyVO> list(int review_no, Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());

		return session.selectList("review_reply.list", review_no);
	}

	@Override
	public int count(int review_no) throws Exception {

		return session.selectOne("review_reply.count", review_no);
	}

	@Override
	public int getReview_no(int reply_no) throws Exception {

		return session.selectOne("review_reply.getReview_no", reply_no);
	}

	@Override
	public void update(Review_replyVO review_replyVo) throws Exception {
		session.update("review_reply.update", review_replyVo);

	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.delete("review_reply.delete", reply_no);

	}

}
