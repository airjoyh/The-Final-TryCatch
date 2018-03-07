package kr.co.trycatch.domain.company;

import java.sql.Date;

public class ContestVO {
	private int contest_id;
	private int company_id;
	private String contest_title;
	private Date contest_startDate;
	private Date contest_endDate;
	private String contest_field;
	private int contest_hireNumber;
	private String contest_contents;
	private String manager_name;
	private String team_name;
	private String manager_email;
	private String manager_tel;

	public int getContest_id() {
		return contest_id;
	}

	public void setContest_id(int contest_id) {
		this.contest_id = contest_id;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getContest_title() {
		return contest_title;
	}

	public void setContest_title(String contest_title) {
		this.contest_title = contest_title;
	}

	public Date getContest_startDate() {
		return contest_startDate;
	}

	public void setContest_startDate(Date contest_startDate) {
		this.contest_startDate = contest_startDate;
	}

	public Date getContest_endDate() {
		return contest_endDate;
	}

	public void setContest_endDate(Date contest_endDate) {
		this.contest_endDate = contest_endDate;
	}

	public String getContest_field() {
		return contest_field;
	}

	public void setContest_field(String contest_field) {
		this.contest_field = contest_field;
	}

	public int getContest_hireNumber() {
		return contest_hireNumber;
	}

	public void setContest_hireNumber(int contest_hireNumber) {
		this.contest_hireNumber = contest_hireNumber;
	}

	public String getContest_contents() {
		return contest_contents;
	}

	public void setContest_contents(String contest_contents) {
		this.contest_contents = contest_contents;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getManager_email() {
		return manager_email;
	}

	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}

	public String getManager_tel() {
		return manager_tel;
	}

	public void setManager_tel(String manager_tel) {
		this.manager_tel = manager_tel;
	}

	@Override
	public String toString() {
		return "ContestVO [contest_id=" + contest_id + ", company_id=" + company_id + ", contest_title=" + contest_title
				+ ", contest_startDate=" + contest_startDate + ", contest_endDate=" + contest_endDate
				+ ", contest_field=" + contest_field + ", contest_hireNumber=" + contest_hireNumber
				+ ", contest_contents=" + contest_contents + ", manager_name=" + manager_name + ", team_name="
				+ team_name + ", manager_email=" + manager_email + ", manager_tel=" + manager_tel + "]";
	}

}
