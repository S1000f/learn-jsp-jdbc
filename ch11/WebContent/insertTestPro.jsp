<%@page import="com.sun.javafx.applet.ExperimentalExtensions"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("password");
	String name = request.getParameter("name");
	Timestamp register = new Timestamp(System.currentTimeMillis());

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	String jdbc_driver = "oracle.jdbc.OracleDriver";
	String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(db_url, "scott", "tiger");
	
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,CURRENT_TIMESTAMP)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		//pstmt.setTimestamp(4, register);
		
		int result = pstmt.executeUpdate();
		if(result == 1 ) {
			str = id + ", register success";
		}
		
	} catch(Exception e) {
		str = "sign-up failed...";
	} finally {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-Up</title>
</head>
<body>
<%= str %>

</body>
</html>