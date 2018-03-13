package kr.co.trycatch.persistence.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.PortfolioVO;
import kr.co.trycatch.domain.user.SearchCriteria;

@Repository
public class PortfolioDAOImpl implements PortfolioDAO{

	@Inject
	private SqlSession session;

	@Override
	public void create(PortfolioVO portfolioVo) throws Exception {
		session.insert("portfolio.create", portfolioVo);
		
	}

	@Override
	public void update(PortfolioVO portfolioVo) throws Exception {
		session.update("portfolio.update", portfolioVo);
		
	}

	@Override
	public PortfolioVO read(int port_id) throws Exception {
		
		return session.selectOne("portfolio.read", port_id);
	}

	@Override
	public List<PortfolioVO> list(SearchCriteria cri, String user_id) throws Exception {
	RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
	Map<String , Object> map = new HashMap<>();
	map.put("user_id", user_id);
	map.put("cri", cri);
	
	return session.selectList("portfolio.list", map, bounds);
	}
	
}
