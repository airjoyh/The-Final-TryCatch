package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.ReviewVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.user.MemberDAO;
import kr.co.trycatch.persistence.user.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Inject
	private ReviewDAO reviewDao;
	
	@Inject
	private MemberDAO memberDao;
	
	@Override
	public void regist(ReviewVO reviewVo) throws Exception {
		reviewDao.create(reviewVo);
		
	}

	@Override
	public List<ReviewVO> list(SearchCriteria cri, String company_id) throws Exception {
		
		return reviewDao.list(cri, company_id);
	}

	@Override
	public List<ReviewVO> listSerachCriteria(SearchCriteria cri, String company_id) throws Exception {
		System.out.println("company_id >>> "+company_id);
		return reviewDao.listSearch(cri, company_id);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, String company_id) throws Exception {
		
		return reviewDao.listSearchCount(cri, company_id);
	}

	@Transactional
	@Override
	public ReviewVO read(int review_no) throws Exception {
		reviewDao.updateViewCount(review_no);
		
		return reviewDao.read(review_no);
	}

	@Override
	public void modify(ReviewVO reviewVo) throws Exception {
		reviewDao.update(reviewVo);
		
	}

	@Override
	public void remove(int review_no) throws Exception {
		reviewDao.delete(review_no);
		
	}

	@Override
	public AvgScoreVO avgScore(String company_id) throws Exception {
		
		return reviewDao.avgScore(company_id);
	}

	@Override
	public double totalAvgScore(String company_id) throws Exception {
		
		return reviewDao.totalAvgScore(company_id);
	}

	@Override
	public Company_infoVO companyInfo(String company_id) throws Exception {
		
		return memberDao.companyInfo(company_id);
	}
	
	
}
