package kr.co.trycatch.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.trycatch.domain.user.Contest_qna_replyVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.Contest_qnaService;
import kr.co.trycatch.service.user.Contest_qna_replyService;


@RestController
@RequestMapping("/review/qna_reply")
public class Contest_qna_replyController {

	@Inject
	private Contest_qna_replyService qna_replyService;

	@Inject
	private Contest_qnaService qnaService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String register(Contest_qna_replyVO qna_replyVo) throws Exception {
		System.out.println("Contest_qna_replyController register()");

		qna_replyService.addReply(qna_replyVo);
		System.err.println(qna_replyVo);

		return "success";
	}
	
	@RequestMapping(value = "/{qna_no}/{page}", method = RequestMethod.GET)
	public Map<String, Object> list(@PathVariable("qna_no") int qna_no, @PathVariable("page") int page,
			Model model)
			throws Exception {
		System.out.println("Contest_qna_replyController list()");
		
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(5);

		List<Contest_qna_replyVO> list = qna_replyService.list(qna_no, cri);// ´ñ±Û Ãâ·Â

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(qna_replyService.count(qna_no));// Ãâ·ÂµÈ ´ñ±Û ¹Ø¿¡ ¹øÈ£ Ãâ·Â

		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageMaker", maker);

		return map;
	}
	
	  @RequestMapping(value="/{reply_no}", method={RequestMethod.PUT,RequestMethod.PATCH})
	  public String update(@PathVariable("reply_no") int reply_no, @RequestBody Contest_qna_replyVO qna_replyVo)throws Exception {
		  qna_replyVo.setReply_no(reply_no);
		  System.out.println("Contest_qna_replyController ¼öÁ¤ÇÒ ´ñ±Û"+qna_replyVo);
		  qna_replyService.modify(qna_replyVo);
		  
		  return "success";
	  }
	  
	  @RequestMapping(value="/{reply_no}",method= {RequestMethod.DELETE})
	  public String remove(@PathVariable("reply_no") int reply_no)throws Exception {
		  qna_replyService.remove(reply_no);
		  System.out.println("Contest_qna_replyController ´ñ±Û »èÁ¦");
		  
		  return "success";
	  }

	 /* //login please
		@RequestMapping(value = "/goLogin", method = RequestMethod.GET)
		public String loginForAddReply(SearchCriteria cri, HttpServletRequest request, int contest_id) {
			System.out.println("contest_id=" + contest_id);

			String path = "/user/contest/qna/read?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum() + "&searchType="
					+ cri.getSearchType() + "&keyword=" + cri.getKeyword() + "&contest_id=" + contest_id;
			System.out.println("path >>> " + path);
			request.getSession().setAttribute("dest", path);

			return "redirect:/userMain";
		}*/
	
}
