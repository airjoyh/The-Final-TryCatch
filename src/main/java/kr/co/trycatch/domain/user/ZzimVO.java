package kr.co.trycatch.domain.user;

import java.util.Date;

public class ZzimVO {

	private String zzim_no;
	private String zzim_select;
	private int zzim_selected;
	private Date zzim_regdate;

	public String getZzim_select() {
		return zzim_select;
	}

	public void setZzim_select(String zzim_select) {
		this.zzim_select = zzim_select;
	}

	public int getZzim_selected() {
		return zzim_selected;
	}

	public void setZzim_selected(int zzim_selected) {
		this.zzim_selected = zzim_selected;
	}

	public String getZzim_no() {
		return zzim_no;
	}

	public void setZzim_no(String zzim_no) {
		this.zzim_no = zzim_no;
	}

	public Date getZzim_regdate() {
		return zzim_regdate;
	}

	public void setZzim_regdate(Date zzim_regdate) {
		this.zzim_regdate = zzim_regdate;
	}

	@Override
	public String toString() {
		return "ZzimVO [zzim_no=" + zzim_no + ", zzim_select=" + zzim_select + ", zzim_selected=" + zzim_selected
				+ ", zzim_regdate=" + zzim_regdate + "]";
	}

}
