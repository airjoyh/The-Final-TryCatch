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
   } //�Է��� ��û
   
   
   @RequestMapping(value="/register",method= {RequestMethod.POST})
   public String registPost(CommunityVO communityVo, RedirectAttributes rttr) throws Exception{//DB�Է� ��û
	   
      System.out.println("�Է��� ������>>>"+ communityVo);
      
      communityService.regist(communityVo);
      rttr.addFlashAttribute("msg", "SUCCESS");
      
      System.out.println(">>> msg�� SUCCESS����");
      
      return "redirect:list";
   }
  
   
   @RequestMapping("/list")
   public void list(Model model)throws Exception {
	  System.out.println(">>> ��ü�Խù� ��ȸ");
	  
	  model.addAttribute("list", communityService.listAll());
	  
   }
   
   @RequestMapping("/listCri")
   public void listAll(Criteria cri, Model model) throws Exception{
	   System.out.println(">>> Ư�������� �Խù� ��ȸ");
	   model.addAttribute("list", communityService.listCriteria(cri));
   }
   
   @RequestMapping("/read")
   public void read(int community_no, Model model,
		            Criteria cri)throws Exception{
	   System.out.println("���� �۹�ȣ>>>"+community_no);
	   System.out.println("readPage cri>>>"+ cri);
	   model.addAttribute(communityService.read(community_no));
	   model.addAttribute("cri",cri);
   }
   
}
