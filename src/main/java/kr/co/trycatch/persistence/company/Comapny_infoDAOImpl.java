package kr.co.trycatch.persistence.company;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.MemberVO;

@Repository
public class Comapny_infoDAOImpl implements Company_infoDAO {

	@Inject
	private SqlSession session;

	@Override
	public void createCompany(MemberVO memberVo) throws Exception {
		session.insert("member.createCompany", memberVo);

	}

	@Override
	public void createCompanyInfo(Company_infoVO company_infoVo) throws Exception {
		session.insert("member.createCompanyInfo", company_infoVo);

	}

	@Override
	public MemberVO loginCompany(String member_id, String member_pass) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_pass", member_pass);

		return session.selectOne("member.loginCompany", map);
	}

}
