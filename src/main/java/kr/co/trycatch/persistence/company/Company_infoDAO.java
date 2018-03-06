package kr.co.trycatch.persistence.company;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.MemberVO;

public interface Company_infoDAO {
	
	public void createCompany(MemberVO memberVo) throws Exception;
	
	public void createCompanyInfo(Company_infoVO company_infoVo) throws Exception;
	
	public MemberVO loginCompany(String member_id, String member_pass) throws Exception;
}
