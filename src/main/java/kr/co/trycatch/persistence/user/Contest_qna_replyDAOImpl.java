package kr.co.trycatch.persistence.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.Contest_qna_replyVO;
import kr.co.trycatch.domain.user.Criteria;

@Repository
public class Contest_qna_replyDAOImpl implements Contest_qna_replyDAO {

	@Inject
	private SqlSession session;

	@Override
	public void create(Contest_qna_replyVO qna_replyVo) throws Exception {
		session.insert("qna_reply.create", qna_replyVo);
		
	}

	@Override
	public List<Contest_qna_replyVO> list(int qna_no, Criteria cri) throws Exception {
		System.out.println("skip행:"+cri.getPageStart()+", 조회할 최대행수: "+cri.getPerPageNum());
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		//return session.selectList("qna_reply.list",qna_no );  전체행
		return session.selectList("qna_reply.list",qna_no, bounds); //특정 limit에 해당하는 행 
	}

	@Override
	public int count(int qna_no) throws Exception {
		
		return session.selectOne("qna_reply.count",qna_no);
	}

	@Override
	public int getReview_no(int reply_no) throws Exception {
	
		return session.selectOne("qna_reply.getReview_no",reply_no );
	}

	@Override
	public void update(Contest_qna_replyVO qna_replyVo) throws Exception {
		session.update("qna_reply.update",qna_replyVo);
		
	}

	@Override
	public void delete(int reply_no) throws Exception {
	   session.delete("qna_reply.delete", reply_no);
		
	}
	
	
}
