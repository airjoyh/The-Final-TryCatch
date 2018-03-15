package kr.co.trycatch.persistence.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.Community_replyVO;
import kr.co.trycatch.domain.user.Criteria;

@Repository
public class Community_replyDAOImpl implements Community_replyDAO {
    
	@Inject
	private SqlSession session;
	
	@Override
	public void create(Community_replyVO community_replyVo) throws Exception {
	   session.insert("community_reply.create", community_replyVo);
	}//댓글 입력

	@Override
	public List<Community_replyVO> list(int community_no, Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		
		return session.selectList("community_reply.list",community_no, bounds);
	}//댓글 리스트 조회

	@Override
	public int count(int community_no) throws Exception {
		
		return session.selectOne("community_reply.count", community_no);
	}

	@Override
	public int getCommunity_no(int reply_no) throws Exception {
		
		return session.selectOne("community_reply.getCommunity_no", reply_no);
	}

	@Override
	public void update(Community_replyVO community_replyVo) throws Exception {
		session.update("community_reply.update", community_replyVo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.delete("community_reply.delete", reply_no);
	}

}
