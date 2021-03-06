package kr.co.trycatch.persistence.company;

import java.util.List;

import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;

public interface Contest_quizDAO {

	public void create(Contest_quizVO contest_quizVo) throws Exception;

	public void exampleCreate(ExampleVO exampleVo) throws Exception;
	
	public void update(Contest_quizVO contest_quizVo) throws Exception;

	public void delete(int quiz_id) throws Exception;
	
	public int selectQuiz_id(int contest_id, int quiz_no) throws Exception;

	public Contest_quizVO selectQuiz(int contest_id, int quiz_no) throws Exception;
	
	public List<ExampleVO> selectExample(int quiz_id) throws Exception; 
	
	public int selectQuiz_seq() throws Exception;
	
	public int quizCount(int contest_id) throws Exception;

}
