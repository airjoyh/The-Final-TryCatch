package kr.co.trycatch.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserMainController {
	//�ϴ� �������������� ���̴� ��ư���� Ŭ�������� ���� ���������� ���⿡ �����س�����
	//���߿� ��Ʈ�ѷ����� ������ ����� �װ����� �ҷ������.
	//���߿� �� ��Ʈ�ѷ��� ���� ����Ʈ ���� �͵��� �����ٶ� �ƴϸ� ����� ����
	
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
	public String afterLogin() throws Exception{
		
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
