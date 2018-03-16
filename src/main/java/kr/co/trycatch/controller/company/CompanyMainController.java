package kr.co.trycatch.controller.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyMainController {

	@RequestMapping(value="/company/intro")
	public String goIntro() {
		
		return "/company/introduce";
	}
	
	@RequestMapping(value="/company/personSearch/list")
	public String goPersonSearch() {
		System.out.println("CompanyMainController goPersonSearch");
		
		return "/company/personSearch/list";
	}
	
	@RequestMapping(value="/company/faq")
	public String goFaq() {
		System.out.println("CompanyMainController goFaq");
		
		return "/company/faq";
	}
}
