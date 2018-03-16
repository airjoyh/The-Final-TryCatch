package kr.co.trycatch.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/test1")
	public String userMain_son() {
		System.out.println("����");
		return "/ing/userMain_son";
	}
	
	@RequestMapping("/com/contest")
	public String companyContest() {
		System.out.println("����");
		return "/ing/com/companyContest";
	}
	
	@RequestMapping("/com/contest/register")
	public String companyContestregester() {
		System.out.println("����");
		return "/ing/com/company_cont_create";
	}
	
	@RequestMapping("/user/solve")
	public String solve() {
		System.out.println("����");
		return "/ing/solve";
	}
	
	@RequestMapping("/user/code")
	public String code() {
		System.out.println("����");
		return "/ing/codemirror";
	}
	
	@RequestMapping("/pagenation")
	public String pagenation() {
		System.out.println("����");
		return "/ing/common/pagenation";
	}
	
	@RequestMapping("/com/main")
	public String commain() {
		return "companyMain_new";
	}
	

}
