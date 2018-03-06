package kr.co.trycatch.persistence.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void createUser(MemberVO memberVo) throws Exception {
		int t = session.insert("member.createUser", memberVo);
		System.out.println("회원 가입된 구직자 수: "+t);
				
	}

	@Override
	public void createAuthCode(String member_id, String user_authCode) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("user_authCode", user_authCode);
		
		session.selectOne("member.createAuthCode", map);

	}

	@Override
	public String authCode(String member_id) throws Exception {
		
		return session.selectOne("member.authCode",member_id);
	}
	
	@Override
	public void updateAuthStatus(String member_id) throws Exception {
		session.update("member.updateAuthStatus", member_id);

	}

	@Override
	public String authStatus(String member_id) throws Exception {
		
		return session.selectOne("member.authStatus", member_id);
	}

	
	
	@Override
	public List<MemberVO> selectMember() throws Exception {
		
		return session.selectList("member.selectMember");
	}

	@Override
	public MemberVO loginUser(String member_id, String member_pass) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_pass", member_pass);
		
		return session.selectOne("member.loginUser", map);
	}

	@Override
	public String registDate(String member_id) throws Exception {
		
		return session.selectOne("member.registDate", member_id);
	}

	@Override
	public String sysDate(String member_id) throws Exception {
		
		return session.selectOne("member.sysDate", member_id);
	}

	@Override
	public void deleteRegist(String member_id) throws Exception {
		
		session.delete("member.deleteRegist", member_id);
	}

	@Override
	public void updatePass(String member_id, String member_pass) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_pass", member_pass);
		
		session.update("member.updatePass", map);
	}

	@Override
	public Company_infoVO companyInfo(String company_id) throws Exception {
		
		return session.selectOne("member.companyInfo", company_id);
	}
	
}
