package kr.co.trycatch.persistence.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.Contest_qnaVO;
import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.SearchCriteria;

@Repository
public class Contest_qnaDAOImpl implements Contest_qnaDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public void create(Contest_qnaVO contest_qnaVo) throws Exception {
		int t = session.insert("contest_qna.create",contest_qnaVo);
		System.out.println("콘테스트 게시판 글 수 "+t);
	}

	@Override
	public List<Contest_qnaVO> list(SearchCriteria cri, int contest_id) throws Exception {
		List<Contest_qnaVO> list = null;
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("contest_id", contest_id);
		map.put("cri", cri);
		
		return session.selectList("contest_qna.list", map, bounds);
	}

	@Override
	public List<Contest_qnaVO> listSearch(SearchCriteria cri, int contest_id) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("contest_id", contest_id);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		
		return session.selectList("contest_qna.listSearch",map,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, int contest_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("contest_id", contest_id);
		map.put("cri", cri);
		
		return session.selectOne("contest_qna.listSearchCount",map);
	}

	@Override
	public Contest_qnaVO read(int qna_no) throws Exception {
		
		return session.selectOne("contest_qna.read",qna_no);
	}

	@Override
	public void update(Contest_qnaVO contest_qnaVo) throws Exception {
		int t = session.update("contest_qna.update", contest_qnaVo);
		System.out.println("바뀐 콘테스트 후기 수"+t);
	}

	@Override
	public void delete(int qna_no) throws Exception {
		
		session.delete("contest_qna.delete", qna_no);
	}

	@Override
	public void updateReplyCount(int qna_no, int amount) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("qna_no", qna_no);
		map.put("amount", amount);

		session.update("contest_qna.updateReplyCount",map);
	}

	@Override
	public void updateViewCount(int qna_no) throws Exception {
		
		session.update("contest_qna.updateViewCount", qna_no);
	}

	/*@Override
	public NoteVO note() throws Exception {
		
		return session.select("contest_qna.note");
	}*/

}
