package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface NoteDAO {

	public void create(NoteVO noteVo) throws Exception;
	
	public List<NoteVO> list(SearchCriteria cri, String note_receiver) throws Exception;
	
	public List<NoteVO> listSearch(SearchCriteria cri, String note_receiver) throws Exception;
	
	public int listSearchCount(SearchCriteria cri, String note_receiver) throws Exception;
	
	public NoteVO read(int note_id) throws Exception;
	
	public void delete(int note_id) throws Exception;
}
