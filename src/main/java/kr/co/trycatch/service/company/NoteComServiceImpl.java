package kr.co.trycatch.service.company;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.company.NoteComDAO;
import kr.co.trycatch.persistence.user.NoteDAO;

@Service
public class NoteComServiceImpl implements NoteComService{
	@Inject
	private NoteComDAO notecomDao;

	@Override
	public void regist(NoteVO noteVo) throws Exception {
		notecomDao.create(noteVo);
		
	}

	@Override
	public List<NoteVO> list(SearchCriteria cri, String note_receiver) throws Exception {
		
		return notecomDao.list(cri, note_receiver);
	}

	@Override
	public NoteVO read(int note_id, NoteVO noteVo) throws Exception {
	    notecomDao.update(noteVo);
		
		return notecomDao.read(note_id);
	}

	@Override
	public void remove(int note_id) throws Exception {
		notecomDao.delete(note_id);
		
	}

	@Override
	public List<NoteVO> listSearchCriteria(SearchCriteria cri, String note_receiver) throws Exception {

		return notecomDao.listSearch(cri, note_receiver);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, String note_receiver) throws Exception {
		
		return notecomDao.listSearchCount(cri, note_receiver);
	}

	@Override
	public int statusCount(String note_receiver) throws Exception {
		
		return notecomDao.statusCount(note_receiver);
	}
}
