package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	private String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static String DB_URL = "jdbc:mysql://localhost:3306/news?useUnicode=true&characterEncoding=UTF-8";
	private static String DB_USER = "root";
	private static String DB_PASSWORD = "";

	public Connection getConnection() {
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return conn;
	}

}
