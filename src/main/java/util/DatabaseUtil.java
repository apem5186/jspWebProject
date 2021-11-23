package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import java.lang.Exception;
import java.sql.PreparedStatement;

public class DatabaseUtil {
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/jsp_web?characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&allowPublicKeyRetrieval=true&useSSL=false";
			String dbID = "root";
			String dbPassword = "tls135712!";
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("연결 되었습니다.");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
