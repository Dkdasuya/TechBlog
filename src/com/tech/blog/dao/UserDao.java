package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;




public class UserDao {
	
	public int tester = 77;
	public String yoyo="dheeraj";
	
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	//method to insert user to data base;
	
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			
			String query = "insert into user (name,email,password,gender,about) values (?,?,?,?,?)";
			PreparedStatement stmnt = this.conn.prepareStatement(query);
			stmnt.setString(1,user.getName());
			stmnt.setString(2, user.getEmail());
			stmnt.setString(3, user.getPassword());
			stmnt.setString(4, user.getGender());
			stmnt.setString(5, user.getAbout());
			
			stmnt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			
		}
		return f;
	}
	
	public User getUserByEmailAndPassword(String email,String password) {
		User user = null;
		
			try {
				String query = "select * from user where email=? and password=?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setString(1,email);
				pstmt.setString(2,password);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					user = new User();
					String name = rs.getString("name");
					user.setName(name);
					
					user.setId(rs.getInt("id"));
					user.setEmail(rs.getString("email"));
					user.setAbout(rs.getString("about"));
					user.setPassword(rs.getString("password"));
					user.setGender(rs.getString("gender"));
					user.setProfile(rs.getString("profile"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return user;
	}

	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "update user set name=? ,email=? ,password =?,gender=? , about=?, profile=? where id=?";
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId()); 

			p.executeUpdate();
			
			f=true;
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String q = "select * from user where id=?";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				String name = rs.getString("name");
				user.setName(name);
				
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setAbout(rs.getString("about"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setProfile(rs.getString("profile"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
