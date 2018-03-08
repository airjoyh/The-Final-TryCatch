package kr.co.trycatch.persistence.company;

import java.util.List;

import kr.co.trycatch.domain.company.ContestVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface ContestDAO {

	public void create(ContestVO contestVo) throws Exception;

	public void update(ContestVO contestVo) throws Exception;

	public void delete(int contest_id) throws Exception;

	public ContestVO select(int contest_id) throws Exception;

	//
	public int selectContest_id() throws Exception;
	
	public List<ContestVO> selectByCompany(SearchCriteria cri, int company_id) throws Exception;
	
	public int listSearchCount(SearchCriteria cri, int company_id) throws Exception;
	
	public void updateStatus(int contest_id) throws Exception;

}
