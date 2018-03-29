package kr.co.trycatch.persistence.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.print.DocFlavor.STRING;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.Contest_answerVO;
import kr.co.trycatch.domain.user.SearchCriteria;

@Repository
public class Contest_answerDAOImpl implements Contest_answerDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void create(Contest_answerVO contest_answerVo) throws Exception {
		session.insert("contest_answer.create", contest_answerVo);

	}

	@Override
	public int marking(int quiz_id, String user_id) throws Exception {
		System.out.println("quiz_id="+quiz_id+", user_id="+user_id);
		Map<String, Object> map = new HashMap<>();
		map.put("quiz_id", quiz_id);
		map.put("user_id", user_id);
		System.out.println(map.get("quiz_id")+", "+map.get("user_id"));
		Integer score = session.selectOne("contest_answer.marking", map);//중요중요!!
		
		if(score == null) {
			return 0;
		}
		return score;
	}

	@Override
	public void updateScore(Contest_answerVO contest_answerVo) throws Exception {
		session.update("contest_answer.updateScore", contest_answerVo);
		
	}

	@Override
	public int selectScoreSum(String user_id, int contest_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("contest_id", contest_id);
	
		return session.selectOne("contest_answer.selectScoreSum", map);
	}

	@Override
	public List<Contest_answerVO> selectScoreRankList(SearchCriteria cri, int contest_id) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		Map<String, Object> map = new HashMap<>();
		map.put("contest_id", contest_id);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		
		return session.selectList("contest_answer.selectScoreRankList", map, bounds);
	}

	@Override
	public int selectScoreRankListCount(SearchCriteria cri, int contest_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("contest_id", contest_id);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());

		return session.selectOne("contest_answer.selectScoreRankListCount", map);
	}

	@Override
	public int solveCount(String user_id, int contest_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("contest_id", contest_id);
		
		return session.selectOne("contest_answer.solveCount", map);
	}

}
