package kr.co.trycatch.persistence.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.SearchCriteria;


@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void create(CommunityVO communityVo) throws Exception {
       int t = session.insert("community.create", communityVo);
       System.out.println("insert 행의 수 ="+ t);
	}


	@Override
	public CommunityVO read(int community_no) throws Exception{
		
		return session.selectOne("community.read", community_no);
	}

	@Override
	public List<CommunityVO> listAll(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		
		return session.selectList("community.selectAll", cri , bounds);
		
	}

	@Override
	public List<CommunityVO> listSearch(SearchCriteria cri) throws Exception {
        RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
        
        return session.selectList("community.listSearch",map,bounds);
	}

    @Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne("community.listSearchCount", cri);
	}

/*
	@Override
	public Map<String, Object> listFinal(SearchCriteria cri) throws Exception {
		Map<String, Object> listMap = new HashMap<>();
		List<CommunityVO> list = null;
		//List<Integer> replyCount_list = new ArrayList<>();
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		list = session.selectList("community.listSearch", cri, bounds);
        
		//for (int i = 0; i < list.size(); i++) {
			//replyCount_list.add((Integer) session.selectOne("reply.count", list.get(i).getCommunity_no()));
		//}
        
		listMap.put("list", list);
		//listMap.put("replyCount_list", replyCount_list);

		return listMap;
	}
*/

    @Override
	public void update(CommunityVO communityVo) throws Exception {
		int t = session.update("community.update", communityVo);
		System.out.println("update 행의 수="+ t);
	}

	@Override
	public void delete(int community_no) throws Exception {
	    session.delete("community.delete", community_no);	
	}


	@Override
	public void updateReplyCount(int community_no, int i) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("community_no", community_no);
		map.put("i", i);
		
		session.update("community.updateReplyCount", map);
		
	}


	@Override
	public void updateViewCount(int community_no) throws Exception {
		
		session.update("community.updateViewCount", community_no);
		
	}
	

}
