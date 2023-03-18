package io.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import io.tech.blog.entities.User;
import io.tech.blog.helper.ConnectionProvider;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
//	method to insert user to database
	public boolean saveUser(User user) {
		
		boolean flag=false;
		
		try {
			
			String query = "INSERT INTO userdetails(name, email, password, gender, about) VALUES (?,?,?,?,?);";
			PreparedStatement psmt =  con.prepareStatement(query);
			
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getGender());
			psmt.setString(5, user.getAbout());
		
			psmt.executeUpdate();
			flag = true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	
//	method to get user details using email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		
		try {			
			String query = "select * from userdetails where email =? and password =?;";
			
			PreparedStatement psmt = con.prepareStatement(query);
			
			psmt.setString(1, email);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setAbout(rs.getString("about"));
				user.setGender(rs.getString("gender"));
				user.setProfile(rs.getString("profile"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(User user) {
		
		boolean flag = false;
		
		try {
			
			String query = "UPDATE userdetails SET name =?, email =?, about =?, profile =? WHERE uid =?;";			 
			PreparedStatement psmt = con.prepareStatement(query);
			
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getAbout());
			psmt.setString(4, user.getProfile());
			psmt.setInt(5, user.getId());
			
			psmt.executeUpdate();
			
			flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
}
