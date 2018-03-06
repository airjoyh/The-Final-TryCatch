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
	public void testCreate() throws Exception {// �۾��� �׽�Ʈ
		// BoardVO vo = new BoardVO(bno, title, content, writer, regdate, viewcnt);
		BoardVO vo = new BoardVO(0, "��Ÿ��Ʋ", "���ο� ��", "ȫ�浿", null, 0, null);
		dao.create(vo);
		System.out.println("DB�Է¼���!!");
	}

	// List<BoardVO> list= dao.listAll();
	// session.selectList("board.listAll");
	// session.selectList(String ���̵��,Object ���޵�����, RowBounds��ü)

	// RowBounds bound = new RowBounds(int offset,int limit);
	// offset: skip�Ǵ� ���� ��, limit: ��ȸ�� �ִ� ���� ��
	// RowBounds bound = new RowBounds(0,10);
	@Test
	public void testBoardSelectAll() throws Exception {
		RowBounds bound = new RowBounds(10, 10);
		List<BoardVO> list = session.selectList("board.listAll", null, bound);
		System.out.println("��ȸ ��(RowBounds���)!!" + list);
	}

	@Test
	public void testBoardSelectAll2() throws Exception {
		// List<BoardVO> list= dao.listAll();
		List<BoardVO> list = session.selectList("board.listAll2");
		System.out.println("��ȸ ��(�����������)!!" + list);
	}

	@Test
	public void testListPage() throws Exception {
		List<BoardVO> list = dao.listPage(1);
		// System.out.println(list);
		for (BoardVO board : list) {
			System.out.println("�۹�ȣ: " + board.getBno());
		}
	}

	@Test
	public void testListCriteria() throws Exception {

		Criteria cri = new Criteria();
		cri.setPage(2); // display ������ (�⺻��:1)
		cri.setPerPageNum(5); // ��ȭ�鿡 ������ ���ڵ� �� (�⺻��:10)

		List<BoardVO> list = dao.listCriteria(cri);
		// System.out.println(list);
		for (BoardVO board : list) {
			System.out.println("�۹�ȣ: " + board.getBno());
		}
	}*/

}
