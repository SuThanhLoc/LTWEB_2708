package vn.iotstart.model; // lấy dữ liệu từ cơ sở dữ liệu / thao tác với dữ liệu (Model)

import java.io.Serializable;

public class UserModel implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String userName;
	private String email;
	private String fullName;
	private String password;
	private String images;

	// Tạo constructor và get/set (lấy dữ liệu, thiết lập dữ liệu)
	public UserModel() {
		super();
	}

	public UserModel(int id, String userName, String email, String fullName, String password, String images) {
		super();
		this.id = id;
		this.userName = userName;
		this.email = email;
		this.fullName = fullName;
		this.password = password;
		this.images = images;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "UserModel [id=" + id + ", userName=" + userName + ", email=" + email + ", fullName=" + fullName
				+ ", password=" + password + ", images=" + images + "]";
	}
	
	

}
