package kr.co.trycatch.controller.company;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.trycatch.domain.company.Company_infoVO;
import kr.co.trycatch.domain.user.MemberVO;
import kr.co.trycatch.service.company.Company_infoService;
import kr.co.trycatch.service.company.NoteComService;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Inject
	private Company_infoService company_infoService;

	@Inject
	private NoteComService notecomService;
	
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(MemberVO memberVo, Company_infoVO company_infoVo) throws Exception {

		System.out.println("CompanyController registerPost()");
		String state = "";
		String idCheck = company_infoService.idCheck(memberVo.getMember_id());

		if (idCheck.equals("duplication")) {
			state = "duplication";
		} else {
			state = company_infoService.registUser(memberVo, company_infoVo);
			System.err.println(memberVo);
			System.out.println(company_infoVo);

		}

		return state;
	}

	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public String idCheckPost(String member_id) throws Exception {
		System.out.println("CompanyController idCheck()");
		System.out.println("idCheckPost() member_id:" + member_id);

		return company_infoService.idCheck(member_id);
	}

	@ResponseBody
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(String login_id, String login_pass, Model model, HttpSession session) throws Exception {
		System.out.println("CompanyController loginPost");
		MemberVO memberVo = company_infoService.login(login_id, login_pass);
		String state = "";
		if (memberVo == null) {
			state = "noRegister";
		} else if (memberVo != null) {
			//session.setAttribute("login_id", login_id); //혹시 공통된 로그인 아이디 세션키값이 필요할 때 사용할것
			session.setAttribute("company_login_member_id", login_id);
			session.setAttribute("company_loginState", "login");
			
			int company_id = company_infoService.selectCompany_id(login_id);
			session.setAttribute("company_login_company_id", company_id);
			
			state = "login";
			
			 session.setAttribute("statusCount" ,notecomService.statusCount(login_id));//읽지 않은 쪽지 갯수 조회 

		}
		return state;
	}

	@RequestMapping(value = "/loginComplete")
	public String loginComplete() {
		System.out.println("CompanyController loginComplete");

		return "/company/loginComplete";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		System.out.println("CompanyController logout()");
		session.invalidate();
		
		return "redirect:/company/main";
	}
}
