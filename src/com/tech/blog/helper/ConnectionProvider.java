package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
	private static Connection conn;
	public static Connection getConnection() {
		
		try {
			String username="root";
			String password="Dheeraj789%";
			if(conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog",username,password);
			
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
