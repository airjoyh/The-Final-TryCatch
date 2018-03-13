package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.user.Contest_qnaVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface Contest_qnaService {

	public void regist(Contest_qnaVO contest_qnaVo) throws Exception;
	
	public List<Contest_qnaVO> list(SearchCriteria cri, String contest_id) throws Exception;
	
	public List<Contest_qnaVO> listSerachCriteria(SearchCriteria cri, String contest_id) throws Exception;
	
	public int listSearchCount(SearchCriteria cri, String contest_id) throws Exception;
	
	public Contest_qnaVO read(int qna_no) throws Exception;
	
	public void modify(Contest_qnaVO contest_qnaVo) throws Exception;
	
	public void remove(int qna_no) throws Exception;
}
