package kr.co.trycatch.service.company;

import java.util.List;

import kr.co.trycatch.domain.company.ContestVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface ContestService {

	public void register(ContestVO contestVo) throws Exception;

	public void modify(ContestVO contestVo) throws Exception;

	public void remove(int contest_id) throws Exception;

	public ContestVO select(int contest_id) throws Exception;

	//
	public int selectContest_id() throws Exception;
	
	public List<ContestVO> selectByCompany(SearchCriteria cri, int company_id) throws Exception;
	
	public int listSearchCount(SearchCriteria cri, int company_id) throws Exception;
	
	//최종 등록
	public void finalRegister(int contest_id) throws Exception;
}
