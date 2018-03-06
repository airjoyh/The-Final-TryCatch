package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.ReviewVO;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface ReviewService {

	public void regist(ReviewVO reviewVo) throws Exception;
	
	public List<ReviewVO> list(SearchCriteria cri, String company_id) throws Exception;
	
	public List<ReviewVO> listSerachCriteria(SearchCriteria cri, String company_id) throws Exception;
	
	public int listSearchCount(SearchCriteria cri, String company_id) throws Exception;
	
	public ReviewVO read(int review_no) throws Exception;
	
	public void modify(ReviewVO reviewVo) throws Exception;
	
	public void remove(int review_no) throws Exception;
	
	public AvgScoreVO avgScore(String company_id) throws Exception;
	
	public double totalAvgScore(String company_id) throws Exception;
	
	public Company_infoVO companyInfo(String company_id) throws Exception;
}
