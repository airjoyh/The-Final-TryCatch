package kr.co.trycatch.service.company;

import java.util.List;

import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;

public interface Contest_quizService {

	public void register(Contest_quizVO contest_quizVo, ExampleVO exampleVo, String []items) throws Exception;

	public void modify(Contest_quizVO contest_quizVo) throws Exception;

	public void remove(int quiz_id) throws Exception;
	
	public int readQuiz_id(int contest_id, int quiz_no) throws Exception;

	public Contest_quizVO readQuiz(int contest_id, int quiz_no) throws Exception;
	
	public List<ExampleVO> readExample(int quiz_id) throws Exception;

	public int quizCount(int contest_id) throws Exception;
}
