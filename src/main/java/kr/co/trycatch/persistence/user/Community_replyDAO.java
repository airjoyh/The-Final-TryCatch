package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.Community_replyVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.Review_replyVO;

public interface Community_replyDAO {

	public void create(Community_replyVO community_replyVo) throws Exception;
    
    public List<Community_replyVO> list(int community_no, Criteria cri) throws Exception;
    
    public int count(int community_no) throws Exception;
    
    public int getCommunity_no(int reply_no) throws Exception;
	
	public void update(Community_replyVO community_replyVo) throws Exception;
	
	public void delete(int reply_no) throws Exception;

 }
