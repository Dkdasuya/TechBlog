package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	
	Connection conn;
	
	
	public LikeDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean insertLike(int pid,int uid) {
		boolean f = false;
		try {
			
			String q = "insert into liked (postid,uid) values (?,?)";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			ps.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int countLikeOnPost(int pid) {
		int count =0;
		
		try {
			String q = "select count(*) from liked where postid=?";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
				
			}
		}catch(Exception e) {
			
		}
		
		return count;
	}
	
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=true;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from liked where postid=? and uid=?");
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteLike(int pid,int uid) {
		boolean f =false;
		try {
			PreparedStatement ps = conn.prepareStatement("delete from liked where postid=? and uid=?");
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			ps.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
