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

import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.Review_replyVO;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.service.user.Review_replyService;

@RestController
@RequestMapping("/review/reply")
public class Review_replyController {

	@Inject
	private Review_replyService review_replyService;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String register(Review_replyVO review_replyVo) throws Exception {
		System.out.println("Review_replyController register()");

		review_replyService.addReply(review_replyVo);
		System.err.println(review_replyVo);

		return "success";
	}

	@RequestMapping(value = "/{review_no}/{page}", method = RequestMethod.GET)
	public Map<String, Object> list(@PathVariable("review_no") int review_no, @PathVariable("page") int page,
			Model model)
			throws Exception {
		System.out.println("Review_replyController list()");
		//model.addAttribute("review_replyCount", review_replyService.count(review_no));
		
		Criteria cri = new Criteria();
		// 기본값==> page=1, perPageNum=10
		cri.setPage(page);// ==> page=2, perPageNum=10
		cri.setPerPageNum(5);// ==> page=2, perPageNum=5

		List<Review_replyVO> list = review_replyService.list(review_no, cri);// 댓글 출력

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(review_replyService.count(review_no));// 출력된 댓글 밑에 번호 출력

		// 요청페이지에게 list정보와 maker를 리턴 ----> 한개의 이름으로 리턴 ---> Map사용

		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageMaker", maker);

		return map;
	}// listPage
	// 댓글달으려고 로그인하면 다시 해당 게시글로 돌아가기.
	

	  @RequestMapping(value="/{reply_no}", method={RequestMethod.PUT,RequestMethod.PATCH})
	  public String update(@PathVariable("reply_no") int reply_no, @RequestBody Review_replyVO review_replyVo)throws Exception {
		  review_replyVo.setReply_no(reply_no);
		  System.out.println("replyController 수정할 댓글"+review_replyVo);
		  review_replyService.modify(review_replyVo);
		  
		  return "success";
	  }
	  
	  @RequestMapping(value="/{reply_no}",method= {RequestMethod.DELETE})
	  public String remove(@PathVariable("reply_no") int reply_no)throws Exception {
		  review_replyService.remove(reply_no);
		  System.out.println("replyController 댓글 삭제");
		  
		  return "success";
	  }

	//이거 만들어야함
	/*@RequestMapping(value = "/goLogin", method = RequestMethod.GET)
	public String loginForAddReply(int bno, SearchCriteria cri, HttpServletRequest request) {
		System.out.println("bno=" + bno);

		String path = "/sboard/readPage?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum() + "&searchType="
				+ cri.getSearchType() + "&keyword=" + cri.getKeyword() + "&bno=" + bno;
		System.out.println("path >>> " + path);
		request.getSession().setAttribute("dest", path);

		return "redirect:/user/login";
	}*/

}
