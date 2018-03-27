package kr.co.trycatch.persistence.user;

import java.util.List;
import java.util.Map;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Contest_qnaVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.SearchCriteria;


public interface CommunityDAO {

	// 추가
	public void create(CommunityVO communityVo) throws Exception;
	
	// 수정
	public void update(CommunityVO communityVo) throws Exception;
	
	// (특정 게시물 한개) 삭제
	public void delete(int community_no) throws Exception;
	
	// (특정게시물 한개)조회 ---> 사용: 수정폼
	public CommunityVO read(int community_no) throws Exception;//

	// (전체게시물)조회 ----> 사용: 리스트
	public List<CommunityVO> listAll(SearchCriteria cri) throws Exception;

	// 검색어에 대한 (페이지)조회: 한별
	public List<CommunityVO> listSearch(SearchCriteria cri) throws Exception;
	
	// 검색어에 대한 (페이지)조회된 전체 레코드 수: 한별
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCount(int community_no, int i) throws Exception;

	public void updateViewCount(int community_no) throws Exception;
	
		
		
		
		
		
		
	
	
}
