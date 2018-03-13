package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.PortfolioVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.user.PortfolioDAO;

@Service
public class PortfolioServiceImpl implements PortfolioService{

	@Inject
	private PortfolioDAO portfolioDao;

	@Override
	public void regist(PortfolioVO portfolioVo) throws Exception {
		portfolioDao.create(portfolioVo);
		
	}

	@Override
	public void modify(PortfolioVO portfolioVo) throws Exception {
		portfolioDao.update(portfolioVo);
		
	}

	@Override
	public PortfolioVO read(int port_id) throws Exception {
		
		return portfolioDao.read(port_id);
	}

	@Override
	public List<PortfolioVO> list(SearchCriteria cri, String user_id) throws Exception {
	
		return portfolioDao.list(cri, user_id);
	}
	
	
}
