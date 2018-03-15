package kr.co.trycatch.persistence.company;

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
public class NoteComDAOImpl implements NoteComDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public void create(NoteVO noteVo) throws Exception {
		session.insert("notecom.create", noteVo);
		
	}

	@Override
	public List<NoteVO> list(SearchCriteria cri, String note_receiver) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("note_receiver", note_receiver);
		map.put("cri", cri);
		return session.selectList("notecom.list", map, bounds);
	}

	@Override
	public NoteVO read(int note_id) throws Exception {
		return session.selectOne("notecom.read", note_id);
	}

	@Override
	public void delete(int note_id) throws Exception {
		session.delete("notecom.delete",note_id);
		
	}

	@Override
	public List<NoteVO> listSearch(SearchCriteria cri, String note_receiver) throws Exception {
	   RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
	   Map<String , Object> map = new HashMap<>();
	    map.put("note_receiver", note_receiver);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		
		return session.selectList("notecom.listSearch", map, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, String note_receiver) throws Exception {
	    Map<String , Object> map = new HashMap<>();
	    map.put("note_receiver", note_receiver);
	    map.put("cri", cri);
	    
		return session.selectOne("notecom.listSearchCount", map);
	}

	@Override
	public int statusCount(String note_receiver) throws Exception {
		
		return session.selectOne("notecom.statusCount",note_receiver);
	}

}
