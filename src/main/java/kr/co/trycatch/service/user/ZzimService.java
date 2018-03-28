package kr.co.trycatch.service.user;

import java.util.List;
import java.util.Map;

import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.domain.user.ZzimVO;

public interface ZzimService {

	public boolean insert(ZzimVO zzimVo) throws Exception;
	
	public List<ZzimVO> list(String zzim_select)throws Exception;
	
	public void deletezzim(ZzimVO zzimVo)throws Exception;//���ϱ� ���

	public List<Map<String, Object>> listCriteria(SearchCriteria cri, String zzim_select)throws Exception;
	
	public List<Map<String, Object>> ComlistCriteria(SearchCriteria cri,String zzim_select)throws Exception;
	//����˻��� ���ϱ�
	
    public int totalCnt(SearchCriteria cri, String zzim_select) throws Exception;
    
    public boolean countzzim(int zzim_selected, String zzim_select)throws Exception;//������ �� ���ڵ� Ȯ�� 

	public List<ZzimVO> listFive(String zzim_select) throws Exception;
	
	public List<ZzimVO> ComlistFive(String zzim_select) throws Exception;
}
