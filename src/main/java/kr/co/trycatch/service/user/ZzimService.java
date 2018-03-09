package kr.co.trycatch.service.user;

import java.util.List;
import java.util.Map;

import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.domain.user.ZzimVO;

public interface ZzimService {

	public boolean insert(ZzimVO zzimVo) throws Exception;
	
	public List<ZzimVO> list(String zzim_select)throws Exception;
	
	public void deletezzim(ZzimVO zzimVo)throws Exception;//찜하기 취소

	public List<Map<String, Object>> listSearchCriteria(SearchCriteria cri, String zzim_select)throws Exception;
	
    public int totalCnt(SearchCriteria cri)throws Exception;
    
    public boolean countzzim(int zzim_selected, String zzim_select)throws Exception;//동일한 찜 레코드 확인 

}
