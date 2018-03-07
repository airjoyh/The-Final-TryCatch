package kr.co.trycatch.persistence.company;

import javax.inject.Inject;

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
	public Contest_quizVO select(int quiz_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
