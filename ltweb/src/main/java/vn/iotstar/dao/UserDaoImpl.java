package vn.iotstar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.config.DBConnection;
import vn.iotstar.model.UserModel;

public class UserDaoImpl implements IUserDao {

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
				list.add(new UserModel(rs.getInt("id"), 
						rs.getString("usersname"),
						rs.getString("password"), 
						rs.getString("email"),
						rs.getString("images"),
						rs.getString("fullname"), 
						rs.getString("phone"), 
						rs.getInt("roleid"), 
						rs.getDate("createDate")));
				return list;
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
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("usersname"));
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
		String sql = "INSERT INTO users (usersname, password, email, images, fullname, phone, roleid, createDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            new DBConnection();
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getImages());
            ps.setString(5, user.getFullName());
            ps.setString(6, user.getPhone());
            ps.setInt(7, user.getRoleid());
            ps.setDate(8, new java.sql.Date(user.getCreateDate().getTime()));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
	}

	@Override
	public UserModel finByUserName(String username) {
		String sql = "SELECT * FROM users WHERE usersname = ? ";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("usersname"));
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
	
	public static void main(String[] args)
	{
		IUserDao userDao = new UserDaoImpl();
		System.out.println(userDao.finByUserName("thanhloc"));
	}

}
