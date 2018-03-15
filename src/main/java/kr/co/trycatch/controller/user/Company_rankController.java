package kr.co.trycatch.controller.user;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.Company_rankService;


@Controller
@RequestMapping("/user/com_info")
public class Company_rankController {

	@Inject
	private Company_rankService company_rankService;

	@RequestMapping(value = "/rank")
	public String showRankAll(Model model) throws Exception {
		System.out.println("Company_rankController showRankAll()");
		
		Map<String, Object> map = company_rankService.showRankAll();
		model.addAttribute("total", map.get("totalRank"));
		model.addAttribute("possibility", map.get("possibilityRank"));
		model.addAttribute("welSal", map.get("welSalRank"));
		model.addAttribute("balance", map.get("balanceRank"));
		model.addAttribute("culture", map.get("cultureRank"));
		model.addAttribute("manager", map.get("managerRank"));
		
		return "/user/com_info/rank_new"; //"/user/com_info/rank";
	}
	
	@RequestMapping(value="/list/totalRank")
	public String showTotalRankList(SearchCriteria cri, Model model) throws Exception{
		System.out.println("Company_rankController showTotalRankList()");
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(company_rankService.listSearchCount(cri));
		
		model.addAttribute("list", company_rankService.totalList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+company_rankService.listSearchCount(cri));
		
		model.addAttribute("action", "totalRank");
		
		return "/user/com_info/list_new"; //"/user/com_info/list";
	}
	
	@RequestMapping(value="/list/possibilityRank")
	public String showPossibilityRankList(SearchCriteria cri, Model model) throws Exception{
		System.out.println("Company_rankController showPossibilityRankList()");
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(company_rankService.listSearchCount(cri));
		
		model.addAttribute("list", company_rankService.possibilityList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+company_rankService.listSearchCount(cri));
		
		model.addAttribute("action", "possibilityRank");
		
		return "/user/com_info/list_new";
	}
	
	@RequestMapping(value="/list/welSalRank")
	public String showWelSalRankList(SearchCriteria cri, Model model) throws Exception{
		System.out.println("Company_rankController showWelSalRankList()");
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(company_rankService.listSearchCount(cri));
		
		model.addAttribute("list", company_rankService.welSalList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+company_rankService.listSearchCount(cri));
		
		model.addAttribute("action", "welSalRank");
		
		return "/user/com_info/list_new";
	}
	
	@RequestMapping(value="/list/balanceRank")
	public String showBalanceRankList(SearchCriteria cri, Model model) throws Exception{
		System.out.println("Company_rankController showBalanceRankList()");
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(company_rankService.listSearchCount(cri));
		
		model.addAttribute("list", company_rankService.balanceList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+company_rankService.listSearchCount(cri));
		
		model.addAttribute("action", "balanceRank");
		
		return "/user/com_info/list_new";
	}

	@RequestMapping(value="/list/cultureRank")
	public String showCultureRankList(SearchCriteria cri, Model model) throws Exception{
		System.out.println("Company_rankController showCultureRankList()");
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(company_rankService.listSearchCount(cri));
		
		model.addAttribute("list", company_rankService.cultureList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+company_rankService.listSearchCount(cri));
		
		model.addAttribute("action", "cultureRank");
		
		return "/user/com_info/list_new";
	}
	
	@RequestMapping(value="/list/managerRank")
	public String showManagerRankList(SearchCriteria cri, Model model) throws Exception{
		System.out.println("Company_rankController showManagerRankList()");
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(company_rankService.listSearchCount(cri));
		
		model.addAttribute("list", company_rankService.managerList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", maker);
		System.out.println(cri);
		System.out.println("검색된 글의 수 >>> "+company_rankService.listSearchCount(cri));
		
		model.addAttribute("action", "managerRank");
		
		return "/user/com_info/list_new";
	}
}
