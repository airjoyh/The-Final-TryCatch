package kr.co.trycatch.service.company;

import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;

public interface Contest_quizService {

	public void register(Contest_quizVO contest_quizVo, ExampleVO exampleVo) throws Exception;

	public void modify(Contest_quizVO contest_quizVo) throws Exception;

	public void remove(int quiz_id) throws Exception;

	public Contest_quizVO select(int quiz_id) throws Exception;

}
