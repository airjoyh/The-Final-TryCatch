package kr.co.trycatch.service.company;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.company.ContestVO;
import kr.co.trycatch.persistence.company.ContestDAO;

@Service
public class ContestServiceImpl implements ContestService {

	@Inject
	private ContestDAO contestDao;
	
	@Override
	public void register(ContestVO contestVo) throws Exception {
		contestDao.create(contestVo);
	}

	@Override
	public void modify(ContestVO contestVo) throws Exception {
		contestDao.update(contestVo);
	}

	@Override
	public void remove(int contest_id) throws Exception {
		contestDao.delete(contest_id);
		
	}

	@Override
	public ContestVO select(int contest_id) throws Exception {
		
		return contestDao.select(contest_id);
	}

	@Override
	public int selectContest_id() throws Exception {
		
		return contestDao.selectContest_id();
	}

}
