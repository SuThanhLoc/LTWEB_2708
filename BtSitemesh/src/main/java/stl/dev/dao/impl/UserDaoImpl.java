package plat.dev.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import plat.dev.config.DBConnection;
import plat.dev.dao.UserDao;
import plat.dev.model.User;

public class UserDaoImpl implements UserDao {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public User get(String username) {
		String sql = "Select * from user where username = ?";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();

			if (rs.next()) {
				User account = new User(sql, sql, sql, sql, sql);
				account.setUsername(rs.getString("username"));
				account.setPassword(rs.getString("password"));
				account.setHovaten(rs.getString("hovaten"));
				account.setSodienthoai(rs.getString("sodienthoai"));
				account.setHinhanh(rs.getString("hinhanh"));
				return account;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void update(String username, String hovaten, String sodienthoai, String hinhanh) {
		String sql = "UPDATE user SET hovaten = ?, sodienthoai = ?, hinhanh = ? WHERE username = ?";
		try (Connection conn = new DBConnection().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, hovaten);
			ps.setString(2, sodienthoai);
			ps.setString(3, hinhanh);
			ps.setString(4, username);

			int rows = ps.executeUpdate();
			if (rows > 0) {
				System.out.println("Cập nhật thành công!");
			} else {
				System.out.println("Không tìm thấy user để cập nhật.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
