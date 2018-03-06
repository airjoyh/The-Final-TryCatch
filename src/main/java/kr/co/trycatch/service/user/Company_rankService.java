package kr.co.trycatch.service.user;

import java.util.List;
import java.util.Map;

import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface Company_rankService {

	public Map<String, Object> showRankAll() throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<AvgScoreVO> totalList(SearchCriteria cri) throws Exception;

	public List<AvgScoreVO> possibilityList(SearchCriteria cri) throws Exception;

	public List<AvgScoreVO> welSalList(SearchCriteria cri) throws Exception;

	public List<AvgScoreVO> balanceList(SearchCriteria cri) throws Exception;

	public List<AvgScoreVO> cultureList(SearchCriteria cri) throws Exception;

	public List<AvgScoreVO> managerList(SearchCriteria cri) throws Exception;
}
