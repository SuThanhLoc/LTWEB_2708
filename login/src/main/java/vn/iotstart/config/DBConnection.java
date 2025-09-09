package vn.iotstart.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String USERNAME = "root";
	private static String PASSWORD = "0835269835Loc*";
	private static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/ltweb_test";

	public static Connection getDatabaseConnection() throws ClassNotFoundException {
		Class.forName(DRIVER);
		try {
			return DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args)
	{
		try {
			new DBConnection();
			System.out.print(DBConnection.getDatabaseConnection());
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}