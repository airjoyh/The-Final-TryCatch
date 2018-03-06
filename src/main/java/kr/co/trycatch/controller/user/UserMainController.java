package kr.co.trycatch.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserMainController {
	//일단 메인페이지에서 보이는 버튼들을 클릭했을때 들어가는 페이지들은 여기에 맵핑해놓았음
	//나중에 컨트롤러들이 여러개 생기면 그곳에서 불러오면됨.
	//나중에 이 컨트롤러는 찜한 리스트 같은 것들을 보여줄때 아니면 사라질 예정
	
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
