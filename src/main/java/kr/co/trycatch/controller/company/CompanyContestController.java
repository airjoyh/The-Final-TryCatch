package kr.co.trycatch.controller.company;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.trycatch.domain.company.ContestVO;
import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;
import kr.co.trycatch.service.company.ContestService;
import kr.co.trycatch.service.company.Contest_quizService;

@Controller
@RequestMapping("/company/contest")
public class CompanyContestController {

	@Inject
	private ContestService contestService;

	@Inject
	private Contest_quizService contest_quizService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGet() throws Exception {
		return "/company/contest/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(ContestVO contestVo, HttpSession session) throws Exception {
		System.out.println("CompanyContestController registerPost()");
		System.out.println(contestVo);
		int contest_id = contestService.selectContest_id();
		contestVo.setContest_id(contest_id);
		contestService.register(contestVo);
		// session.setAttribute("contest_id", contest_id);

		return "redirect:/company/contest/quiz/register?contest_id=" + contest_id;
	}

	////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/quiz/register", method = RequestMethod.GET)
	public String quizRegisterGet() throws Exception {
		return "/company/contest/quiz/register";
	}

	@RequestMapping(value = "/quiz/register", method = RequestMethod.POST)
	public String quizRegisterPost(Contest_quizVO contest_quizVo, ExampleVO exampleVo) throws Exception {
		System.out.println("CompanyContestController 문제 등록");
		System.err.println(contest_quizVo);
		System.out.println(exampleVo);
		
		contest_quizService.register(contest_quizVo, exampleVo);
		
		return "/company/contest/list";
	}

	@RequestMapping(value = "/quiz/obj1", method = RequestMethod.GET)
	public String objectiveExampleGet() throws Exception {
		return "/company/contest/quiz/objectiveType1";
	}

}
