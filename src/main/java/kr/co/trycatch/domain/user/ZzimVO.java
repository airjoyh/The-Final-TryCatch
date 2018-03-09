package kr.co.trycatch.domain.user;

public class ZzimVO {
	
	private String zzim_no;
	private String zzim_select;
	private int zzim_selected;
	
	public ZzimVO() {
		// TODO Auto-generated constructor stub
	}

	public String getzzim_no() {
		return zzim_no;
	}

	public void setzzim_no(String zzim_no) {
		this.zzim_no = zzim_no;
	}

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


	@Override
	public String toString() {
		return "ZzimVO [zzim_no=" + zzim_no + ", zzim_select=" + zzim_select + ", zzim_selected=" + zzim_selected + "]";
	}

}
