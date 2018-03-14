package kr.co.trycatch.service.company;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;
import kr.co.trycatch.persistence.company.Contest_quizDAO;

@Service
public class Contest_quizServiceImpl implements Contest_quizService {

	@Inject
	private Contest_quizDAO contest_quizDao;

	@Transactional
	@Override
	public void register(Contest_quizVO contest_quizVo, ExampleVO exampleVo, String[] items) throws Exception {

		int quiz_id = contest_quizDao.selectQuiz_seq();

		contest_quizVo.setQuiz_id(quiz_id);
		contest_quizDao.create(contest_quizVo);

		exampleVo.setQuiz_id(quiz_id);
		int item_no = 1;
		for (String item : items) {
			exampleVo.setItem_no(item_no++);
			exampleVo.setItem(item);
			contest_quizDao.exampleCreate(exampleVo);
		}
	}

	@Override
	public void modify(Contest_quizVO contest_quizVo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int quiz_id) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int readQuiz_id(int contest_id, int quiz_no) throws Exception {
		
		return contest_quizDao.selectQuiz_id(contest_id, quiz_no);
	}
	
	@Override
	public Contest_quizVO readQuiz(int contest_id, int quiz_no) throws Exception {

		return contest_quizDao.selectQuiz(contest_id, quiz_no);
	}

	@Override
	public List<ExampleVO> readExample(int quiz_id) throws Exception {

		return contest_quizDao.selectExample(quiz_id);
	}

}
