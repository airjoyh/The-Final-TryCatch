package kr.co.trycatch.controller.user;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.CommunityService;


@Controller
@RequestMapping("/user/community")
public class CommunityController {
   
   
   private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
   @Inject
   private CommunityService communityService;

  // @Inject
  // private Review_replyService review_replyService;
  
   @RequestMapping(value="/register",method= {RequestMethod.POST})
   public String registerPost(CommunityVO communityVo, RedirectAttributes rttr) throws Exception{
	   
	   logger.info("DB�Է� ��û........");
	   System.out.println("�Էµ�����>>>"+ communityVo);
	   
	   communityService.regist(communityVo);
	   
	   rttr.addFlashAttribute("msg","SUCCESS");
	   
	   System.out.println(">>> msg�� SUCCESS����");
	   
	   return "redirect:/user/community/list";
   }
   
   @RequestMapping("/list")
   public String listPage(SearchCriteria cri, Model model) throws Exception{
	   PageMaker maker = new PageMaker();
	   maker.setCri(cri);
	   maker.setTotalCount(communityService.listSearchCount(cri));
	   
	   model.addAttribute("list", communityService.listSearchCriteria(cri));
	   
	   model.addAttribute("cri", cri);
	   model.addAttribute("pageMaker", maker);
	   
	   return "/user/community/list";
   }
   
   @RequestMapping(value="/register",method=RequestMethod.GET)
   public void registGET() throws Exception{
	   logger.info("�Է��� ��û........");
	   
   }
   
   
   @RequestMapping(value="/read", method=RequestMethod.GET)
   public void read(@RequestParam("community_no") int community_no,
		            @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
	   
	   System.out.println("���� �۹�ȣ >>>"+ community_no);
	   System.out.println("read cri >>>"+ cri);
	   model.addAttribute("community",communityService.read(community_no));//communityVO   "community" ===> communityVo�� �̸� �ο����ֱ�
	   //CommunityVO cv = communityService.read(community_no);                                              (community.community.community_writer)
	   //System.out.println(cv);
	   //�ڷᰡ DB�� insert�Ǵ��� Ȯ���۾�
	   //communityService.community_viewCount(community_no);
   }
   
   @RequestMapping(value="/modify",method=RequestMethod.GET)
   public String modifyPagingGet(int community_no, Model model,
		           @ModelAttribute("cri") Criteria cri)throws Exception{

	      model.addAttribute("community", communityService.read(community_no));
      
	      return "/user/community/modify";
   }
   
   @RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPagingPost(CommunityVO communityVo, 
							SearchCriteria cri,
						RedirectAttributes rttr)
			                                            throws Exception{//DB���� ��û
	    communityService.modify(communityVo);
		//������ ���â���� �̵�
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		//������ ������ ������ listPage.jsp���� ����
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/user/community/list";
	}
   
   @RequestMapping(value="/remove")
	public String remove(int community_no, RedirectAttributes attr) throws Exception{
	    communityService.remove(community_no);
		//������ ���â���� �̵�
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/user/community/list";
	}
     

   
}
