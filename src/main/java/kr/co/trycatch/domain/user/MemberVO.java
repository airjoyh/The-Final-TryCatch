package kr.co.trycatch.domain.user;

import java.sql.Date;

public class MemberVO {
	private String member_id;
	private String member_pass;
	private String member_type;
	private String user_authCode;
	private String user_authStatus;
	private Date registDate;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getUser_authCode() {
		return user_authCode;
	}

	public void setUser_authCode(String user_authCode) {
		this.user_authCode = user_authCode;
	}

	public String getUser_authStatus() {
		return user_authStatus;
	}

	public void setUser_authStatus(String user_authStatus) {
		this.user_authStatus = user_authStatus;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pass=" + member_pass + ", member_type=" + member_type
				+ ", user_authCode=" + user_authCode + ", user_authStatus=" + user_authStatus + ", registDate="
				+ registDate + "]";
	}

}
