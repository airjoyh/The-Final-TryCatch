package kr.co.trycatch.service.company;

import java.util.List;

import kr.co.trycatch.domain.user.Contest_answerVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface Contest_answerService {
	
	public void register(Contest_answerVO contest_answerVo) throws Exception;
	
	public int scoreSum(String user_id, int contest_id) throws Exception;
	
	public List<Contest_answerVO> scoreRankList(SearchCriteria cri, int contest_id) throws Exception;
	
	public int ScoreRankListCount(SearchCriteria cri, int contest_id) throws Exception;
	
	public int solveCount(String user_id, int contest_id) throws Exception;

	public int startDateCount(int contest_id) throws Exception;

	public int endDateCount(int contest_id) throws Exception;
}
