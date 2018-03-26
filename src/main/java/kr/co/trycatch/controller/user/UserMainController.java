package kr.co.trycatch.controller.user;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.ZzimService;

@Controller
public class UserMainController {
	//일단 메인페이지에서 보이는 버튼들을 클릭했을때 들어가는 페이지들은 여기에 맵핑해놓았음
	//나중에 컨트롤러들이 여러개 생기면 그곳에서 불러오면됨.
	//나중에 이 컨트롤러는 찜한 리스트 같은 것들을 보여줄때 아니면 사라질 예정
	
	@Inject
	private ZzimService zzimService;
	
	
	@RequestMapping(value = "/user/main", method = RequestMethod.GET)
	public String userMain() throws Exception{
		System.out.println("MainController userMain()");
		return "userMain_new";//"userMain";
	}
	
	@RequestMapping(value = "/user/beforeLogin")
	public String beforeLogin() throws Exception{
		
		return "/user/login_before_new";
	}
	
	@RequestMapping(value = "/user/afterLogin")
	public String afterLogin(String zzim_select,  Model model, SearchCriteria cri) throws Exception{
		 
			System.out.println("UserMainController zzim");
			
			PageMaker maker = new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(zzimService.totalCnt(cri));
			
			model.addAttribute("zzimList",zzimService.listCriteria(cri, zzim_select));
			model.addAttribute("cri",cri);
			model.addAttribute("pageMaker",maker);
			
		return "/user/login_after_new";
	}
	

	@RequestMapping(value = "/user/intro")
	public String goIntro() throws Exception{
		System.out.println("MainController goIntro()");

		return "/user/introduce";
	}

	
	@RequestMapping(value = "/user/faq")
	public String goFaq() throws Exception{
		System.out.println("MainController goFaq()");

		return "user/faq_new";
	}


	@RequestMapping(value = "/company/main")
	public String goCompanyMain() {
		System.out.println("MainController goCompanyMain()");

		return "companyMain_new";//companyMain
	}

}
