package kr.co.trycatch.service.user;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.user.CommunityDAO;


@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	private CommunityDAO communityDao;
	
	
	@Override
	public void regist(CommunityVO vo) throws Exception {
       communityDao.create(vo);

	}


	@Override
	public CommunityVO read(int community_no) throws Exception {
		communityDao.updateViewCount(community_no);
		
		return communityDao.read(community_no);
	}

	@Override
	public List<CommunityVO> listAll(SearchCriteria cri) throws Exception {
		
		return communityDao.listAll(cri);
	}

	@Override
	public List<CommunityVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return communityDao.listSearch(cri);
	}


	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return communityDao.listSearchCount(cri);
	}

/*
	@Override
	public Map<String, Object> listFinal(SearchCriteria cri) throws Exception{
		return communityDao.listFinal(cri);
	}
*/

	@Override
	public void modify(CommunityVO communityVo) throws Exception {
       communityDao.update(communityVo);
       
      // int community_no = communityVo.getCommunity_no();
       
	}


	@Override
	public void remove(int community_no) throws Exception {
	   communityDao.delete(community_no);	
	}


}
