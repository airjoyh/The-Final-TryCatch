package kr.co.trycatch.domain.user;

import java.sql.Date;

public class ReviewVO {
	private int review_no;
	private String review_title;
	private String review_writer;
	private int review_possibility;
	private int review_welSal;
	private int review_balance;
	private int review_culture;
	private int review_manager;
	private String review_strong;
	private String review_weak;
	private String review_toCEO;
	private Date review_wdate;
	private int review_viewCount;
	private int review_replyCount;
	private int company_id;
	private String user_id;

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public int getReview_possibility() {
		return review_possibility;
	}

	public void setReview_possibility(int review_possibility) {
		this.review_possibility = review_possibility;
	}

	public int getReview_welSal() {
		return review_welSal;
	}

	public void setReview_welSal(int review_welSal) {
		this.review_welSal = review_welSal;
	}

	public int getReview_balance() {
		return review_balance;
	}

	public void setReview_balance(int review_balance) {
		this.review_balance = review_balance;
	}

	public int getReview_culture() {
		return review_culture;
	}

	public void setReview_culture(int review_culture) {
		this.review_culture = review_culture;
	}

	public int getReview_manager() {
		return review_manager;
	}

	public void setReview_manager(int review_manager) {
		this.review_manager = review_manager;
	}

	public String getReview_strong() {
		return review_strong;
	}

	public void setReview_strong(String review_strong) {
		this.review_strong = review_strong;
	}

	public String getReview_weak() {
		return review_weak;
	}

	public void setReview_weak(String review_weak) {
		this.review_weak = review_weak;
	}

	public String getReview_toCEO() {
		return review_toCEO;
	}

	public void setReview_toCEO(String review_toCEO) {
		this.review_toCEO = review_toCEO;
	}

	public Date getReview_wdate() {
		return review_wdate;
	}

	public void setReview_wdate(Date review_wdate) {
		this.review_wdate = review_wdate;
	}

	public int getReview_viewCount() {
		return review_viewCount;
	}

	public void setReview_viewCount(int review_viewCount) {
		this.review_viewCount = review_viewCount;
	}

	public int getReview_replyCount() {
		return review_replyCount;
	}

	public void setReview_replyCount(int review_replyCount) {
		this.review_replyCount = review_replyCount;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", review_title=" + review_title + ", review_writer="
				+ review_writer + ", review_possibility=" + review_possibility + ", review_welSal=" + review_welSal
				+ ", review_balance=" + review_balance + ", review_culture=" + review_culture + ", review_manager="
				+ review_manager + ", review_strong=" + review_strong + ", review_weak=" + review_weak
				+ ", review_toCEO=" + review_toCEO + ", review_wdate=" + review_wdate + ", review_viewCount="
				+ review_viewCount + ", review_replyCount=" + review_replyCount + ", company_id=" + company_id
				+ ", user_id=" + user_id + "]";
	}

}
