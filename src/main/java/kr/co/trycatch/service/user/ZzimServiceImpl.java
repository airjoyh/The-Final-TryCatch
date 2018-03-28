package kr.co.trycatch.service.user;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.domain.user.ZzimVO;
import kr.co.trycatch.persistence.user.ZzimDAO;


@Service
public class ZzimServiceImpl implements ZzimService {

	@Inject
	private ZzimDAO zzimDao;

	@Override
	public boolean insert(ZzimVO zzimVo) throws Exception {
		
		 return zzimDao.create(zzimVo);
		
	}

	@Override
	public List<ZzimVO> list(String zzim_select) throws Exception {
	
		return zzimDao.list(zzim_select);
	}


	@Override
	public int totalCnt(SearchCriteria cri) throws Exception {
		
		return zzimDao.totalCnt(cri);
	}

	@Override
	public List<Map<String, Object>> listCriteria(SearchCriteria cri, String zzim_select) throws Exception {

		return zzimDao.listCriteria(cri, zzim_select);
	}

	@Override
	public boolean countzzim(int zzim_selected, String zzim_select) throws Exception {//동일한 찜 레코드 확인 
	
		return zzimDao.countzzim(zzim_selected, zzim_select); //true or false
	}

	@Override
	public void deletezzim(ZzimVO zzimVo) throws Exception {//찜하기 취소
		
		zzimDao.deletezzim(zzimVo);
		
	}

	@Override
	public List<Map<String, Object>> ComlistCriteria(SearchCriteria cri, String zzim_select) throws Exception {
		
		return zzimDao.ComlistCriteria(cri, zzim_select);
	}

	@Override
	public List<ZzimVO> listFive(String zzim_select) throws Exception {
		
		return zzimDao.listFive(zzim_select);
	}

}
