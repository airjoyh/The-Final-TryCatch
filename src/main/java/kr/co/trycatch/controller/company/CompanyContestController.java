package kr.co.trycatch.controller.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/company/contest")
public class CompanyContestController {

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register() throws Exception{
		
		return "company/contest/register";
	}
	
}
