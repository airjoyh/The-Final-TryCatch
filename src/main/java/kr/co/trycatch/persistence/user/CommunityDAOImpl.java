package kr.co.trycatch.persistence.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;


@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void create(CommunityVO communityVo) throws Exception {
       int t = session.insert("community.create", communityVo);
       System.out.println("insert ÇàÀÇ ¼ö ="+ t);
	}


	@Override
	public CommunityVO read(int community_no) throws Exception{
		
		return session.selectOne("community.read", community_no);
	}

	@Override
	public List<CommunityVO> listAll() throws Exception {
		return session.selectList("community.selectAll");
		
	}

	@Override
	public List<CommunityVO> listPage(int page) throws Exception {
		
		int skip = (page - 1) * 10;
		
		int limit = 10;
		
		RowBounds bounds = new RowBounds(skip, limit);
		
		return session.selectList("community.listAll", null, bounds);
	}

	@Override
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception{
		
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		
		return session.selectList("community.listAll", null, bounds);
	}

}
