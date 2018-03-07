package kr.co.trycatch.persistence.company;

import kr.co.trycatch.domain.company.ContestVO;

public interface ContestDAO {

	public void create(ContestVO contestVo) throws Exception;

	public void update(ContestVO contestVo) throws Exception;

	public void delete(int contest_id) throws Exception;

	public ContestVO select(int contest_id) throws Exception;

	//
	public int selectContest_id() throws Exception;

}
