package kr.co.trycatch.domain.user;

import java.util.Date;

public class CommunityVO {
	private int community_no;
	private String community_title;
	private Date community_wdate;
	private String community_contents;
	private int community_viewCount;
	private int community_replyCount;
	private String community_writer;
    
	public int getCommunity_no() {
		return community_no;
	}

	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}

	public String getCommunity_title() {
		return community_title;
	}

	public void setCommunity_title(String community_title) {
		this.community_title = community_title;
	}

	public Date getCommunity_wdate() {
		return community_wdate;
	}

	public void setCommunity_wdate(Date community_wdate) {
		this.community_wdate = community_wdate;
	}

	public String getCommunity_contents() {
		return community_contents;
	}

	public void setCommunity_contents(String community_contents) {
		this.community_contents = community_contents;
	}

	public int getCommunity_viewCount() {
		return community_viewCount;
	}

	public void setCommunity_viewCount(int community_viewCount) {
		this.community_viewCount = community_viewCount;
	}

	public int getCommunity_replyCount() {
		return community_replyCount;
	}

	public void setCommunity_replyCount(int community_replyCount) {
		this.community_replyCount = community_replyCount;
	}

	public String getCommunity_writer() {
		return community_writer;
	}

	public void setCommunity_writer(String community_writer) {
		this.community_writer = community_writer;//.split("@")[0];
	}

	@Override
	public String toString() {
		return "CommunityVO [community_no=" + community_no + ", community_title=" + community_title
				+ ", community_wdate=" + community_wdate + ", community_contents=" + community_contents
				+ ", community_viewCount=" + community_viewCount + ", community_replyCount=" + community_replyCount
				+ ", community_writer=" + community_writer + "]";
	}

}
