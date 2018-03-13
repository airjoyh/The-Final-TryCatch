package kr.co.trycatch.domain.user;

public class PortfolioVO {

	private String port_id;
	private String port_exp;
	private String port_skill;
	private String port_interest;
	private String port_award;
	private String port_link;
	private String port_license;
	private String port_img;
	private String user_id;

	public String getPort_id() {
		return port_id;
	}

	public void setPort_id(String port_id) {
		this.port_id = port_id;
	}

	public String getPort_exp() {
		return port_exp;
	}

	public void setPort_exp(String port_exp) {
		this.port_exp = port_exp;
	}

	public String getPort_skill() {
		return port_skill;
	}

	public void setPort_skill(String port_skill) {
		this.port_skill = port_skill;
	}

	public String getPort_interest() {
		return port_interest;
	}

	public void setPort_interest(String port_interest) {
		this.port_interest = port_interest;
	}

	public String getPort_award() {
		return port_award;
	}

	public void setPort_award(String port_award) {
		this.port_award = port_award;
	}

	public String getPort_link() {
		return port_link;
	}

	public void setPort_link(String port_link) {
		this.port_link = port_link;
	}

	public String getPort_license() {
		return port_license;
	}

	public void setPort_license(String port_license) {
		this.port_license = port_license;
	}

	public String getPort_img() {
		return port_img;
	}

	public void setPort_img(String port_img) {
		this.port_img = port_img;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "PortfolioVO [port_id=" + port_id + ", port_exp=" + port_exp + ", port_skill=" + port_skill
				+ ", port_interest=" + port_interest + ", port_award=" + port_award + ", port_link=" + port_link
				+ ", port_license=" + port_license + ", port_img=" + port_img + ", user_id=" + user_id + "]";
	}

}
