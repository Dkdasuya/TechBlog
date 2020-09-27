package com.tech.blog.entities;

import java.sql.Date;

public class Post {
	
	private int pid;
	private String ptitle;
	private String pcode;
	private String content;
	private String ppic;
	private Date pdate;
	private int catid;
	private int userId;
	
	
	
	public Post(String ptitle, String pcode, String content, String ppic, Date pdate, int catid, int userId) {
		this.ptitle = ptitle;
		this.pcode = pcode;
		this.content = content;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userId = userId;
	}



	public Post(int pid, String ptitle, String pcode, String content, String ppic, Date pdate, int catid, int userId) {
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcode = pcode;
		this.content = content;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userId = userId;
	}



	
	public Post(String ptitle, String pcode, String content, String ppic, int catid, int userId) {
		this.ptitle = ptitle;
		this.pcode = pcode;
		this.content = content;
		this.ppic = ppic;
		this.catid = catid;
		this.userId = userId;
	}



	public Post() {
	}



	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	public String getPtitle() {
		return ptitle;
	}



	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}



	public String getPcode() {
		return pcode;
	}



	public void setPcode(String pcode) {
		this.pcode = pcode;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getPpic() {
		return ppic;
	}



	public void setPpic(String ppic) {
		this.ppic = ppic;
	}



	public Date getPdate() {
		return pdate;
	}



	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}



	public int getCatid() {
		return catid;
	}



	public void setCatid(int catid) {
		this.catid = catid;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	

}
