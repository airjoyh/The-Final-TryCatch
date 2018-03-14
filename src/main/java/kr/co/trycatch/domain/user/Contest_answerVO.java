package kr.co.trycatch.domain.user;

public class Contest_answerVO {
	private int answer_no;
	private String answer_contents;
	private String user_id;
	private int quiz_id;
	private String code;
	private int score;
	private int totalScore;
	private int rank;

	public int getAnswer_no() {
		return answer_no;
	}

	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}

	public String getAnswer_contents() {
		return answer_contents;
	}

	public void setAnswer_contents(String answer_contents) {
		this.answer_contents = answer_contents;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getQuiz_id() {
		return quiz_id;
	}

	public void setQuiz_id(int quiz_id) {
		this.quiz_id = quiz_id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "Contest_answerVO [answer_no=" + answer_no + ", answer_contents=" + answer_contents + ", user_id="
				+ user_id + ", quiz_id=" + quiz_id + ", code=" + code + ", score=" + score + ", totalScore="
				+ totalScore + ", rank=" + rank + "]";
	}

}
