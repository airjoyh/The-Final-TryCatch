package kr.co.trycatch.service.user;


import java.util.List;
import java.util.Map;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.SearchCriteria;

public interface CommunityService {

	public void regist(CommunityVO communityVo) throws Exception;// �� �߰�

	public void modify(CommunityVO communityVo) throws Exception;// �� ����
	
	public void remove(int community_no) throws Exception;// �� ����
	
	public CommunityVO read(int community_no) throws Exception;//�� �Ѱ� ��ȸ

	public List<CommunityVO> listAll() throws Exception;//��ü�� ��ȸ
    
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;//Ư�� ������ ��ȸ
	
	public List<CommunityVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	// �˻��� ��ġ�ϴ� �۵��� ��ȸ
	
	public int listSearchCount(SearchCriteria cri)throws Exception;// �˻��� ��ġ�ϴ� ���ڵ� ��ü ��
    
	//public Map<String, Object> listFinal(SearchCriteria cri) throws Exception;
	
	

	
	
}
