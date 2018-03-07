package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;


public interface CommunityDAO {

	//추가
	public void create(CommunityVO communityVo) throws Exception;
	
	//조회
	public List<CommunityVO> listAll() throws Exception;

	// (특정게시물 한개)조회 ---> 사용: 수정폼
	public CommunityVO read(int community_no) throws Exception;//

	// (페이지)조회 ---> 사용: 리스트
    public List<CommunityVO> listPage(int page) throws Exception;
	
	// (페이지)조회 ---> 사용: 리스트
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;//
	
	
}
