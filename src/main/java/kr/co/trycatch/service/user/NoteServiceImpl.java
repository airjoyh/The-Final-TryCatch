package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.user.NoteDAO;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Inject
	private NoteDAO noteDao;

	@Override
	public void regist(NoteVO noteVo) throws Exception {
		noteDao.create(noteVo);
		
	}

	@Override
	public List<NoteVO> list(SearchCriteria cri, String note_receiver) throws Exception {
		
		return noteDao.list(cri, note_receiver);
	}

	@Transactional
	@Override
	public NoteVO read(int note_id, NoteVO noteVo) throws Exception {
		noteDao.update(noteVo);
		
		return noteDao.read(note_id);
	}

	@Override
	public void remove(int note_id) throws Exception {
		noteDao.delete(note_id);
		
	}

	@Override
	public List<NoteVO> listSearchCriteria(SearchCriteria cri, String note_receiver) throws Exception {

		return noteDao.listSearch(cri, note_receiver);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, String note_receiver) throws Exception {
		
		return noteDao.listSearchCount(cri, note_receiver);
	}

	@Override
	public int statusCount (String note_receiver) throws Exception {
		//noteDao.update(noteVo);
		
		return noteDao.statusCount(note_receiver);
	}

	/*@Override
	public void update(NoteVO noteVo) throws Exception {
		noteDao.update(noteVo);
		
	}*/

	
}
