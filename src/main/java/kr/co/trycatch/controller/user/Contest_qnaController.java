package kr.co.trycatch.controller.user;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.trycatch.domain.user.Contest_qnaVO;
import kr.co.trycatch.domain.user.NoteVO;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.Contest_qnaService;

@Controller
@RequestMapping("/user/contest/qna")
public class Contest_qnaController {

	@Inject
	private Contest_qnaService contest_qnaService;
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerGET(@RequestParam("contest_id") String contest_id, Model model) throws Exception{
		System.out.println("Contest_qnaController registerGET()");
		model.addAttribute("contest_id", contest_id);
		
		return "/user/contest/qna/register";
		//return "/ing/cont_qna_register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST )
	public String registerPost(Contest_qnaVO contest_qnaVo) throws Exception{
		System.out.println("Contest_qnaController registerPost()");
		contest_qnaService.regist(contest_qnaVo);
		System.err.println(contest_qnaVo);
		int contest_id = contest_qnaVo.getContest_id();
		
		return "redirect:/user/contest/qna/list?contest_id="+contest_id;
		//return "redirect:/ing/cont_qna_sw?contest_id="+contest_id;
	}

	@RequestMapping(value="/list")//��� ����
	public String list(@RequestParam("contest_id") int contest_id,SearchCriteria cri, Model model) throws Exception{
		System.out.println("Contest_qnaController list()");
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(contest_qnaService.listSearchCount(cri, contest_id));
		model.addAttribute("list", contest_qnaService.listSerachCriteria(cri, contest_id));
		model.addAttribute("Cri", cri);//����������, �������� ���ڵ��, �˻�Ÿ��, �˻���
		model.addAttribute("PageMaker", maker);
		
		System.out.println(cri);
		System.out.println("�˻��� ���� �� >>> "+contest_qnaService.listSearchCount(cri, contest_id));	
		
		  return "user/contest/qna/list";
		  //return "/ing/cont_qna_sw";
	}
	
	@RequestMapping(value="/read")
	public String read(@RequestParam("contest_id") String contest_id,@RequestParam("qna_no") int qna_no, Model model, SearchCriteria cri) throws Exception{
		System.out.println("Contest_qnaController read() ���� �۹�ȣ>>"+qna_no);
		System.out.println("cri"+cri);
		Contest_qnaVO vo = contest_qnaService.read(qna_no);
		//NoteVO noteVo= contest_qnaService.note();
		System.out.println("Contest_qnaVO : "+ vo);
		model.addAttribute("contest_qna",vo);
		model.addAttribute("cri",cri);
		//model.addAttribute("note", noteVo);
		
		//��� �� �������°ǵ� ȭ���� �����ŷ����ϴµ� ����� ajax�� ó���߱� ������ ��� �߰� �����ϸ� �ݿ��̾ȵ�. ȭ�� ���ΰ�ħ�ؾ���.
		//model.addAttribute("review_replyCount", review_replyService.count(review_no));
		
		    return "/user/contest/qna/read";
		  //return "/ing/cont_qna_read";
				
	}
	

	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String modifyGET(int qna_no, Model model, @ModelAttribute("cri") SearchCriteria cri)throws Exception{
						//������ �Ķ���Ͱ� no�̱� ������(review_no�� �ƴ϶�)
		System.out.println("Contest_qnaController modifyGET()");
		System.out.println("qna_no = "+qna_no);
		model.addAttribute("contest_qna",contest_qnaService.read(qna_no));
		
		      return "/user/contest/qna/modify";
		    //return "/ing/cont_qna_modify";
	}

	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPOST(String contest_id,Contest_qnaVO contest_qnaVo, RedirectAttributes rttr, SearchCriteria cri) throws Exception{
		System.out.println("Contest_qnaController modifyPOST()");
		
		contest_qnaService.modify(contest_qnaVo);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		
		 return "redirect:/user/contest/qna/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
		 +"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
		 +"&contest_id="+contest_id;
		/*return "redirect:/ing/cont_qna_sw?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
		+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
		+"&contest_id="+contest_id;*/
	}

	@RequestMapping("/remove")
	public String remove(@RequestParam("contest_id") String contest_id,int qna_no, RedirectAttributes rttr, SearchCriteria cri)throws Exception{
		System.out.println("Contest_qnaController remove()");
		contest_qnaService.remove(qna_no);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("msg","SUCCESS");
		System.out.println("Contest_qnaController ��������");
		
		 return "redirect:/user/contest/qna/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
						+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
						+"&contest_id="+contest_id;
		/*return "redirect:/ing/cont_qna_sw?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
		+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
		+"&contest_id="+contest_id;*/
	}
}
