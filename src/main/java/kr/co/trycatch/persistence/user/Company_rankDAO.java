package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface Company_rankDAO {
	public List<AvgScoreVO> totalRank() throws Exception;
	
	public List<AvgScoreVO> possibilityRank() throws Exception;
	
	public List<AvgScoreVO> welSalRank() throws Exception;
	
	public List<AvgScoreVO> balanceRank() throws Exception;
	
	public List<AvgScoreVO> cultureRank() throws Exception;
	
	public List<AvgScoreVO> managerRank() throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<AvgScoreVO> totalList(SearchCriteria cri) throws Exception;

	public List<AvgScoreVO> possibilityList(SearchCriteria cri) throws Exception;
	
	public List<AvgScoreVO> welSalList(SearchCriteria cri) throws Exception;
	
	public List<AvgScoreVO> balanceList(SearchCriteria cri) throws Exception;
	
	public List<AvgScoreVO> cultureList(SearchCriteria cri) throws Exception;
	
	public List<AvgScoreVO> managerList(SearchCriteria cri) throws Exception;
}
