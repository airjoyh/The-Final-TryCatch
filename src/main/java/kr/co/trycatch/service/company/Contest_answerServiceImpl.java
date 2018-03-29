package kr.co.trycatch.service.company;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.domain.user.Contest_answerVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.persistence.company.Contest_answerDAO;

@Service
public class Contest_answerServiceImpl implements Contest_answerService {

	@Inject
	private Contest_answerDAO contest_answerDao;

	@Transactional
	@Override
	public void register(Contest_answerVO contest_answerVo) throws Exception {

		contest_answerDao.create(contest_answerVo);
		int score = contest_answerDao.marking(contest_answerVo.getQuiz_id(), contest_answerVo.getUser_id());
		// ������ �´��� select�Ѵ�.
		System.out.println("�ش� ���� ������??? " + score);
		contest_answerVo.setScore(score);// ������� ��
		contest_answerDao.updateScore(contest_answerVo);// ������ ������Ʈ ���ش�.
	}

	@Override
	public int scoreSum(String user_id, int contest_id) throws Exception {

		return contest_answerDao.selectScoreSum(user_id, contest_id);
	}

	@Override
	public List<Contest_answerVO> scoreRankList(SearchCriteria cri, int contest_id) throws Exception {

		return contest_answerDao.selectScoreRankList(cri, contest_id);
	}

	@Override
	public int ScoreRankListCount(SearchCriteria cri, int contest_id) throws Exception {

		return contest_answerDao.selectScoreRankListCount(cri, contest_id);
	}

	@Override
	public int solveCount(String user_id, int contest_id) throws Exception {
		
		return contest_answerDao.solveCount(user_id, contest_id);
	}

}
