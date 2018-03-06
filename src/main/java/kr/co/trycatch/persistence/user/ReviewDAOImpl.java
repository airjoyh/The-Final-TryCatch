package kr.co.trycatch.persistence.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.AvgScoreVO;
import kr.co.trycatch.domain.user.ReviewVO;
import kr.co.trycatch.domain.user.SearchCriteria;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void create(ReviewVO reviewVo) throws Exception {
		int t = session.insert("review.create", reviewVo);
		System.out.println("등록된 후기글 수: "+t);

	}

	@Override
	public List<ReviewVO> list(SearchCriteria cri, String company_id) throws Exception {
		List<ReviewVO> list = null;
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("company_id", company_id);
		map.put("cri", cri);
		
		list = session.selectList("review.list", map, bounds);
		
		return list;
	}

	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri, String company_id) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("company_id", company_id);
		map.put("cri", cri);
		
		return session.selectList("review.listSearch", map, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri, String company_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("company_id", company_id);
		map.put("cri", cri);
		
		return session.selectOne("review.listSearchCount", map);
	}

	@Override
	public ReviewVO read(int review_no) throws Exception {
		
		return session.selectOne("review.read",review_no);
	}

	@Override
	public void update(ReviewVO reviewVo) throws Exception {
		int t = session.update("review.update", reviewVo);
		System.out.println("바뀐 후기 게시글 수:"+t);
		
	}

	@Override
	public void delete(int review_no) throws Exception {
		session.delete("review.delete", review_no);
		
	}

	@Override
	public void updateReplyCount(int review_no, int amount) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("review_no", review_no);
		map.put("amount", amount);
		
		session.update("review.updateReplyCount", map);
		
	}

	@Override
	public void updateViewCount(int review_no) throws Exception {
		session.update("review.updateViewCount", review_no);
		
	}

	@Override
	public AvgScoreVO avgScore(String company_id) throws Exception {
		
		return session.selectOne("review.avgScore", company_id);
	}

	@Override
	public double totalAvgScore(String company_id) throws Exception {
		
		return session.selectOne("review.totalAvgScore", company_id);
	}

}
