package kr.co.trycatch.persistence.company;

import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;

public interface Contest_quizDAO {

	public void create(Contest_quizVO contest_quizVo) throws Exception;

	public void exampleCreate(ExampleVO exampleVo) throws Exception;
	
	public void update(Contest_quizVO contest_quizVo) throws Exception;

	public void delete(int quiz_id) throws Exception;

	public Contest_quizVO select(int quiz_id) throws Exception;

}
