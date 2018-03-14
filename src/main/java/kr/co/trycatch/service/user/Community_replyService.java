package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.user.Community_replyVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.Review_replyVO;

public interface Community_replyService {

	public void addReply(Community_replyVO community_replyVo) throws Exception;

    public List<Community_replyVO> list(int community_no, Criteria cri) throws Exception;

    public int count(int community_no) throws Exception;
    
    public void modify(Community_replyVO communityVo) throws Exception;
	
    public void remove(int reply_no) throws Exception;

}
