package kr.co.trycatch.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.trycatch.domain.user.Community_replyVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.Review_replyVO;
import kr.co.trycatch.service.user.Community_replyService;

@RestController
@RequestMapping("/community/reply")
public class Community_replyController {
    
    @Inject
	private Community_replyService community_replyService;
    
    @RequestMapping(value = "", method = RequestMethod.POST)
    public String register(Community_replyVO community_replyVo) throws Exception {
  
    	System.out.println("����Է� >>>"+ community_replyVo);
        community_replyService.addReply(community_replyVo);
		
        return "success";
    }
    
	@RequestMapping(value = "/{community_no}/{page}", method = RequestMethod.GET)
	public Map<String, Object> list(@PathVariable("community_no") int community_no, @PathVariable("page") int page,
			Model model)
			throws Exception {
		System.out.println("Community_replyController list()");
		//model.addAttribute("community_replyCount", community_replyService.count(community_no));
		
		Criteria cri = new Criteria();
		// �⺻��==> page=1, perPageNum=10
		cri.setPage(page);// ==> page=2, perPageNum=10
		cri.setPerPageNum(5);// ==> page=2, perPageNum=5

		List<Community_replyVO> list = community_replyService.list(community_no, cri);// ��� ���

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(community_replyService.count(community_no));// ��µ� ��� �ؿ� ��ȣ ���

		// ��û���������� list������ maker�� ���� ----> �Ѱ��� �̸����� ���� ---> Map���

		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageMaker", maker);

		return map;
	}// listPage
    
	  @RequestMapping(value="/{reply_no}", method={RequestMethod.PUT,RequestMethod.PATCH})
	  public String update(@PathVariable("reply_no") int reply_no, @RequestBody Community_replyVO community_replyVo)throws Exception {
		  community_replyVo.setReply_no(reply_no);
		  System.out.println("replyController ������ ���"+community_replyVo);
		  community_replyService.modify(community_replyVo);
		  
		  return "success";
	  }
	  

	  @RequestMapping(value="/{reply_no}",method= {RequestMethod.DELETE})
	  public String remove(@PathVariable("reply_no") int reply_no)throws Exception {
		  community_replyService.remove(reply_no);
		  System.out.println("replyController ��� ����");
		  
		  return "success";
	  }
   
}
