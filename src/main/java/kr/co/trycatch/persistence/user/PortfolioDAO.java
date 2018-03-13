package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.PortfolioVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface PortfolioDAO {

	public void create(PortfolioVO portfolioVo) throws Exception;
	
	public void update(PortfolioVO portfolioVo) throws Exception;
	
	public List<PortfolioVO> list(SearchCriteria cri, String user_id) throws Exception;

	public PortfolioVO read(int port_id) throws Exception;
}
