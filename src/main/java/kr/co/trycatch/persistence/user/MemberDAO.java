package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.MemberVO;

public interface MemberDAO {

	public void createUser(MemberVO memberVo) throws Exception;

	public void createAuthCode(String member_id, String user_authCode) throws Exception;

	public String authCode(String member_id) throws Exception;

	public void updateAuthStatus(String member_id) throws Exception;

	public String authStatus(String member_id) throws Exception;

	public List<MemberVO> memberAll() throws Exception;
	
	public MemberVO member(String member_id) throws Exception;

	public MemberVO loginUser(String member_id, String member_pass) throws Exception;

	public String registDate(String member_id) throws Exception;

	public String sysDate(String member_id) throws Exception;

	public void deleteRegist(String member_id) throws Exception;
	
	public void updatePass(String member_id, String member_pass) throws Exception;
	
	public Company_infoVO companyInfo(String company_id) throws Exception;
}
