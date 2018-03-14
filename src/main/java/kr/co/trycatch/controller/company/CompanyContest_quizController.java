package kr.co.trycatch.controller.company;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;
import kr.co.trycatch.service.company.Contest_quizService;

//@Controller
//@RequestMapping("/company/contest/quiz")
public class CompanyContest_quizController {

	/*@Inject
	private Contest_quizService contest_quizService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String quizRegisterGet() throws Exception {
		return "/company/contest/quiz/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String quizRegisterPost(Contest_quizVO contest_quizVo, ExampleVO exampleVo,
			                       HttpServletRequest request, String action) throws Exception {
		System.out.println("CompanyContestController 문제 등록");
		System.out.println(contest_quizVo);
		System.out.println(exampleVo);
		System.out.println("--------------------------------");
		String items[]=request.getParameterValues("item");
        for(String str: items) {
        	System.out.println("--->"+str);
        }
		contest_quizService.register(contest_quizVo, exampleVo, items);
		System.out.println("action >>> "+action);
		String path="";
		if(action.equals("quizAdd")) {//문제 추가
			path = "redirect:/company/contest/quiz/register?contest_id="+contest_quizVo.getContest_id();
		}else if(action.equals("contestComplete")) {//콘테스트 등록 완료
			path = "redirect:/company/contest/list";
		}
		
		return path;
	}

	@RequestMapping(value = "/objectiveType", method = RequestMethod.GET)
	public String objectiveExampleGet() throws Exception {
		return "/company/contest/quiz/objectiveType";
	}
	
	@RequestMapping(value = "/subjectiveType", method = RequestMethod.GET)
	public String subjectiveExampleGet() throws Exception {
		return "/company/contest/quiz/subjectiveType";
	}
	
	@RequestMapping(value = "/codingType", method = RequestMethod.GET)
	public String codingExampleGet() throws Exception {
		return "/company/contest/quiz/codingType";
	}*/
}
