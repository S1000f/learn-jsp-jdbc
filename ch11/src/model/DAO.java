package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public interface DAO {
	Connection getConnection() throws SQLException;
	void closeDBResources(ResultSet rs, Statement stmt, Connection conn);
	void closeDBResources(ResultSet rs, PreparedStatement pstmt, Connection conn);
	void closeDBResources(PreparedStatement pstmt, Connection conn);
}
