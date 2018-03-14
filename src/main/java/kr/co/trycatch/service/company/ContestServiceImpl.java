package kr.co.trycatch.service.company;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.company.ContestVO;
import kr.co.trycatch.domain.user.SearchCriteria;
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

	//콘테스트 하나의 정보가져오기.
	@Override
	public ContestVO read(int contest_id) throws Exception {
		
		return contestDao.select(contest_id);
	}

	@Override
	public int selectContest_id() throws Exception {
		
		return contestDao.selectContest_id();
	}

	@Override
	public List<ContestVO> selectByCompany(SearchCriteria cri, int company_id) throws Exception {
		
		return contestDao.selectByCompany(cri, company_id);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, int company_id) throws Exception {
		
		return contestDao.listSearchCount(cri, company_id);
	}

	@Override
	public String finalRegister(int contest_id) throws Exception {
		String state = "";
		if(contestDao.selectStatus(contest_id).equals("Y")) {
			state = "alreadyRegister";
		}else if(contestDao.selectStatus(contest_id).equals("N")) {
			contestDao.updateStatus(contest_id);
			state = "finalRegister";
		}
		
		return state;
	}

	@Override
	public List<ContestVO> selectAll(SearchCriteria cri) throws Exception {
	 
		return contestDao.selectAll(cri);
	}

	@Override
	public int selectAllCount(SearchCriteria cri) throws Exception {
		
		return contestDao.selectAllCount(cri);
	}

}
