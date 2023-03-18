package io.tech.blog.entities;

import java.sql.Timestamp;

public class Post {

	private int pID;
	private int pCatID;
	private int pUserID;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pTags;
	private Timestamp pDate;
	private String pPic;
	
	
	
	public Post(int pID, int pCatID, int pUserID, String pTitle, String pContent, String pCode, String pTags,
			Timestamp pDate, String pPic) {
		super();
		this.pID = pID;
		this.pCatID = pCatID;
		this.pUserID = pUserID;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pTags = pTags;
		this.pDate = pDate;
		this.pPic = pPic;
	}
	public Post(int pCatID, int pUserID, String pTitle, String pContent, String pCode, String pTags, String pPic) {
		super();
		this.pCatID = pCatID;
		this.pUserID = pUserID;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pTags = pTags;
		this.pPic = pPic;
	}
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public int getpCatID() {
		return pCatID;
	}
	public void setpCatID(int pCatID) {
		this.pCatID = pCatID;
	}
	public int getpUserID() {
		return pUserID;
	}
	public void setpUserID(int pUserID) {
		this.pUserID = pUserID;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpTags() {
		return pTags;
	}
	public void setpTags(String pTags) {
		this.pTags = pTags;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

}