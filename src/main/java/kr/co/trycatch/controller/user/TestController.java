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
		return "/ing/companyContest";
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
}