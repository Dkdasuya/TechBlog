package com.tech.blog.entities;

public class Categories {

	private int cid;
	private String description;
	private String name;
	
	public Categories(int cid, String description, String name) {
		this.cid = cid;
		this.description = description;
		this.name = name;
	}
	
	

	public Categories(String description, String name) {
		this.description = description;
		this.name = name;
	}



	public Categories() {
	}



	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
