package kr.co.trycatch.persistence.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.SearchCriteria;

@Repository
public class Company_rankDAOImpl implements Company_rankDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<AvgScoreVO> totalRank() throws Exception {
		
		return session.selectList("company_rank.totalRank");
	}

	@Override
	public List<AvgScoreVO> possibilityRank() throws Exception {

		return session.selectList("company_rank.possibilityRank");
	}

	@Override
	public List<AvgScoreVO> welSalRank() throws Exception {
		
		return session.selectList("company_rank.welSalRank");
	}

	@Override
	public List<AvgScoreVO> balanceRank() throws Exception {
		
		return session.selectList("company_rank.balanceRank");
	}

	@Override
	public List<AvgScoreVO> cultureRank() throws Exception {
		
		return session.selectList("company_rank.cultureRank");
	}

	@Override
	public List<AvgScoreVO> managerRank() throws Exception {

		return session.selectList("company_rank.managerRank");
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne("company_rank.listSearchCount", cri);
	}
	
	@Override
	public List<AvgScoreVO> totalList(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("company_rank.totalList", cri, bounds);
	}

	@Override
	public List<AvgScoreVO> possibilityList(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("company_rank.possibilityList", cri, bounds);
	}

	@Override
	public List<AvgScoreVO> welSalList(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("company_rank.welSalList", cri, bounds);
	}

	@Override
	public List<AvgScoreVO> balanceList(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("company_rank.balanceList", cri, bounds);
	}

	@Override
	public List<AvgScoreVO> cultureList(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("company_rank.cultureList", cri, bounds);
	}

	@Override
	public List<AvgScoreVO> managerList(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("company_rank.managerList", cri, bounds);
	}


}
