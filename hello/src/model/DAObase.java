package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAObase implements DAO{
	public Connection getConnection() throws SQLException {
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName(jdbc_driver);
			Connection conn = DriverManager.getConnection(db_url, "scott","tiger");
			if(conn==null)
				System.out.println("conn fail"); // 접속 실패시 실패사실을 인지할 수 있도록 콘솔메세지 출력
			else
				System.out.println("conn success"); 
			return conn;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void closeDBResources(ResultSet rs, Statement stmt, Connection conn) {
		
	}
	
	public void closeDBResources(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
	}
	
	public void closeDBResources(PreparedStatement pstmt, Connection conn) {
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
