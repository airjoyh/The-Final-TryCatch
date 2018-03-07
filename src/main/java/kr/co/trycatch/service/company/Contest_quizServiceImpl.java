package kr.co.trycatch.service.company;

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
	public void register(Contest_quizVO contest_quizVo,ExampleVO exampleVo) throws Exception {
		contest_quizDao.create(contest_quizVo);
		contest_quizDao.exampleCreate(exampleVo);
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
	public Contest_quizVO select(int quiz_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
