package vn.iotstart.model; // lấy dữ liệu từ cơ sở dữ liệu / thao tác với dữ liệu (Model)

import java.io.Serializable;
import java.sql.Date;

public class UserModel implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String userName;
	private String email;
	private String fullName;
	private String password;
	private String images;
	private String phone;
	private int roleid;
	private Date createDate;

	// constructor không tham số
	public UserModel() {
		super();
	}

	public UserModel(int id, String userName, String email, String fullName, 
			String password, String images, String phone, int roleid, Date createDate) {
		super();
		this.id = id;
		this.userName = userName;
		this.email = email;
		this.fullName = fullName;
		this.password = password;
		this.images = images;
		this.phone = phone;
		this.roleid = roleid;
		this.createDate = createDate;
	}

	// getter, setter
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "UserModel [id=" + id + ", userName=" + userName + ", email=" + email + ", fullName=" + fullName
				+ ", password=" + password + ", images=" + images + ", phone=" + phone + ", roleid=" + roleid
				+ ", createDate=" + createDate + "]";
	}

}
