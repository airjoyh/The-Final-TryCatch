package kr.co.trycatch.persistence.user;

import java.util.List;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Criteria;


public interface CommunityDAO {

	//�߰�
	public void create(CommunityVO communityVo) throws Exception;
	
	//��ȸ
	public List<CommunityVO> listAll() throws Exception;

	// (Ư���Խù� �Ѱ�)��ȸ ---> ���: ������
	public CommunityVO read(int community_no) throws Exception;//

	// (������)��ȸ ---> ���: ����Ʈ
    public List<CommunityVO> listPage(int page) throws Exception;
	
	// (������)��ȸ ---> ���: ����Ʈ
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;//
	
	
}
