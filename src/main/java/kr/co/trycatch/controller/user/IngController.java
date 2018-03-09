package kr.co.trycatch.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IngController {
	
	@RequestMapping("/brank")
	public String com_rank_sw() {
		System.out.println("swlee");
		return "/ing/com_rank_sw";
	}
	
	@RequestMapping("/conqna")
	public String contest_qna_sw() {
		System.out.println("swlee");
		return "/ing/cont_qna_sw";
	}
	
	@RequestMapping("/blist")
	public String boardList_sw() {
		System.out.println("swlee");
		return "/ing/boardList_sw";
	}
	
	@RequestMapping("/bread")
	public String boardRead_sw() {
		System.out.println("swlee");
		return "/ing/boardRead_sw";
	}

}
