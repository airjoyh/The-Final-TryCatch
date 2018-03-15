package kr.co.trycatch.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.Community_replyVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.persistence.user.CommunityDAO;
import kr.co.trycatch.persistence.user.Community_replyDAO;

@Service
public class Community_replyServiceImpl implements Community_replyService {
    
	@Inject
	private Community_replyDAO community_replyDao;
	
	@Inject
	private CommunityDAO communityDao;
	
	@Override
	public void addReply(Community_replyVO community_replyVo) throws Exception {
	   community_replyDao.create(community_replyVo);
	 //댓글 수 증가 추가.
	   communityDao.updateReplyCount(community_replyVo.getCommunity_no(), 1);
	}

	@Override
	public List<Community_replyVO> list(int community_no, Criteria cri) throws Exception {
		
		return community_replyDao.list(community_no, cri);
	}

	@Override
	public int count(int community_no) throws Exception {
		return community_replyDao.count(community_no);
	}

	@Override
	public void modify(Community_replyVO community_replyVo) throws Exception {
		community_replyDao.update(community_replyVo);
	}

	@Override
	public void remove(int reply_no) throws Exception {
		int review_no = community_replyDao.getCommunity_no(reply_no);
		community_replyDao.delete(reply_no);
		//댓글 수 업데이트 추가
		communityDao.updateReplyCount(review_no, -1);//게시물 댓글수 감소(-1)
		
	}
}
