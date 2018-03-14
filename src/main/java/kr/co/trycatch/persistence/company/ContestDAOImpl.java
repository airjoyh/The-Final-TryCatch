package kr.co.trycatch.persistence.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.company.ContestVO;
import kr.co.trycatch.domain.user.SearchCriteria;

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

	//���׽�Ʈ �ϳ��� ������������.
	@Override
	public ContestVO select(int contest_id) throws Exception {		
		return session.selectOne("contest.select",contest_id);
	}

	@Override
	public int selectContest_id() throws Exception {		
		return session.selectOne("contest.selectContest_id");
	}

	@Override
	public List<ContestVO> selectByCompany(SearchCriteria cri, int company_id) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("company_id", company_id);
		//map.put("cri", cri);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		
		return session.selectList("contest.selectByCompany", map, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, int company_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("company_id", company_id);
		map.put("cri", cri);
		
		return session.selectOne("contest.listSearchCount", map);
	}

	//��� ���� Y�� ������ֱ�
	@Override
	public void updateStatus(int contest_id) throws Exception {
		session.update("contest.updateStatus", contest_id);
		
	}

	@Override
	public String selectStatus(int contest_id) throws Exception {
		
		return session.selectOne("contest.selectStatus", contest_id);
	}
	
	//�����ڿ��� ���� ���� ��ϵ� ���׽�Ʈ ������
	@Override
	public List<ContestVO> selectAll(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("contest.selectAll", cri, bounds);
	}

	@Override
	public int selectAllCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne("contest.selectAllCount", cri);
	}


}
