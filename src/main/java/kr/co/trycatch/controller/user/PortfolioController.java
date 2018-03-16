package kr.co.trycatch.controller.user;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.PortfolioVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.PortfolioService;


@Controller
@RequestMapping("/user/portfolio")
public class PortfolioController {
	
	@Inject
	private PortfolioService portfolioService; 

	@RequestMapping(value="/show",method= RequestMethod.GET)
	public String show(String user_id, Model model) {
		System.out.println("PortfolioController register");
		model.addAttribute("user_id",user_id);
		
		return "user/portfolio/register_new";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(PortfolioVO portfolioVo) throws Exception {
		System.out.println("PortfolioController register()");
		
		portfolioService.regist(portfolioVo);
		
		return "redirect:/user/main";
	}
   
    @RequestMapping("/list")
    public String list(String user_id,SearchCriteria cri, Model model) throws Exception{
    	PageMaker maker = new PageMaker();
    	maker.setCri(cri);
    	
    	return "";
    }
	
}

