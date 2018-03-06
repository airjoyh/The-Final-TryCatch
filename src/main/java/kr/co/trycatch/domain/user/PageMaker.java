package kr.co.trycatch.domain.user;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	/*
	 * listPage.jsp페이지 하단에 출력될 번호를 계산해 주는 클래스
	 * 
	 * 예) 총 레코드 수 : 123개
	 * 
	 * 하단출력1) 현재페이지 : 3페이지 1 2 3 4 5 6 7 8 9 10 >>
	 * 
	 * 하단출력2) 현재페이지 : 11페이지 << 11 12 13
	 */

	private int totalCount; // 총레코드수: 123
	private int startPage; // 1 또는 11
	private int endPage; // 10 또는 13
	private boolean prev; // '<<'
	private boolean next; // '>>'
	private int displayPageNum = 10;// 1 2 3 4 5 6 7 8 9 10
									// 11 12 13 14 15 16 17 18 19 20

	private Criteria cri;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	private void calcData() {// (하단 번호에 대한)데이터 계산
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		// 11 / 10 ==> 1.1 ==> 2 * 10
		startPage = endPage - (displayPageNum - 1);// 20-9 = 21;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		// 123 / 10 ---> 12.3 ---> 13
		if (endPage > tempEndPage) { // 20>13
			endPage = tempEndPage;
		}
		prev = (startPage == 1) ? false : true;
		next = (endPage * cri.getPerPageNum() >= totalCount) ? false : true;
	}// calcData

	public String makeQuery(int page) {
		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("page", page) // ?page=3
				.queryParam("perPageNum", cri.getPerPageNum())// ?page=3&perPageNum=10
				.build();
		return uri.toUriString(); // "?page=3&perPageNum=10"
	}// makeQuery

	public String makeSearch(int page) {
		SearchCriteria scri = (SearchCriteria) cri;

		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("page", page) // ?page=3
				.queryParam("perPageNum", cri.getPerPageNum())// ?page=3&perPageNum=10
				.queryParam("searchType", scri.getSearchType())
				.queryParam("keyword", scri.getKeyword())
				.build();
		
		return uri.toUriString(); // "?page=3&perPageNum=10"
	}// makeSearch

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", cri=" + cri + "]";
	}

}