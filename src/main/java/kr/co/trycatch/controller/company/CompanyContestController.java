package kr.co.trycatch.controller.company;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.trycatch.domain.company.ContestVO;
import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.company.ExampleVO;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
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
		System.out.println("CompanyContestController registerPost() ");
		System.out.println(contestVo);
		int contest_id = contestService.selectContest_id();
		contestVo.setContest_id(contest_id);
		contestService.register(contestVo);
		// session.setAttribute("contest_id", contest_id);

		return "redirect:/company/contest/quiz/register?contest_id=" + contest_id+"&quiz_no=1";
	}
	
	@RequestMapping(value="/list")
	public String list(SearchCriteria cri, Model model, HttpSession session) throws Exception{
		System.out.println("CompanyContestController list()");
		int company_id =  (int) session.getAttribute("company_login_company_id");
		System.out.println("company_id >>> "+company_id);
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+contestService.listSearchCount(cri, company_id));
		maker.setTotalCount(contestService.listSearchCount(cri, company_id));
		List<ContestVO> list = contestService.selectByCompany(cri, company_id);
		System.out.println("selectByCompany list >>> "+list);
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);//현재페이지, 페이지당 레코드수, 검색타입, 검색어
		model.addAttribute("pageMaker", maker);
		
		return "/company/contest/list_new";
	}
	
	@ResponseBody
	@RequestMapping(value="/finalRegister")
	public String finalRegister(int contest_id) throws Exception{
		
		return contestService.finalRegister(contest_id);
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/quiz/register", method = RequestMethod.GET)
	public String quizRegisterGet() throws Exception {
		
		
		return "/company/contest/quiz/register";
	}

	@RequestMapping(value = "/quiz/register", method = RequestMethod.POST)
	public String quizRegisterPost(Contest_quizVO contest_quizVo, ExampleVO exampleVo,
			                       HttpServletRequest request, String action, String item, RedirectAttributes rttr) throws Exception {
		System.out.println("CompanyContestController 문제 등록");
		System.out.println(contest_quizVo);
		System.out.println(exampleVo);
		System.out.println("--------------------------------");
		//주관식일때만 보기 --> 답으로
		String items[]=request.getParameterValues("item");
        for(String str: items) {
        	System.out.println("--->"+str);
        }
        System.out.println("item >>> "+item);//aa,bb,cc (보기항목)
        int quiz_type = contest_quizVo.getQuiz_type();
        if(quiz_type == 2) {
        	contest_quizVo.setQuiz_correct(item);
        }
        
		contest_quizService.register(contest_quizVo, exampleVo, items);
		System.out.println("action >>> "+action);
		String path="";
		if(action.equals("quizAdd")) {//문제 추가
			int quiz_no = contest_quizVo.getQuiz_no()+1;
			rttr.addAttribute("quiz_no", quiz_no);
			path = "redirect:/company/contest/quiz/register?contest_id="+contest_quizVo.getContest_id()+"&quiz_no="+quiz_no;
		}else if(action.equals("contestComplete")) {//콘테스트 등록 완료
			path = "redirect:/company/contest/list";
		}
		
		return path;
	}

	@RequestMapping(value = "/quiz/objectiveType", method = RequestMethod.GET)
	public String objectiveExampleGet() throws Exception {
		return "/company/contest/quiz/objectiveType";
	}
	
	@RequestMapping(value = "/quiz/subjectiveType", method = RequestMethod.GET)
	public String subjectiveExampleGet() throws Exception {
		return "/company/contest/quiz/subjectiveType";
	}
	
	@RequestMapping(value = "/quiz/codingType", method = RequestMethod.GET)
	public String codingExampleGet() throws Exception {
		return "/company/contest/quiz/codingType";
	}
}
