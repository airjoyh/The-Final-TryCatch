package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.ReviewVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface ReviewDAO {
	
	public void create(ReviewVO reviewVo) throws Exception;
	
	public List<ReviewVO> list(SearchCriteria cri, String company_id) throws Exception;
	
	public List<ReviewVO> listSearch(SearchCriteria cri, String company_id) throws Exception;
	
	public int listSearchCount(SearchCriteria cri, String company_id) throws Exception;
	
	public ReviewVO read(int review_no) throws Exception;
	
	public void update(ReviewVO reviewVo) throws Exception;
	
	public void delete(int review_no) throws Exception;
	
	public void updateReplyCount(int review_no, int amount) throws Exception;
	
	public void updateViewCount(int review_no) throws Exception;
	
	public AvgScoreVO avgScore(String company_id) throws Exception;
	
	public double totalAvgScore(String company_id) throws Exception;
}
