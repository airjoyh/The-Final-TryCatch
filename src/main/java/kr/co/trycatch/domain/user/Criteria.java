package kr.co.trycatch.domain.user;

public class Criteria {
	private int page; // 현재 페이지
	private int perPageNum; // 한 화면에 보여질 최대 레코드 수

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}// 생성자

	public int getPage() {
		return page;
	}

	public void setPage(int page) {// 변경된 페이지 설정
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {// 화면에 표시될 행의 수 변경
		this.perPageNum = perPageNum;
	}

	public int getPageStart() {
		return (page - 1) * perPageNum;// Mybatis에서 사용될 스킵될 행의 수 구하기
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
