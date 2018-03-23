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

@Controller
@RequestMapping("/user/contest")
public class UserContestController {

	@Inject
	private ContestService contestService;
	
	@Inject
	private Contest_quizService contest_quizService;
	
	@Inject
	private Contest_answerService contest_answerService;

	@RequestMapping(value = "/list")
	public String list(SearchCriteria cri, Model model) throws Exception {
		System.out.println("UserContestController list()");

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		System.out.println(cri);
		System.out.println("�˻��� ���� �� >>> " + contestService.selectAllCount(cri));
		maker.setTotalCount(contestService.selectAllCount(cri));
		model.addAttribute("list", contestService.selectAll(cri));
		model.addAttribute("cri", cri);// ����������, �������� ���ڵ��, �˻�Ÿ��, �˻���
		model.addAttribute("pageMaker", maker);

		return "/user/contest/list_new";
	}

	@RequestMapping(value = "/read")
	public String read(@RequestParam("contest_id") int contest_id, Model model, SearchCriteria cri) throws Exception {
		System.out.println("USerContestController read()");
		System.out.println("USerContestController ���� �۹�ȣ>>" + contest_id);
		System.out.println("cri" + cri);
		model.addAttribute("contest", contestService.read(contest_id));
		model.addAttribute("cri", cri);

		return "/user/contest/read";
	}

	@RequestMapping("/quiz/solve")
	public String readQuiz(@RequestParam("contest_id") int contest_id, int quiz_no, Model model) throws Exception {

		Contest_quizVO contest_quizVo = contest_quizService.readQuiz(contest_id, quiz_no);
		
		if(contest_quizVo == null) {//������ ������ Ǯ���ٸ�
			
			return "redirect:/user/contest/quiz/answer/score?contest_id="+contest_id;
		}
		
		model.addAttribute("contest", contestService.read(contest_id));
		model.addAttribute("contest_quiz", contest_quizVo);
		model.addAttribute("quiz_no", quiz_no);
		
		int quiz_id = contest_quizService.readQuiz_id(contest_id, quiz_no);
		model.addAttribute("quiz_id", quiz_id);
		model.addAttribute("exampleList", contest_quizService.readExample(quiz_id));
		
		return "/user/contest/quiz/solve";
	}
	
	@ResponseBody
	@RequestMapping(value="/quiz/answer/register", method = RequestMethod.POST)
	public String answerRegister(HttpServletRequest request,Contest_answerVO contest_answerVo, Model model) throws Exception{
	
		System.out.println("��ϵ� ���� >>> "+contest_answerVo);
		
		
		contest_answerService.register(contest_answerVo);
		
		return "success";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/quiz/answer/compile", method= RequestMethod.POST)
	public String compile(String code, Model model, HttpSession session, String className) throws Exception{
		
		System.out.println(">>>>�����ϰ� ���� : Ŭ������: "+ className);
		String path = "c:/coding/"+className+".java";//request.getServletContext().getRealPath("resources/coding/Test.java");
		FileWriter fw = new FileWriter(path);
		fw.write(code);
		fw.close();
		System.out.println("���� ����!");
		
		CompileHandler ch = new CompileHandler();
		ch.javac("cmd","/c","javac "+path);
		System.out.println("������ �Ϸ�!");
		
		File f = new File("c:/coding/"+className+".java");
		File f2 = new File("c:/coding/"+className+".class");
		System.out.println("�ҽ����ϻ���:"+f.exists());
		System.out.println("Ŭ�������ϻ���:"+f2.exists());
		
		while (!f2.exists()) {
		   Thread.sleep(1000);	
		}
		System.out.println("Ŭ�������ϻ��� ^^*");
		
		String compileResult = ch.java("cmd","/c","java -classpath c:/coding "+className);//str2
	    System.out.println("���� �Ϸ�!!");	    
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
		System.out.println("�˻��� ���� �� >>> "+contest_answerService.ScoreRankListCount(cri, contest_id));
		
		return "/user/contest/rankList";
	}
}
