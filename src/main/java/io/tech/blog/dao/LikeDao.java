package io.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean addLike(int pid, int uid) {
		boolean flag = false;
		try {
			String query = "insert into likes(pid,uid) values(?,?);";

			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);

			psmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean removeLike(int pid, int uid) {
		boolean flag = false;
		try {
			String query = "DELETE FROM likes WHERE pid =?,uid =?;";

			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);

			psmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int getLikeCountOnPost(int pid) {
		int count = 0;
		try {
			String query = "SELECT count(*) FROM likes where pid =?;";

			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, pid);

			ResultSet rs = psmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isPostLikeByUser(int pid, int uid) {
		
		try {
			String query = "SELECT count(*) FROM likes where pid =? and uid =?;";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, pid);

			ResultSet rs = psmt.executeQuery();

			if (rs.next()) {
				if(rs.getInt(1) == 1) {
					return true;
				}
			}

		} catch (

		Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
