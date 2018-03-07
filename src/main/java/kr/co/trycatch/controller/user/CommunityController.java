package kr.co.trycatch.controller.user;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.service.user.CommunityService;


@Controller
@RequestMapping("/user/community")
public class CommunityController {
   
   @Inject
   private CommunityService communityService;
   
   @RequestMapping(value="/register",method= {RequestMethod.GET})
   public String registGET() throws Exception{
	   System.out.println("communityController GET");
	   
	   return "user/community/register";
   } //입력폼 요청
   
   
   @RequestMapping(value="/register",method= {RequestMethod.POST})
   public String registPost(CommunityVO communityVo, RedirectAttributes rttr) throws Exception{//DB입력 요청
	   
      System.out.println("입력한 데이터>>>"+ communityVo);
      
      communityService.regist(communityVo);
      rttr.addFlashAttribute("msg", "SUCCESS");
      
      System.out.println(">>> msg에 SUCCESS저장");
      
      return "redirect:list";
   }
  
   
   @RequestMapping("/list")
   public void list(Model model)throws Exception {
	  System.out.println(">>> 전체게시물 조회");
	  
	  model.addAttribute("list", communityService.listAll());
	  
   }
   
   @RequestMapping("/listCri")
   public void listAll(Criteria cri, Model model) throws Exception{
	   System.out.println(">>> 특정페이지 게시물 조회");
	   model.addAttribute("list", communityService.listCriteria(cri));
   }
   
   @RequestMapping("/read")
   public void read(int community_no, Model model,
		            Criteria cri)throws Exception{
	   System.out.println("읽은 글번호>>>"+community_no);
	   System.out.println("readPage cri>>>"+ cri);
	   model.addAttribute(communityService.read(community_no));
	   model.addAttribute("cri",cri);
   }
   
}
