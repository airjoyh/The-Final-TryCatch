package kr.co.trycatch.controller.user;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.ReviewVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.ReviewService;
import kr.co.trycatch.service.user.Review_replyService;

@Controller
@RequestMapping("/user/review")
public class ReviewController {

	@Inject
	private ReviewService reviewService;
	
	@Inject
	private Review_replyService review_replyService;
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerGET(@RequestParam("company_id") String company_id, Model model) throws Exception{
		System.out.println("ReviewController registerGET()");
		model.addAttribute("company_id", company_id);
		
		return "/user/com_info/review/register_new"; //"/user/com_info/review/register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST )
	public String registerPost(ReviewVO reviewVo) throws Exception{
		System.out.println("ReviewController registerPost()");
		reviewService.regist(reviewVo);
		System.err.println(reviewVo);
		int company_id = reviewVo.getCompany_id();
		
		return "redirect:/user/review/list?company_id="+company_id;//"redirect:/user/review/list?company_id="+company_id;
	}
	
	@RequestMapping(value="/list")
	public String list(@RequestParam("company_id") String company_id,SearchCriteria cri, Model model) throws Exception{
		System.out.println("ReviewController list()");
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(reviewService.listSearchCount(cri, company_id));
		model.addAttribute("list", reviewService.listSerachCriteria(cri, company_id));
		model.addAttribute("cri", cri);//현재페이지, 페이지당 레코드수, 검색타입, 검색어
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+reviewService.listSearchCount(cri, company_id));
		
		//기업의 정보
		model.addAttribute("company_info", reviewService.companyInfo(company_id));
		
		//기업의 평균점수
		model.addAttribute("avgScore", reviewService.avgScore(company_id));
		model.addAttribute("total", reviewService.totalAvgScore(company_id));
		
		return "/user/com_info/review/list_new";//"/user/com_info/review/list";
	}
	
	@RequestMapping(value="/read")
	public String read(@RequestParam("company_id") String company_id,@RequestParam("no") int review_no, Model model, SearchCriteria cri) throws Exception{
		System.out.println("ReviewController read()");
		System.out.println("reviewController 읽을 글번호>>"+review_no);
		System.out.println("cri"+cri);
		model.addAttribute("review",reviewService.read(review_no));
		model.addAttribute("cri",cri);
		
		//댓글 수 보여지는건데 화면이 깜빡거려야하는데 댓글을 ajax로 처리했기 때문에 댓글 추가 삭제하면 반영이안됨. 화면 새로고침해야함.
		//model.addAttribute("review_replyCount", review_replyService.count(review_no));
		
		return "/user/com_info/review/read_new"; //"/user/com_info/review/read";
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String modifyGET(int no, Model model, @ModelAttribute("cri") SearchCriteria cri)throws Exception{
						//보내는 파라미터가 no이기 때문에(review_no가 아니라)
		System.out.println("ReviewController modifyGET()");
		System.out.println("review_no = "+no);
		model.addAttribute("review",reviewService.read(no));
		
		return "/user/com_info/review/modify_new";
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPOST(String company_id,ReviewVO reviewVo, RedirectAttributes rttr, SearchCriteria cri) throws Exception{
		System.out.println("ReviewController modifyPOST()");
		
		reviewService.modify(reviewVo);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		
		return "redirect:/user/review/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
		+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
		+"&company_id="+company_id;
	}

	@RequestMapping("/remove")
	public String remove(@RequestParam("company_id") String company_id,int no, RedirectAttributes rttr, SearchCriteria cri)throws Exception{
		System.out.println("ReviewController remove()");
		reviewService.remove(no);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("msg","SUCCESS");
		System.out.println("reviewController 삭제성공");
		
		return "redirect:/user/review/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
						+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
						+"&company_id="+company_id;
	}
	
}
