package kr.co.trycatch;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class DAOTest {

	/*@Inject
	private BoardDAO dao;

	@Inject
	private SqlSession session;

	// @Test
	public void testCreate() throws Exception {// 글쓰기 테스트
		// BoardVO vo = new BoardVO(bno, title, content, writer, regdate, viewcnt);
		BoardVO vo = new BoardVO(0, "새타이틀", "새로운 글", "홍길동", null, 0, null);
		dao.create(vo);
		System.out.println("DB입력성공!!");
	}

	// List<BoardVO> list= dao.listAll();
	// session.selectList("board.listAll");
	// session.selectList(String 아이디명,Object 전달데이터, RowBounds객체)

	// RowBounds bound = new RowBounds(int offset,int limit);
	// offset: skip되는 행의 수, limit: 조회할 최대 행의 수
	// RowBounds bound = new RowBounds(0,10);
	@Test
	public void testBoardSelectAll() throws Exception {
		RowBounds bound = new RowBounds(10, 10);
		List<BoardVO> list = session.selectList("board.listAll", null, bound);
		System.out.println("조회 끝(RowBounds사용)!!" + list);
	}

	@Test
	public void testBoardSelectAll2() throws Exception {
		// List<BoardVO> list= dao.listAll();
		List<BoardVO> list = session.selectList("board.listAll2");
		System.out.println("조회 끝(서브쿼리사용)!!" + list);
	}

	@Test
	public void testListPage() throws Exception {
		List<BoardVO> list = dao.listPage(1);
		// System.out.println(list);
		for (BoardVO board : list) {
			System.out.println("글번호: " + board.getBno());
		}
	}

	@Test
	public void testListCriteria() throws Exception {

		Criteria cri = new Criteria();
		cri.setPage(2); // display 페이지 (기본값:1)
		cri.setPerPageNum(5); // 한화면에 보여질 레코드 수 (기본값:10)

		List<BoardVO> list = dao.listCriteria(cri);
		// System.out.println(list);
		for (BoardVO board : list) {
			System.out.println("글번호: " + board.getBno());
		}
	}*/

}
