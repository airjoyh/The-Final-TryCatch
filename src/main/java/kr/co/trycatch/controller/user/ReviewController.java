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
		model.addAttribute("cri", cri);//����������, �������� ���ڵ��, �˻�Ÿ��, �˻���
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("�˻��� ���� �� >>> "+reviewService.listSearchCount(cri, company_id));
		
		//����� ����
		model.addAttribute("company_info", reviewService.companyInfo(company_id));
		
		//����� �������
		model.addAttribute("avgScore", reviewService.avgScore(company_id));
		model.addAttribute("total", reviewService.totalAvgScore(company_id));
		
		return "/user/com_info/review/list_new";//"/user/com_info/review/list";
	}
	
	@RequestMapping(value="/read")
	public String read(@RequestParam("company_id") String company_id,@RequestParam("no") int review_no, Model model, SearchCriteria cri) throws Exception{
		System.out.println("ReviewController read()");
		System.out.println("reviewController ���� �۹�ȣ>>"+review_no);
		System.out.println("cri"+cri);
		model.addAttribute("review",reviewService.read(review_no));
		model.addAttribute("cri",cri);
		
		//��� �� �������°ǵ� ȭ���� �����ŷ����ϴµ� ����� ajax�� ó���߱� ������ ��� �߰� �����ϸ� �ݿ��̾ȵ�. ȭ�� ���ΰ�ħ�ؾ���.
		//model.addAttribute("review_replyCount", review_replyService.count(review_no));
		
		return "/user/com_info/review/read_new"; //"/user/com_info/review/read";
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String modifyGET(int no, Model model, @ModelAttribute("cri") SearchCriteria cri)throws Exception{
						//������ �Ķ���Ͱ� no�̱� ������(review_no�� �ƴ϶�)
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
		System.out.println("reviewController ��������");
		
		return "redirect:/user/review/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()
						+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword()
						+"&company_id="+company_id;
	}
	
}
