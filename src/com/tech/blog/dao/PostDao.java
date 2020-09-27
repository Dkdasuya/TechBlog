package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;

public class PostDao {

	Connection conn;

	public PostDao(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<Categories> getCategories(){
		ArrayList<Categories> list= new ArrayList<>();
		
		try {
			String query = "select * from categories";
			Statement stmnt = this.conn.createStatement();
			ResultSet set = stmnt.executeQuery(query);
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Categories c = new Categories(cid,description,name);
				list.add(c);
			}
		}catch(Exception e ) {
			
		}
		
		return list;
	}
	
	public boolean savePost(Post p) {
		boolean f= false;
		try {
			String q = "insert into posts(ptitle,pcontent,pcode,ppic,catid,userID) values (?,?,?,?,?,?)";
			PreparedStatement stmnt = conn.prepareStatement(q);
			stmnt.setString(1, p.getPtitle());
			stmnt.setString(2, p.getContent());
			stmnt.setString(3, p.getPcode());
			stmnt.setString(4, p.getPpic());
			stmnt.setInt(5, p.getCatid());
			stmnt.setInt(6, p.getUserId());
			stmnt.executeUpdate();
			f=true;
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	//get all the posts 
	public List<Post> getAllPosts(){
		List<Post> list = new ArrayList<>();
		try {
			String query = "select * from posts order by pid asc";
			PreparedStatement stmnt = conn.prepareStatement(query);
			
			ResultSet rs = stmnt.executeQuery();
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Date date = rs.getDate("pdate");
				int catid = rs.getInt("catid");
				int userId = rs.getInt("userID");
				
				Post post = new Post(pid,ptitle,pcode,pcontent,ppic,date,catid,userId);
				
				list.add(post);
				
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//return list of post of selected id
	public List<Post> getPostByCatId(int id){
		List<Post> list = new ArrayList<>();
		
		try {
			String query = "select * from posts where catid = ?";
			PreparedStatement stmnt = conn.prepareStatement(query);
			stmnt.setInt(1, id);
			
			ResultSet rs = stmnt.executeQuery();
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Date date = rs.getDate("pdate");
				int userId = rs.getInt("userID");
				
				Post post = new Post(pid,ptitle,pcode,pcontent,ppic,date,id,userId);
				
				list.add(post);
				
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Post getPostById(int id) {
		Post post = null;
		String q = "select * from posts where pid=?";
		try {
		PreparedStatement stmnt = this.conn.prepareStatement(q);
		stmnt.setInt(1, id);
		ResultSet rs = stmnt.executeQuery();
		if(rs.next()) {
			int pid = rs.getInt("pid");
			String ptitle = rs.getString("ptitle");
			String pcontent = rs.getString("pcontent");
			String pcode = rs.getString("pcode");
			String ppic = rs.getString("ppic");
			Date date = rs.getDate("pdate");
			int catid = rs.getInt("catid");
			int userId = rs.getInt("userID");
			
			 post = new Post(pid,ptitle,pcode,pcontent,ppic,date,catid,userId);
			
		}
		}catch (Exception e ) {
			e.printStackTrace();
		}
		return post;
		
	}
}
