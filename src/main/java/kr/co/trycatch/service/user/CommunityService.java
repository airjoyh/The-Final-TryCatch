package kr.co.trycatch.service.user;


import java.util.List;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;


public interface CommunityService {

	public void regist(CommunityVO communityVo) throws Exception;// 글추가

	public CommunityVO read(int community_no) throws Exception;//글 한개 조회

	public List<CommunityVO> listAll() throws Exception;//전체글 조회

	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;//특정 페이지 조회

	
	
}
