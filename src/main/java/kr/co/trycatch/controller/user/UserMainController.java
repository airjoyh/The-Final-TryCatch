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
		return "userMain";
	}

	@RequestMapping(value = "/user/intro")
	public String goIntro() throws Exception{
		System.out.println("MainController goIntro()");

		return "introduce";
	}

	/*@RequestMapping(value = "/user/com_info/rank")
	public String goCompanyInfo() throws Exception{
		System.out.println("MainController goCompanyInfo()");

		return "user/com_info/rank";
	}*/

	@RequestMapping(value = "/user/contest/list")
	public String goContest() throws Exception{
		System.out.println("MainController goContest()");

		return "user/contest/list";
	}

	@RequestMapping(value = "/user/community/list")
	public String goCommunity() throws Exception{
		System.out.println("MainController goCommunity()");
		
		return "user/community/list";
	}
	
	@RequestMapping(value = "/user/faq")
	public String goFaq() throws Exception{
		System.out.println("MainController goFaq()");

		return "user/faq";
	}


	@RequestMapping(value = "/company/main")
	public String goCompanyMain() {
		System.out.println("MainController goCompanyMain()");

		return "companyMain";
	}

}
