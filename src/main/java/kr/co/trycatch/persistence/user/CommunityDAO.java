package kr.co.trycatch.persistence.user;

import java.util.List;
import java.util.Map;

import kr.co.trycatch.domain.user.CommunityVO;
import kr.co.trycatch.domain.user.Contest_qnaVO;
import kr.co.trycatch.domain.user.Criteria;
import kr.co.trycatch.domain.user.SearchCriteria;


public interface CommunityDAO {

	// �߰�
	public void create(CommunityVO communityVo) throws Exception;
	
	// ����
	public void update(CommunityVO communityVo) throws Exception;
	
	// (Ư�� �Խù� �Ѱ�) ����
	public void delete(int community_no) throws Exception;
	
	// (Ư���Խù� �Ѱ�)��ȸ ---> ���: ������
	public CommunityVO read(int community_no) throws Exception;//

	// (��ü�Խù�)��ȸ ----> ���: ����Ʈ
	public List<CommunityVO> listAll(SearchCriteria cri) throws Exception;

	// �˻�� ���� (������)��ȸ: �Ѻ�
	public List<CommunityVO> listSearch(SearchCriteria cri) throws Exception;
	
	// �˻�� ���� (������)��ȸ�� ��ü ���ڵ� ��: �Ѻ�
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCount(int community_no, int i) throws Exception;

	public void updateViewCount(int community_no) throws Exception;
	
		
		
		
		
		
		
	
	
}
