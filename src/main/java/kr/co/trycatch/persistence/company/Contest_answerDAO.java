package kr.co.trycatch.persistence.company;

import java.util.List;

import kr.co.trycatch.domain.user.Contest_answerVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface  Contest_answerDAO {

	public void create(Contest_answerVO contest_answerVo) throws Exception;
	
	public int marking(int quiz_id, String user_id) throws Exception;
	
	public void updateScore(Contest_answerVO contest_answerVo) throws Exception;
	
	public int selectScoreSum(String user_id, int contest_id) throws Exception;
	
	public List<Contest_answerVO> selectScoreRankList(SearchCriteria cri, int contest_id) throws Exception;
	
	public int selectScoreRankListCount(SearchCriteria cri, int contest_id) throws Exception;
}
