package kr.co.trycatch.service.company;

import kr.co.trycatch.domain.company.ContestVO;

public interface ContestService {

	public void register(ContestVO contestVo) throws Exception;

	public void modify(ContestVO contestVo) throws Exception;

	public void remove(int contest_id) throws Exception;

	public ContestVO select(int contest_id) throws Exception;

	//
	public int selectContest_id() throws Exception;
}
