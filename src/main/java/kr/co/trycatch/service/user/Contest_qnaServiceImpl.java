package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.Contest_qnaVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.user.Contest_qnaDAO;

@Service
public class Contest_qnaServiceImpl implements Contest_qnaService{

	@Inject
	private Contest_qnaDAO contest_qnaDao;

	@Override
	public void regist(Contest_qnaVO contest_qnaVo) throws Exception {
		contest_qnaDao.create(contest_qnaVo);
		
	}

	@Override
	public List<Contest_qnaVO> list(SearchCriteria cri, String contest_id) throws Exception {
		
		return contest_qnaDao.list(cri, contest_id);
	}

	@Override
	public List<Contest_qnaVO> listSerachCriteria(SearchCriteria cri, String contest_id) throws Exception {
		
		return contest_qnaDao.listSearch(cri, contest_id);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, String contest_id) throws Exception {
		
		return contest_qnaDao.listSearchCount(cri, contest_id);
	}

	@Override
	public Contest_qnaVO read(int qna_no) throws Exception {
        contest_qnaDao.updateViewCount(qna_no);
		
		return contest_qnaDao.read(qna_no);
	}

	@Override
	public void modify(Contest_qnaVO contest_qnaVo) throws Exception {
	
		contest_qnaDao.update(contest_qnaVo);
	}

	@Override
	public void remove(int qna_no) throws Exception {
	
		contest_qnaDao.delete(qna_no);
	}
}
