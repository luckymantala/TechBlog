package io.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import io.tech.blog.entities.Category;
import io.tech.blog.entities.Post;

public class PostDao {

	private Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public List<Category> getAllCategories() {

		List<Category> listOfCatergories = new ArrayList<>();
		try {

			String query = "select * from categories";
			PreparedStatement psmt = con.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				int catID = rs.getInt("cid");
				String catName = rs.getString("category");
				Category category = new Category(catID, catName);
				listOfCatergories.add(category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listOfCatergories;
	}

	public boolean addPost(Post post) {

		boolean flag = false;
		String query;
		try {
			if(post.getpPic() == null) {
				query = "INSERT INTO posts(pcatid, ptitle, pcontent, pcode, ptags, puserid)"
						+ "VALUES (?,?,?,?,?,?);";
			} else {
				query = "INSERT INTO posts(pcatid, ptitle, pcontent, pcode, ptags, pimage, puserid)"
						+ "VALUES (?,?,?,?,?,?,?);";
			}
			

			PreparedStatement psmt = con.prepareStatement(query);

			psmt.setInt(1, post.getpCatID());
			psmt.setString(2, post.getpTitle());
			psmt.setString(3, post.getpContent());
			psmt.setString(4, post.getpCode());
			psmt.setString(5, post.getpTags());
			if(post.getpPic() == null) {
				psmt.setInt(6, post.getpUserID());
			} else {
				psmt.setString(6, post.getpPic());
				psmt.setInt(7, post.getpUserID());
			}
			psmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

	public List<Post> getAllPosts() {

		List<Post> allPosts = new ArrayList<>();

		try {

			String query = "select * from posts ORDER by pdate desc;";

			PreparedStatement psmt = con.prepareStatement(query);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				int pID = rs.getInt("pid");
				int pCatID = rs.getInt("pcatid");
				int pUserID = rs.getInt("puserid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pTags = rs.getString("ptags");
				Timestamp pDate = rs.getTimestamp("pdate");
				String pPic = rs.getString("pimage");
				
				Post post = new Post(pID, pCatID, pUserID, pTitle, pContent, pCode, pTags, pDate, pPic);
				
				allPosts.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return allPosts;
	}

	
	public List<Post> getPostsByCatID(int catID) {

		List<Post> allPosts = new ArrayList<>();

		try {

			String query = "select * from posts where pcatid =? ORDER by pdate desc;";

			PreparedStatement psmt = con.prepareStatement(query);

			psmt.setInt(1, catID);
			
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				int pID = rs.getInt("pid");
				int pUserID = rs.getInt("puserid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pTags = rs.getString("ptags");
				Timestamp pDate = rs.getTimestamp("pdate");
				String pPic = rs.getString("pimage");
				
				Post post = new Post(pID, catID, pUserID, pTitle, pContent, pCode, pTags, pDate, pPic);
				
				allPosts.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return allPosts;
	}
	
	public Post getPostByPostID(int postID) {
		
		Post post = null;
		
		try {

			String query = "select * from posts where pid =?;";

			PreparedStatement psmt = con.prepareStatement(query);

			psmt.setInt(1, postID);
			
			ResultSet rs = psmt.executeQuery();

			if (rs.next()) {

				int pID = rs.getInt("pid");
				int pUserID = rs.getInt("puserid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pTags = rs.getString("ptags");
				Timestamp pDate = rs.getTimestamp("pdate");
				String pPic = rs.getString("pimage");
				int catID = rs.getInt("pcatid");
				
				post = new Post(pID, catID, pUserID, pTitle, pContent, pCode, pTags, pDate, pPic);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}

}
