package kr.co.trycatch.domain.company;

public class Contest_quizVO {
	private int quiz_id;
	private int contest_id;
	private String quiz_contents;
	private int quiz_no;
	private int quiz_type;
	private int quiz_point;
	private String quiz_correct;
	private String company_name;
	private String contest_title;

	public int getQuiz_id() {
		return quiz_id;
	}

	public void setQuiz_id(int quiz_id) {
		this.quiz_id = quiz_id;
	}

	public int getContest_id() {
		return contest_id;
	}

	public void setContest_id(int contest_id) {
		this.contest_id = contest_id;
	}

	public String getQuiz_contents() {
		return quiz_contents;
	}

	public void setQuiz_contents(String quiz_contents) {
		this.quiz_contents = quiz_contents;
	}

	public int getQuiz_no() {
		return quiz_no;
	}

	public void setQuiz_no(int quiz_no) {
		this.quiz_no = quiz_no;
	}

	public int getQuiz_type() {
		return quiz_type;
	}

	public void setQuiz_type(int quiz_type) {
		this.quiz_type = quiz_type;
	}

	public int getQuiz_point() {
		return quiz_point;
	}

	public void setQuiz_point(int quiz_point) {
		this.quiz_point = quiz_point;
	}

	public String getQuiz_correct() {
		return quiz_correct;
	}

	public void setQuiz_correct(String quiz_correct) {
		this.quiz_correct = quiz_correct;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getContest_title() {
		return contest_title;
	}

	public void setContest_title(String contest_title) {
		this.contest_title = contest_title;
	}

	@Override
	public String toString() {
		return "Contest_quizVO [quiz_id=" + quiz_id + ", contest_id=" + contest_id + ", quiz_contents=" + quiz_contents
				+ ", quiz_no=" + quiz_no + ", quiz_type=" + quiz_type + ", quiz_point=" + quiz_point + ", quiz_correct="
				+ quiz_correct + ", company_name=" + company_name + ", contest_title=" + contest_title + "]";
	}

}
