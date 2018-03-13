package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.Contest_qnaVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface Contest_qnaDAO {

public void create(Contest_qnaVO contest_qnaVo) throws Exception;
	
	public List<Contest_qnaVO> list(SearchCriteria cri, String contest_id) throws Exception;
	
	public List<Contest_qnaVO> listSearch(SearchCriteria cri, String contest_id) throws Exception;
	
	public int listSearchCount(SearchCriteria cri, String contest_id) throws Exception;
	
	public Contest_qnaVO read(int qna_no) throws Exception;
	
	public void update(Contest_qnaVO contest_qnaVo) throws Exception;
	
	public void delete(int qna_no) throws Exception;
	
	public void updateReplyCount(int qna_no, int amount) throws Exception;
	
	public void updateViewCount(int qna_no) throws Exception;
}
