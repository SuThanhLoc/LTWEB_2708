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

		List<UserModel> list = new ArrayList<>(); // tạo một danh sách để chứa dữ liệu

		try {
			conn = super.getDatabaseConnection(); // kế thừa rồi nên gọi super được -- mở kết nối
			ps = conn.prepareStatement(sql); // cung cấp sql cho csdl
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new UserModel(rs.getInt("id"), rs.getNString("usersname"), rs.getNString("password"),
						rs.getNString("email"), rs.getNString("fullname"), rs.getNString("images"))); // không cần sắp
																										// xếp thứ tự
			}
			return list; // trả về 1 danh sách user
		} catch (Exception e) {
			e.getStackTrace();
		}
		return null;
	}

	@Override
	public UserModel findById(int id) {
		String sql = "SELECT * FROM users WHERE id = ?";

		try {
			conn = super.getDatabaseConnection();
			ps = conn.prepareStatement(sql);

			// Gán giá trị id vào tham số ?
			ps.setInt(1, id);

			rs = ps.executeQuery();

			// Kiểm tra nếu có kết quả
			if (rs.next()) {
				// Tạo và trả về đối tượng UserModel
				return new UserModel(rs.getInt("id"), rs.getNString("usersname"), rs.getNString("password"),
						rs.getNString("email"), rs.getNString("fullname"), rs.getNString("images"));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return null;
	}

	@Override
	public void insert(UserModel user) {
		String sql = "INSERT INTO users(id, usersname, email, fullname, images, password) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			conn = super.getDatabaseConnection();

			ps = conn.prepareStatement(sql);

			ps.setInt(1, user.getId());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getFullName());
			ps.setString(5, user.getImages());
			ps.setString(6, user.getPassword());

			ps.executeUpdate();

		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// Hàm main để test
	public static void main(String[] args) {
		UserDAOImpl userDao = new UserDAOImpl();
		
		userDao.insert(new UserModel(6, "abc", "abc@gmail.com", "abcxyz", "", "123321"));
		UserModel finby = userDao.findById(2);
		System.out.println(finby);
//		List<UserModel> list = userDao.findAll(); // UserModel có 1 constructor full tham số
//		for (UserModel user : list) {
//			System.out.println(user);
//		}
	}

}
