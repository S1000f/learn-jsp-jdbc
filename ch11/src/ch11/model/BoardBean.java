package ch11.model;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardBean {
	
	private static BoardBean instance = new BoardBean();
	
	private BoardBean() {
	}
	
	public static BoardBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		Connection conn = ds.getConnection();
		
		return conn;
	}
	
}
