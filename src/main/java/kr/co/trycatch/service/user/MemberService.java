package kr.co.trycatch.service.user;

import java.util.List;

import kr.co.trycatch.domain.user.MemberVO;

public interface MemberService {

	public String registUser(MemberVO memberVo) throws Exception;
	
	public void sendEmail(String member_id) throws Exception;
	
	public List<MemberVO> selectMember() throws Exception; 
	
	public String authCode(String member_id) throws Exception;
	
	public String authStatus(String member_id) throws Exception;
	
	public String changeAuthStatus(String member_id, String user_authCode) throws Exception;
	
	public MemberVO login(String member_id, String member_pass) throws Exception;
	
	public void removeRegist(String member_id) throws Exception;
	
	public void changePass(String member_id, String member_pass) throws Exception;
	
}
