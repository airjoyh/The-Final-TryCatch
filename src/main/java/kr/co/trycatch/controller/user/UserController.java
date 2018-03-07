package kr.co.trycatch.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.trycatch.domain.user.MemberVO;
import kr.co.trycatch.service.user.MemberService;

@Controller
@RequestMapping("/user")
public class UserController {
	// 1.요청분석 2.파라미터데이터얻기 3.모델호출 3-2.데이터영역 저장 4.이동페이지

	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String registerPost(MemberVO memberVo) throws Exception {
		System.out.println("registerPost()");
		
		System.err.println(memberVo);

		return memberService.registUser(memberVo);// "registComplete" "noEmailConfirm" "registNew"
	}

	@ResponseBody
	@RequestMapping(value = "/removeRegist")
	public String removeRegist(String member_id) throws Exception{
		System.out.println("removeRegist()");
		memberService.removeRegist(member_id);
		
		return "removeRegist";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.POST)
	public String emailConfirm(String member_id, String user_authCode, Model model) throws Exception {
		
		System.out.println("emailConfirm()");
		System.out.println("member_id=" + member_id);
		String state = memberService.changeAuthStatus(member_id, user_authCode);// success or fail
		model.addAttribute("member_id", member_id);
		model.addAttribute("user_authCode", user_authCode);

		return state;
	}

	@RequestMapping(value = "/noAuth")
	public String noAuth(@RequestParam("id") String id, Model model) throws Exception {
		System.out.println("noAuth()");
		System.out.println(id);
		model.addAttribute("id", id);

		return "user/emailConfirm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findUser", method = RequestMethod.POST)
	public String findUser(String member_id) throws Exception{
		System.out.println("findUser()");
		
		String state = memberService.findUser(member_id);
		
		return state;
	}
	
	@ResponseBody
	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	public String changePass(MemberVO memberVo, Model model) throws Exception {
		System.out.println("changePass()");
		String state= memberService.changePass(memberVo);
		
		
		return state;
	}
	

	@ResponseBody
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(String login_id, String login_pass, Model model, HttpSession session) throws Exception {
		System.out.println("loginPost");
		MemberVO memberVo = memberService.login(login_id, login_pass);
		String state = "";
		if (memberVo == null) {
			state = "noRegister";
		} else if (memberVo != null) {
			if (memberService.authStatus(login_id).equals("N")) {
				model.addAttribute("noConfirm_id", login_id);
				state = "noAuth";
			} else {
				session.setAttribute("user_login_id", login_id);
				session.setAttribute("user_loginState", "login");
				state = "login";
			}
		}
		return state;
	}
	
	@RequestMapping(value = "/loginComplete")
	public String loginComplete() {
		System.out.println("loginComplete");
		
		return "/user/loginComplete";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		System.out.println("logout()");
		session.invalidate();
		
		return "redirect:/user/main";
	}

}
