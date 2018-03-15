package kr.co.trycatch.service.user;


import java.util.List;
import java.util.Map;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface CommunityService {

	public void regist(CommunityVO communityVo) throws Exception;// 글 추가

	public void modify(CommunityVO communityVo) throws Exception;// 글 수정
	
	public void remove(int community_no) throws Exception;// 글 삭제
	
	public CommunityVO read(int community_no) throws Exception;//글 한개 조회

	public List<CommunityVO> listAll() throws Exception;//전체글 조회
    
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;//특정 페이지 조회
	
	public List<CommunityVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	// 검색어 일치하는 글들을 조회
	
	public int listSearchCount(SearchCriteria cri)throws Exception;// 검색어 일치하는 레코드 전체 수
    
	//public Map<String, Object> listFinal(SearchCriteria cri) throws Exception;
	
	

	
	
}
