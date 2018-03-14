package kr.co.trycatch.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.company.NoteComService;
import kr.co.trycatch.service.user.NoteService;

@Controller
public class NoteController {

	@Inject
	private NoteService noteService;
	
	@Inject
	private NoteComService notecomService;
	
	@RequestMapping(value="/user/note/register", method= RequestMethod.POST)
	public @ResponseBody String register(NoteVO noteVo)throws Exception {
		System.out.println("NoteController register");
		
		noteService.regist(noteVo);
		System.out.println("noteVo"+noteVo);
		
		return "success";
	}
	
	@RequestMapping("/user/note/list")
	public String list(SearchCriteria cri, Model model,HttpSession session)throws Exception{
		String note_receiver= (String) session.getAttribute("user_login_id");
		//System.out.println("note_receiver>>>>>>>"+note_receiver);
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(noteService.listSearchCount(cri, note_receiver));
		model.addAttribute("list",noteService.listSearchCriteria(cri, note_receiver));
		model.addAttribute("cri",cri);
		model.addAttribute("pageMaker",maker);
		
		return "user/note/list";
	}
	
	@RequestMapping("/user/note/read")
	public String read(String note_receiver, int note_id, Model model, SearchCriteria cri )throws Exception{
		NoteVO noteVo= noteService.read(note_id);
		//System.out.println("noteVo"+noteVo);
		
		model.addAttribute("note",noteVo);
		model.addAttribute("cri",cri); 
		
		return "/user/note/read";
	}
	
	//------------------------------------company----------------------------------------
	
	@RequestMapping(value="/company/note/register", method= RequestMethod.POST)
	public @ResponseBody String registerCom(NoteVO noteVo)throws Exception {
		System.out.println("NoteController registerCom");
		
		notecomService.regist(noteVo);
		
		
		return "success";
	}
	
	//°íÄ¡±â
	@RequestMapping("/company/note/list")
	public String listCom(SearchCriteria cri, Model model, HttpSession session)throws Exception{
		String note_receiver= (String) session.getAttribute("user_login_id");
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(notecomService.listSearchCount(cri, note_receiver));
		model.addAttribute("list",notecomService.listSearchCriteria(cri, note_receiver));
		model.addAttribute("cri",cri);
		model.addAttribute("pageMaker",maker);
		
		return "company/note/list";
	}
	
	@RequestMapping("/company/note/read")
	public String readCom(String note_receiver, int note_id, Model model, SearchCriteria cri )throws Exception{
		NoteVO noteVo= notecomService.read(note_id);
		System.out.println("noteVo"+noteVo);
		
		model.addAttribute("note",noteVo);
		model.addAttribute("cri",cri); 
		
		return "/company/note/read";
	}
	
}
