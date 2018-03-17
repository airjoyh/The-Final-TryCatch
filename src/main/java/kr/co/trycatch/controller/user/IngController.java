package kr.co.trycatch.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IngController {
	
	@RequestMapping("/brank")
	public String com_rank_sw() {
		System.out.println("swlee");
		return "/ing/com_rank_sw";
	}
	
	@RequestMapping("/blist")
	public String boardList_sw() {
		System.out.println("swlee");
		return "/ing/boardList_sw";
	}
	
	@RequestMapping("/bread")
	public String boardRead_sw() {
		System.out.println("swlee");
		return "/ing/boardRead_sw";
	}
	
	@RequestMapping("/conqna")
	public String contest_qna_sw() {
		System.out.println("swlee");
		return "/ing/cont_qna_sw";
	}
	
	@RequestMapping("/conregist")
	public String contest_qna_register() {
		System.out.println("swlee");
		return "/ing/cont_qna_register";
	}
	
	@RequestMapping("/conread")
	public String contest_qna_read() {
		System.out.println("swlee");
		return "/ing/cont_qna_read";
	}
	
	@RequestMapping("/comreregister")
	public String company_review_register() {
		System.out.println("swlee");
		return "/ing/com_review_register_sw";
	}
	
	@RequestMapping("/comreread")
	public String com_review_read() {
		System.out.println("swlee");
		return "/ing/com_review_read_sw";
	}
	
	@RequestMapping("/communitylist")
	public String communitylist() {
		System.out.println("list");
		return "/ing/community_list_sw";
	}
	
	@RequestMapping("/communityread")
	public String communityread() {
		System.out.println("read");
		return "/ing/community_read_sw";
	}
	
	@RequestMapping("/communitymodify")
	public String communitymodify() {
		System.out.println("modify");
		return "/ing/community_modify_sw";
	}
	
	@RequestMapping("/communityregist")
	public String communityregist() {
		System.out.println("register");
		return "/ing/community_register_sw";
	}

	@RequestMapping("/faq")
	public String faq_sw() {
		System.out.println("faq");
		return "/ing/tc_faq_sw";
	}
	
	@RequestMapping("/mail")
	public String mail_sw() {
		System.out.println("mail");
		return "/ing/tc_mail_sw";
	}
	
	@RequestMapping("/mailread")
	public String mail_read_sw() {
		System.out.println("mailread");
		return "/ing/tc_mail_read_sw";
	}
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("test");
		return "/test";
	}
	
	@RequestMapping("/com/finduser")
	public String test2() {
		System.out.println("test");
		return "/company/personSearch/com_find_user";
	}
	
	@RequestMapping("/com/userpf")
	public String test3() {
		System.out.println("test");
		return "/company/personSearch/com_view_portfolio";
	}
	@RequestMapping("/com/cont/qreg")
	public String test4() {
		System.out.println("test");
		return "/company/contest/quiz/quiz_register_new";
	}
	@RequestMapping("/pagen")
	public String test5() {
		System.out.println("test");
		return "/ing/common/pagenation";
	}

}
