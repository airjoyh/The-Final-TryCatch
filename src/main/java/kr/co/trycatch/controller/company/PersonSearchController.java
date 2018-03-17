package kr.co.trycatch.controller.company;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.PortfolioService;

@Controller
@RequestMapping("/company/personSearch")
public class PersonSearchController {

	@Inject
	private PortfolioService portfolioService;

	@RequestMapping("/list")
	public String list(String user_id, SearchCriteria cri, Model model) throws Exception {
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(portfolioService.listSearchCount(cri));
		model.addAttribute("list", portfolioService.listSearch(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);

		return "/company/personSearch/list";
	}
	
	@RequestMapping("/read")
	public String read(int port_id, Model model, SearchCriteria cri) throws Exception{
		model.addAttribute("port", portfolioService.read(port_id));
		model.addAttribute("cri", cri);
		
		return "/company/personSearch/com_view_portfolio";
	}

}
