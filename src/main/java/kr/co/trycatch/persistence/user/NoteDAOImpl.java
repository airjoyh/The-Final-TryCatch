package kr.co.trycatch.persistence.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.SearchCriteria;

@Repository
public class NoteDAOImpl implements NoteDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public void create(NoteVO noteVo) throws Exception {
		session.insert("note.create", noteVo);
		
	}

	@Override
	public List<NoteVO> list(SearchCriteria cri, String note_receiver) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("note_receiver", note_receiver);
		map.put("cri", cri);
		return session.selectList("note.list", map, bounds);
	}

	@Override
	public NoteVO read(int note_id) throws Exception {
		return session.selectOne("note.read", note_id);
	}

	@Override
	public void delete(int note_id) throws Exception {
		session.delete("note.delete",note_id);
		
	}

	@Override
	public List<NoteVO> listSearch(SearchCriteria cri, String note_receiver) throws Exception {
	   RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
	   Map<String , Object> map = new HashMap<>();
	    map.put("note_receiver", note_receiver);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		
		return session.selectList("note.listSearch", map, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, String note_receiver) throws Exception {
	    Map<String , Object> map = new HashMap<>();
	    map.put("note_receiver", note_receiver);
	    map.put("cri", cri);
	    
		return session.selectOne("note.listSearchCount", map);
	}

}
