package plat.dev.model;

public class User {
	private String username;
	private String password;
	private String hovaten;
	private String sodienthoai;
	private String hinhanh;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHovaten() {
		return hovaten;
	}
	public void setHovaten(String hovaten) {
		this.hovaten = hovaten;
	}
	public String getSodienthoai() {
		return sodienthoai;
	}
	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public User(String username, String password, String hovaten, String sodienthoai, String hinhanh) {
		super();
		this.username = username;
		this.password = password;
		this.hovaten = hovaten;
		this.sodienthoai = sodienthoai;
		this.hinhanh = hinhanh;
	}


}
