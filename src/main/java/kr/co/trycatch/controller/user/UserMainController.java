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
	//�ϴ� �������������� ���̴� ��ư���� Ŭ�������� ���� ���������� ���⿡ �����س�����
	//���߿� ��Ʈ�ѷ����� ������ ����� �װ����� �ҷ������.
	//���߿� �� ��Ʈ�ѷ��� ���� ����Ʈ ���� �͵��� �����ٶ� �ƴϸ� ����� ����
	
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
