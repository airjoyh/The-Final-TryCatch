package kr.co.trycatch.persistence.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.trycatch.domain.user.SearchCriteria;
import kr.co.trycatch.domain.user.ZzimVO;

@Repository
public class ZzimDAOImpl implements ZzimDAO{

	@Inject
	private SqlSession session;

	@Override
	public boolean create(ZzimVO zzimVo) {
	    try {
	    	session.insert("zzim.create", zzimVo);
	    	return true;
	    }catch(Exception e){
	    	return false;	       
	    }		
	}

	@Override
	public List<ZzimVO> list(String zzim_select) throws Exception {
		
		return session.selectList("zzim.list",zzim_select);
	}

	@Override
	public int totalCnt(SearchCriteria cri) throws Exception {
		
		return session.selectOne("zzim.totalCnt");
	}

	@Override
	public List<Map<String, Object>> listCriteria(SearchCriteria cri, String zzim_select) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		List<Map<String, Object>> list = session.selectList("zzim.listAll", zzim_select, bounds);
		//Map: select com.company_name, zim.zzim_no 
		System.out.println("list>>>>>"+list);
		return list;
	}

	@Override
	public boolean countzzim(int zzim_selected, String zzim_select) throws Exception {//동일한 찜 레코드 확인 
		
		Map<String, Object> map = new HashMap<>();
		 map.put("zzim_select", zzim_select);
		 map.put("zzim_selected", zzim_selected);
		 int row= session.selectOne("zzim.countzzim", map);
		 if(row>0) return true; //찜한 행이 존재 했을 때 리턴 true
			 
		return false;
	}

	@Override
	public void deletezzim(ZzimVO zzimVo) throws Exception {//찜하기 취소
	    session.delete("zzim.deletezzim", zzimVo);
	}

	@Override
	public List<Map<String, Object>> ComlistCriteria(SearchCriteria cri, String zzim_select) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		List<Map<String, Object>> list = session.selectList("zzim.ComlistAll", zzim_select, bounds);
	
		return list;
	}
	
	
}
