package kr.co.trycatch.domain.user;

import java.sql.Date;

public class Contest_qna_replyVO {

	private int reply_no;
	private String reply_writer;
	private String reply_contents;
	private Date reply_wdate;
	private int qna_no;

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public String getReply_contents() {
		return reply_contents;
	}

	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}

	public Date getReply_wdate() {
		return reply_wdate;
	}

	public void setReply_wdate(Date reply_wdate) {
		this.reply_wdate = reply_wdate;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	@Override
	public String toString() {
		return "Contest_qna_replyVO [reply_no=" + reply_no + ", reply_writer=" + reply_writer + ", reply_contents="
				+ reply_contents + ", reply_wdate=" + reply_wdate + ", qna_no=" + qna_no + "]";
	}

}
