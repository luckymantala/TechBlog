package io.tech.blog.entities;

public class Category {
	private int catID;
	private String catName;
	
	public Category() {
	}

	public Category(int catID, String catName) {
		this.catID = catID;
		this.catName = catName;
	}

	public int getCatID() {
		return catID;
	}

	public void setCatID(int catID) {
		this.catID = catID;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}
	
}
