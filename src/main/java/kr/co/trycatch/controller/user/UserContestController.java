package kr.co.trycatch.controller.user;

import java.io.File;
import java.io.FileWriter;
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

import kr.co.trycatch.common.CompileHandler;
import kr.co.trycatch.domain.company.Contest_quizVO;
import kr.co.trycatch.domain.user.Contest_answerVO;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.company.ContestService;
import kr.co.trycatch.service.company.Contest_answerService;
import kr.co.trycatch.service.company.Contest_quizService;
import kr.co.trycatch.service.user.Contest_qnaService;

@Controller
@RequestMapping("/user/contest")
public class UserContestController {

	@Inject
	private ContestService contestService;
	
	@Inject
	private Contest_quizService contest_quizService;
	
	@Inject
	private Contest_answerService contest_answerService;
	
	@Inject
	private Contest_qnaService contest_qnaService;

	@RequestMapping(value = "/list")
	public String list(SearchCriteria cri, Model model) throws Exception {
		System.out.println("UserContestController list()");

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> " + contestService.selectAllCount(cri));
		maker.setTotalCount(contestService.selectAllCount(cri));
		model.addAttribute("list", contestService.selectAll(cri));
		model.addAttribute("cri", cri);// 현재페이지, 페이지당 레코드수, 검색타입, 검색어
		model.addAttribute("pageMaker", maker);

		return "/user/contest/list_new";
	}

	@RequestMapping(value = "/read")
	public String read(@RequestParam("contest_id") int contest_id, Model model, SearchCriteria cri) throws Exception {
		System.out.println("USerContestController read()");
		System.out.println("USerContestController 읽을 글번호>>" + contest_id);
		
		model.addAttribute("contest", contestService.read(contest_id));
		
		
		//Q&A게시판
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(contest_qnaService.listSearchCount(cri, contest_id));
		model.addAttribute("list", contest_qnaService.listSerachCriteria(cri, contest_id));
		model.addAttribute("Cri", cri);//현재페이지, 페이지당 레코드수, 검색타입, 검색어
		model.addAttribute("pageMaker", maker);
		System.out.println("검색된 글의 수 >>> "+contest_qnaService.listSearchCount(cri, contest_id));
		
		return "/user/contest/read_new";
	}
	
	@ResponseBody
	@RequestMapping("/quiz/solveCount")
	public String solveCount(int contest_id, String user_id, HttpSession session) throws Exception{
		
		String state = "";
		
		//String user_id = (String) session.getAttribute("user_login_id");
		int solveCount = contest_answerService.solveCount(user_id, contest_id);
		int startDateCount = contest_answerService.startDateCount(contest_id);
		int endDateCount = contest_answerService.endDateCount(contest_id);
		
		if(startDateCount>0) {
			state = "startYet";
		
		}else if(endDateCount>0) {
			state = "endAlready";
		
		}else if(solveCount>0) {
			state = "solveAlready";
		}else {
			state = "solveYet";
		}
		
		return state;
	}

	@RequestMapping("/quiz/solve")
	public String readQuiz(@RequestParam("contest_id") int contest_id, int quiz_no, Model model) throws Exception {

		Contest_quizVO contest_quizVo = contest_quizService.readQuiz(contest_id, quiz_no);
		
		if(contest_quizVo == null) {//마지막 문제를 풀었다면
			
			return "redirect:/user/contest/quiz/answer/score?contest_id="+contest_id;
		}
		
		model.addAttribute("contest", contestService.read(contest_id));
		model.addAttribute("contest_quiz", contest_quizVo);
		model.addAttribute("quiz_no", quiz_no);
		
		int quiz_id = contest_quizService.readQuiz_id(contest_id, quiz_no);
		model.addAttribute("quiz_id", quiz_id);
		model.addAttribute("exampleList", contest_quizService.readExample(quiz_id));
		model.addAttribute("quizCount", contest_quizService.quizCount(contest_id));
		
		int quiz_type = contest_quizVo.getQuiz_type();
		String type ="";
		if(quiz_type==1) {
			type = "obj";
			
		}else if(quiz_type==2) {
			type="subj";
			
		}else if(quiz_type==3) {
			type="coding";
		}
		
		
		
		return "/user/contest/quiz/solve_"+type;
	}
	
	@ResponseBody
	@RequestMapping(value="/quiz/answer/register", method = RequestMethod.POST)
	public String answerRegister(HttpServletRequest request,Contest_answerVO contest_answerVo, Model model) throws Exception{
	
		System.out.println("등록된 정답 >>> "+contest_answerVo);
		
		
		contest_answerService.register(contest_answerVo);
		
		return "success";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/quiz/answer/compile", method= RequestMethod.POST)
	public String compile(String code, Model model, HttpSession session, String className) throws Exception{
		
		System.out.println(">>>>컴파일과 실행 : 클래스명: "+ className);
		String path = "c:/coding/"+className+".java";//request.getServletContext().getRealPath("resources/coding/Test.java");
		FileWriter fw = new FileWriter(path);
		fw.write(code);
		fw.close();
		System.out.println("파일 생성!");
		
		CompileHandler ch = new CompileHandler();
		ch.javac("cmd","/c","javac "+path);
		System.out.println("컴파일 완료!");
		
		File f = new File("c:/coding/"+className+".java");
		File f2 = new File("c:/coding/"+className+".class");
		System.out.println("소스파일생성:"+f.exists());
		System.out.println("클래스파일생성:"+f2.exists());
		
		while (!f2.exists()) {
		   Thread.sleep(1000);	
		}
		System.out.println("클래스파일생성 ^^*");
		
		String compileResult = ch.java("cmd","/c","java -classpath c:/coding "+className);//str2
	    System.out.println("실행 완료!!");	    
	    System.out.println("compileResult="+compileResult);
		//model.addAttribute("compileResult", compileResult);
	    //session.setAttribute("compileResult", compileResult);
		f.delete();
	    f2.delete();
	    
	    
		return compileResult;
	}
	
	@RequestMapping(value="/quiz/answer/score")
	public String quizScore(@RequestParam("contest_id") int contest_id, HttpSession session, Model model) throws Exception{
		
		model.addAttribute("contest", contestService.read(contest_id));
		String user_id = (String) session.getAttribute("user_login_id"); 
		model.addAttribute("scoreSum", contest_answerService.scoreSum(user_id, contest_id));
		
		return "/user/contest/quiz/score";
	}
	
	@RequestMapping(value = "/rankList")
	public String showSocreRankList(@RequestParam("contest_id") int contest_id, SearchCriteria cri, Model model) throws Exception{
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(contest_answerService.ScoreRankListCount(cri, contest_id));
		model.addAttribute("list", contest_answerService.scoreRankList(cri, contest_id));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+contest_answerService.ScoreRankListCount(cri, contest_id));
		
		return "/user/contest/rankList";
	}
}
