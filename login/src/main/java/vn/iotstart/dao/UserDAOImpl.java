package vn.iotstart.dao; // định nghĩa các phương thức đã khai báo ở IUserDAO 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import vn.iotstart.config.DBConnection;
import vn.iotstart.model.UserModel;

// implements: thực hiện một interface (viết logic cho phương thức interface)
public class UserDAOImpl extends DBConnection implements IUserDAO {

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public List<UserModel> findAll() {
		String sql = "SELECT * FROM users";
		List<UserModel> list = new ArrayList<UserModel>();
		try {
			new DBConnection();
			conn = DBConnection.getConnection(); // kết nối
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); // thực thi sql
			// đọc từng dòng ra
			while (rs.next()) {
				list.add(new UserModel(rs.getInt("id"), rs.getString("username"), rs.getString("email"),
						rs.getString("fullname"), rs.getString("password"), rs.getString("images"),
						rs.getString("phone"), rs.getInt("roleid"), rs.getDate("createDate")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public UserModel findById(int id) {
		String sql = "SELECT * FROM users WHERE id = ? ";
		try {
			new DBConnection();
			conn = DBConnection.getConnection(); // kết nối
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery(); // thực thi sql
			// đọc từng dòng ra
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("username"));
				user.setFullName(rs.getString("fullname"));
				user.setPassword(rs.getString("password"));
				user.setImages(rs.getString("images"));
				user.setRoleid(Integer.parseInt(rs.getString("roleid")));
				user.setPhone(rs.getString("phone"));
				user.setCreateDate(rs.getDate("createDate"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(UserModel user) {

	}

	@Override
	public UserModel finByUserName(String username) {
		String sql = "SELECT * FROM users WHERE username = ? ";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery(); // thực thi sql
			// đọc từng dòng ra
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("username"));
				user.setFullName(rs.getString("fullname"));
				user.setPassword(rs.getString("password"));
				user.setImages(rs.getString("images"));
				user.setRoleid(Integer.parseInt(rs.getString("roleid")));
				user.setPhone(rs.getString("phone"));
				user.setCreateDate(rs.getDate("createDate"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String args) {
		try {
			IUserDAO userDao = new UserDAOImpl();
			System.out.println(userDao.findById(1));
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

}
