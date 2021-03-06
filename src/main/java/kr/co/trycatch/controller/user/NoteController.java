package kr.co.trycatch.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		//String note_receiver= noteVo.getNote_receiver();
		
		return "success";
		//return "redirect:/user/note/list?note_receiver="+note_receiver;
	}
	
	@RequestMapping("/user/note/list")
	public String list(SearchCriteria cri, Model model,HttpSession session)throws Exception{
		String note_receiver= (String) session.getAttribute("user_login_id");
		//System.out.println("note_receiver>>>>>>>"+note_receiver);
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(noteService.listSearchCount(cri, note_receiver));
		
		int statusCount=noteService.statusCount(note_receiver);
		session.setAttribute("statusCount" ,statusCount);//읽지 않은 쪽지 갯수 조회 
		
		model.addAttribute("list",noteService.listSearchCriteria(cri, note_receiver));
		model.addAttribute("cri",cri);
		model.addAttribute("pageMaker",maker);
		
		return "user/note/list";
	}
	
	@RequestMapping("/user/note/read")
	public String read(NoteVO noteVo, Model model, SearchCriteria cri)throws Exception{
		String  before_status = noteVo.getNote_status();
		System.out.println("쪽지읽기 (상태) : "+ before_status);
		noteVo= noteService.read(noteVo.getNote_id(), noteVo);//읽은 쪽지상태 수정 ---> 쪽지 읽기
		//NoteVO noteVo = noteService.read(note_id);
		
		//System.out.println("noteVo"+noteVo);
		
		model.addAttribute("note",noteVo);
		
		model.addAttribute("cri",cri); 
		model.addAttribute("before_status",before_status);
		
		return "/user/note/read";
	}
	
	@RequestMapping("/user/note/remove")
	public String remove(String note_receiver,int note_id, RedirectAttributes rttr, SearchCriteria cri)throws Exception {
		noteService.remove(note_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("msg", "SUCCESS");
		System.out.println("NoteController 삭제성공");
		
		return "redirect:/user/note/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
		+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
		+"&note_receiver="+note_receiver;
	}
	
	//------------------------------------company----------------------------------------
	
	@RequestMapping(value="/company/note/register", method= RequestMethod.POST)
	public @ResponseBody String registerCom(NoteVO noteVo)throws Exception {
		System.out.println("NoteController registerCom");
		
		notecomService.regist(noteVo);
		
		
		return "success";
		
	}
	
	//고치기
	@RequestMapping("/company/note/list")
	public String listCom(SearchCriteria cri, Model model, HttpSession session)throws Exception{
		String note_receiver= (String) session.getAttribute("company_login_member_id");
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(notecomService.listSearchCount(cri, note_receiver));
		
		int statusCount=noteService.statusCount(note_receiver);
		session.setAttribute("statusCount" ,statusCount);//읽지 않은 쪽지 갯수 조회 
		
		model.addAttribute("list",notecomService.listSearchCriteria(cri, note_receiver));
		model.addAttribute("cri",cri);
		model.addAttribute("pageMaker",maker);
		
		return "company/note/list";
	}
	
	@RequestMapping("/company/note/read")
	public String readCom(Model model, SearchCriteria cri,NoteVO noteVo )throws Exception{
		String  before_status = noteVo.getNote_status();
		System.out.println("쪽지읽기 (상태) : "+ before_status);
		
		noteVo= notecomService.read(noteVo.getNote_id(), noteVo);
		System.out.println("noteVo"+noteVo);
		
		model.addAttribute("note",noteVo);
		model.addAttribute("cri",cri);
		
		model.addAttribute("before_status",before_status);
		
		return "/company/note/read";
	}
	
	@RequestMapping("/company/note/remove")
	public String removeCom(String note_receiver,int note_id, RedirectAttributes rttr, SearchCriteria cri)throws Exception {
		noteService.remove(note_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("msg", "SUCCESS");
		System.out.println("NoteController 삭제성공");
		
		return "redirect:/company/note/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
		+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
		+"&note_receiver="+note_receiver;
	}
	
	
}
