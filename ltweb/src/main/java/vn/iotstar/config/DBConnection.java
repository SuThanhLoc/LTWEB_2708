package vn.iotstar.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	// --- khai báo các trường để kết nối
	private static String USERNAME = "root";
	private static String PASSWORD = "0835269835Loc*";
	private static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/ltweb_test";

	public static Connection getConnection() throws ClassNotFoundException {
		Class.forName(DRIVER);
		try {
			return DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();

			if (conn != null) {
				System.out.print("Kết nối thành công!");
			} else {
				System.out.print("Kết nối thất bại!");
			}
		} catch (Exception e) {
			System.out.println("Lỗi: Không tìm thấy driver JDBC!");
			e.printStackTrace();
		}
	}
}
