package kr.co.trycatch.domain.company;

public class Company_infoVO {

	private int company_id;
	private String member_id;
	private String company_name;
	private String company_year;
	private String company_line;
	private String company_size;
	private String company_turnover;
	private String company_number;
	private String company_addr;
	private String company_site;
	private String company_intro;

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_year() {
		return company_year;
	}

	public void setCompany_year(String company_year) {
		this.company_year = company_year;
	}

	public String getCompany_line() {
		return company_line;
	}

	public void setCompany_line(String company_line) {
		this.company_line = company_line;
	}

	public String getCompany_size() {
		return company_size;
	}

	public void setCompany_size(String company_size) {
		this.company_size = company_size;
	}

	public String getCompany_turnover() {
		return company_turnover;
	}

	public void setCompany_turnover(String company_turnover) {
		this.company_turnover = company_turnover;
	}

	public String getCompany_number() {
		return company_number;
	}

	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}

	public String getCompany_addr() {
		return company_addr;
	}

	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}

	public String getCompany_site() {
		return company_site;
	}

	public void setCompany_site(String company_site) {
		this.company_site = company_site;
	}

	public String getCompany_intro() {
		return company_intro;
	}

	public void setCompany_intro(String company_intro) {
		this.company_intro = company_intro;
	}

	@Override
	public String toString() {
		return "Company_infoVO [company_id=" + company_id + ", member_id=" + member_id + ", company_name="
				+ company_name + ", company_year=" + company_year + ", company_line=" + company_line
				+ ", company_size=" + company_size + ", company_turnover="
				+ company_turnover + ", company_number=" + company_number + ", company_addr=" + company_addr
				+ ", company_site=" + company_site + ", company_intro=" + company_intro + "]";
	}

}
