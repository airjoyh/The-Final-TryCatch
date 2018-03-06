package kr.co.trycatch.domain.user;

public class SearchCriteria extends Criteria {
	private String searchType; // 예) '타이틀' 기준 검색, '작성자' 기준 검색
	private String keyword; // 검색어 '길'

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return super.toString()+">>> SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
