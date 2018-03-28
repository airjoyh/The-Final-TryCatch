package kr.co.trycatch.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.trycatch.domain.user.PageMaker;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.domain.user.ZzimVO;
import kr.co.trycatch.service.user.ZzimService;

@Controller
public class ZzimController {

	@Inject
	private ZzimService zzimService;
	
	@RequestMapping(value="/user/review/list", method=RequestMethod.POST)
	public String insert( ZzimVO zzimVo,String company_id, Model model, RedirectAttributes rttr)throws Exception {
		System.out.println("zzimController>> zzimVo :"+zzimVo);
		zzimService.insert(zzimVo);
	    
		   
		return "redirect:/user/review/list?company_id="+zzimVo.getZzim_selected();
		
		/*if(zzimService.insert(zzimVo)) {//찜하기
		String zzim_select = zzimVo.getZzim_select();
	
		    return "redirect:/ing/zzimlist?zzim_select="+zzim_select;
		}else {//중복된 찜이 존재한다면 
			rttr.addFlashAttribute("msg", "이미 찜이되어있습니다.");
			return "redirect:/user/review/list?company_id="+company_id;
			}*/
   }

	@RequestMapping("/user/zzimlist")
	public String list(SearchCriteria cri, Model model, HttpSession session)throws Exception{
		System.out.println("zzimController list");
		String zzim_select= (String) session.getAttribute("user_login_id");
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(zzimService.totalCnt(cri, zzim_select));
		
		System.out.println("찜한 숫자 >>> "+zzimService.totalCnt(cri, zzim_select));
		
		model.addAttribute("zzimList",zzimService.listCriteria(cri, zzim_select));
		model.addAttribute("cri",cri);
		model.addAttribute("pageMaker",maker);
		
		System.out.println(cri);
		System.out.println(maker);
		
		return "/user/zzimlist";
	}
	
	

	@RequestMapping("/remove")
	public String remove(ZzimVO zzimVo ,SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		zzimService.deletezzim(zzimVo);
		
		int company_id= zzimVo.getZzim_selected();
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("msg","SUCCESS");
		System.out.println("zzimController 삭제성공");
		
		//return "redirect:/ing/zzimlist?zzim_select="+zzim_select;
			return "redirect:/user/review/list?company_id="+zzimVo.getZzim_selected();
	}

	@RequestMapping("/zziminout")
	public @ResponseBody String test2(int zzim_selected,String zzim_select)throws Exception {
		System.out.println("zzim_selected:"+ zzim_selected+", zzim_select:"+ zzim_select);
		
		if(zzimService.countzzim(zzim_selected, zzim_select)) { 
			return "exist";
		   }
		return "notexist";
	}
	//---------------------------------company------------------------------------------------------------
	
	@RequestMapping(value="/com/port/list", method=RequestMethod.POST)
	public String cominsert( ZzimVO zzimVo, Model model, RedirectAttributes rttr)throws Exception {
		System.out.println("CompanyzzimController>> zzimVo :"+zzimVo);
		zzimService.insert(zzimVo);
	    
		   
		return "redirect:/company/personSearch/read?port_id="+zzimVo.getZzim_selected();
		
   }
	
	@RequestMapping("/com/port/zzimlist")
	public String comlist(Model model, SearchCriteria cri, HttpSession session)throws Exception{
		System.out.println("ComzzimController list");
		String zzim_select= (String) session.getAttribute("company_login_member_id");

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(zzimService.totalCnt(cri, zzim_select));
		System.out.println("찜한 숫자 >>> "+zzimService.totalCnt(cri, zzim_select));
		
		model.addAttribute("comzzimList",zzimService.ComlistCriteria(cri, zzim_select));
		model.addAttribute("cri",cri);
		model.addAttribute("pageMaker",maker);

		return "/company/zzimlist";
	}
	
	@RequestMapping("/com/port/remove")
	public String comremove(ZzimVO zzimVo , SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		zzimService.deletezzim(zzimVo);
		//String zzim_select= zzimVo.getZzim_select();
		int port_id= zzimVo.getZzim_selected();
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("msg","SUCCESS");
		System.out.println("zzimController 삭제성공");
		
		//return "redirect:/ing/zzimlist?zzim_select="+zzim_select;
		return "redirect:/company/personSearch/read?port_id="+zzimVo.getZzim_selected();
	}

	@RequestMapping("/com/port/zziminout")
	public @ResponseBody String comtest2(int zzim_selected,String zzim_select)throws Exception {
		System.out.println("zzim_selected:"+ zzim_selected+", zzim_select:"+ zzim_select);
		
		if(zzimService.countzzim(zzim_selected, zzim_select)) { 
			return "exist";
		}
		return "notexist";
	}
}
