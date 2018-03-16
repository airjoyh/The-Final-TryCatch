package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface NoteService {
	
	public void regist(NoteVO noteVo) throws Exception;

	public List<NoteVO> list(SearchCriteria cri, String note_receiver) throws Exception;
	
	public NoteVO read(int note_id, NoteVO noteVo) throws Exception;
	
	public void remove(int note_id) throws Exception;
	
	public List<NoteVO> listSearchCriteria(SearchCriteria cri, String note_receiver) throws Exception;

    public int listSearchCount(SearchCriteria cri, String note_receiver)throws Exception;
    
    public int statusCount(String note_receiver) throws Exception;
    
    //public void update(NoteVO noteVo) throws Exception;
}
