package kr.co.trycatch.service.company;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.MemberVO;

public interface Company_infoService {

	public String registUser(MemberVO memberVo, Company_infoVO company_infoVo) throws Exception;
	
	public String idCheck(String member_id) throws Exception;
	
	public MemberVO login(String member_id, String member_pass) throws Exception;
	
	public int selectCompany_id(String member_id) throws Exception;
}
