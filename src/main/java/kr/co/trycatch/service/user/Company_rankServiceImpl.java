package kr.co.trycatch.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.user.Company_rankDAO;

@Service
public class Company_rankServiceImpl implements Company_rankService{

	@Inject
	private Company_rankDAO company_rankDao;
	
	@Override
	public Map<String, Object> showRankAll() throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("totalRank", company_rankDao.totalRank());
		map.put("possibilityRank", company_rankDao.possibilityRank());
		map.put("welSalRank", company_rankDao.welSalRank());
		map.put("balanceRank", company_rankDao.balanceRank());
		map.put("cultureRank", company_rankDao.cultureRank());
		map.put("managerRank", company_rankDao.managerRank());
		
		
		return map;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return company_rankDao.listSearchCount(cri);
	}

	@Override
	public List<AvgScoreVO> totalList(SearchCriteria cri) throws Exception {
		
		return company_rankDao.totalList(cri);
	}

	@Override
	public List<AvgScoreVO> possibilityList(SearchCriteria cri) throws Exception {
		
		return company_rankDao.possibilityList(cri);
	}

	@Override
	public List<AvgScoreVO> welSalList(SearchCriteria cri) throws Exception {
		
		return company_rankDao.welSalList(cri);
	}

	@Override
	public List<AvgScoreVO> balanceList(SearchCriteria cri) throws Exception {
		
		return company_rankDao.balanceList(cri);
	}

	@Override
	public List<AvgScoreVO> cultureList(SearchCriteria cri) throws Exception {
		
		return company_rankDao.cultureList(cri);
	}

	@Override
	public List<AvgScoreVO> managerList(SearchCriteria cri) throws Exception {
		
		return company_rankDao.managerList(cri);
	}

}
