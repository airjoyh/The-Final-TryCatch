package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.user.PortfolioVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface PortfolioService {

	public void regist(PortfolioVO portfolioVo) throws Exception;
	
	public void modify(PortfolioVO portfolioVo) throws Exception;
	
	public List<PortfolioVO> list(SearchCriteria cri, String user_id) throws Exception;
	
	public PortfolioVO read(int port_id) throws Exception;
}
