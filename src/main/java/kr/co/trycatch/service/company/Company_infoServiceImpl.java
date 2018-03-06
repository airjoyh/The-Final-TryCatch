package kr.co.trycatch.service.company;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.MemberVO;
import kr.co.trycatch.persistence.company.Company_infoDAO;
import kr.co.trycatch.persistence.user.MemberDAO;

@Service
public class Company_infoServiceImpl implements Company_infoService {

	@Inject
	private MemberDAO memberDao;

	@Inject
	private Company_infoDAO company_infoDao;

	@Transactional
	@Override
	public String registUser(MemberVO memberVo, Company_infoVO company_infoVo) throws Exception {

		company_infoDao.createCompany(memberVo);
		company_infoDao.createCompanyInfo(company_infoVo);
		//memberDao.updateAuthStatus(memberVo.getMember_id());

		return "success";

	}

	@Override
	public String idCheck(String member_id) throws Exception {
		String state = "";
		System.out.println("idCheck() member_id:" + member_id);
		List<MemberVO> list = memberDao.selectMember();

		if (list.size() == 0) {//��ϵ� ȸ���� �ϳ��� ���ٸ� for���� �����⿡!
			state = "use";
		} else {

			for (int i = 0; i < list.size(); i++) {
				String id = list.get(i).getMember_id();
				//System.out.println("�˻��� ���̵� = "+id);
				if (member_id != null && member_id.equals(id)) {
					//System.out.println("if�� �Ȱɸ���?");
					state = "duplication";
					break;
					//break�� �Ȱɾ��ָ� for���� ��� ���ư��� ������ �ߺ��� ���̵� �ִ��� �ߺ������ʴٰ� �Ǻ��ȴ�
					
				} else {
					state = "use";
				}
			}
		}
		System.out.println("state >>> " + state);

		return state;
	}

	@Override
	public MemberVO login(String member_id, String member_pass) throws Exception {
		
		return company_infoDao.loginCompany(member_id, member_pass);
	}

}
