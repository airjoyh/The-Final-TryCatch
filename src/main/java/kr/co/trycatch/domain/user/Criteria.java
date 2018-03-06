package kr.co.trycatch.domain.user;

public class Criteria {
	private int page; // ���� ������
	private int perPageNum; // �� ȭ�鿡 ������ �ִ� ���ڵ� ��

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}// ������

	public int getPage() {
		return page;
	}

	public void setPage(int page) {// ����� ������ ����
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {// ȭ�鿡 ǥ�õ� ���� �� ����
		this.perPageNum = perPageNum;
	}

	public int getPageStart() {
		return (page - 1) * perPageNum;// Mybatis���� ���� ��ŵ�� ���� �� ���ϱ�
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
