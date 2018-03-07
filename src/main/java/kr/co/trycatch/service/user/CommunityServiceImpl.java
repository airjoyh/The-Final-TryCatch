package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;
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
		return communityDao.read(community_no);
	}

	@Override
	public List<CommunityVO> listAll() throws Exception {
		
		return communityDao.listAll();
	}
	
	@Override
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception {
	
		return communityDao.listCriteria(cri);
	}
}
