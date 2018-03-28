package kr.co.trycatch.persistence.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;

@Repository
public class Contest_quizDAOImpl implements Contest_quizDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void create(Contest_quizVO contest_quizVo) throws Exception {
		System.out.println("DAO >>> "+contest_quizVo);
		session.insert("contest_quiz.create", contest_quizVo);

	}
	
	@Override
	public void exampleCreate(ExampleVO exampleVo) throws Exception {
		System.out.println("DAO >>> "+exampleVo);
		session.insert("contest_quiz.exampleCreate", exampleVo);		
	}

	@Override
	public void update(Contest_quizVO contest_quizVo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int quiz_id) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int selectQuiz_id(int contest_id, int quiz_no) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("contest_id", contest_id);
		map.put("quiz_no", quiz_no);
		
		return session.selectOne("contest_quiz.selectQuiz_id", map);
	}
	
	@Override
	public Contest_quizVO selectQuiz(int contest_id, int quiz_no) throws Exception {
		RowBounds bounds = new RowBounds(quiz_no-1, 1);
		List<Contest_quizVO> list = session.selectList("contest_quiz.selectQuiz", contest_id, bounds);
		System.out.println("list>>>"+list);
		System.out.println("list.size()>>>"+ list.size());
		if(list.size()==0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<ExampleVO> selectExample(int quiz_id) throws Exception {
		
		return session.selectList("contest_quiz.selectExample", quiz_id);
	}
	
	@Override
	public int selectQuiz_seq() throws Exception {
		return session.selectOne("contest_quiz.selectQuiz_seq");
	}

	@Override
	public int quizCount(int contest_id) throws Exception {
		
		return session.selectOne("contest_quiz.quizCount", contest_id);
	}

}
