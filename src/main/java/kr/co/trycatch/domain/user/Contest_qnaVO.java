package kr.co.trycatch.domain.user;

import java.sql.Date;

public class Contest_qnaVO {
	
	private int qna_no;
    private String qna_writer;
    private String  qna_title;
    private Date qna_wdate;
    private String qna_contents;
    private int  qna_viewCount;
    private int qna_replyCount;
    private int contest_id;
    
       
    
	public int getQna_no() {
		return qna_no;
	}
	
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	
	public String getQna_writer() {
		return qna_writer;
	}
	
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	
	public String getQna_title() {
		return qna_title;
	}
	
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	
	public Date getQna_wdate() {
		return qna_wdate;
	}
	
	public void setQna_wdate(Date qna_wdate) {
		this.qna_wdate = qna_wdate;
	}
	
	public String getQna_contents() {
		return qna_contents;
	}
	
	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}
	
	public int getQna_viewCount() {
		return qna_viewCount;
	}
	
	public void setQna_viewCount(int qna_viewCount) {
		this.qna_viewCount = qna_viewCount;
	}
	
	public int getQna_replyCount() {
		return qna_replyCount;
	}
	
	public void setQna_replyCount(int qna_replyCount) {
		this.qna_replyCount = qna_replyCount;
	}
	
	public int getContest_id() {
		return contest_id;
	}
	
	public void setContest_id(int contest_id) {
		this.contest_id = contest_id;
	}
	
	@Override
	public String toString() {
		return "Contest_qnaVO [qna_no=" + qna_no + ", qna_writer=" + qna_writer + ", qna_title=" + qna_title
				+ ", qna_wdate=" + qna_wdate + ", qna_contents=" + qna_contents + ", qna_viewCount=" + qna_viewCount
				+ ", qna_replyCount=" + qna_replyCount + ", contest_id=" + contest_id + "]";
	}
    
    
}
