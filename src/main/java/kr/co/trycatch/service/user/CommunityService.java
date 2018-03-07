package kr.co.trycatch.service.user;


import java.util.List;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;


public interface CommunityService {

	public void regist(CommunityVO communityVo) throws Exception;// ���߰�

	public CommunityVO read(int community_no) throws Exception;//�� �Ѱ� ��ȸ

	public List<CommunityVO> listAll() throws Exception;//��ü�� ��ȸ

	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;//Ư�� ������ ��ȸ

	
	
}
