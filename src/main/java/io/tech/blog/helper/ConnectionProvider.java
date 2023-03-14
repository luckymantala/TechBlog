package io.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			if (con == null) {
				Class.forName("org.postgresql.Driver");
				
				con = DriverManager
						.getConnection("jdbc:postgresql://localhost:5432/techblog", "postgres", "welcum123");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
