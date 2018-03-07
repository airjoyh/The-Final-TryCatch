package kr.co.trycatch.persistence.company;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.company.ContestVO;

@Repository
public class ContestDAOImpl implements ContestDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void create(ContestVO contestVo) throws Exception {
		session.insert("contest.create", contestVo);
		
	}

	@Override
	public void update(ContestVO contestVo) throws Exception {
		session.update("contest.update", contestVo);
	}

	@Override
	public void delete(int contest_id) throws Exception {
		session.delete("contest.delete", contest_id);
	}

	@Override
	public ContestVO select(int contest_id) throws Exception {		
		return session.selectOne("contest.select",contest_id);
	}

	@Override
	public int selectContest_id() throws Exception {		
		return session.selectOne("contest.selectContest_id");
	}

}
