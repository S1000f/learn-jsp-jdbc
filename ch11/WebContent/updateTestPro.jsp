<%@page import="java.sql.ResultSet"%>
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

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	
	
	try {
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(db_url, "scott", "tiger");
	
		String sql = "SELECT ID, PASSWD FROM MEMBER WHERE ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String rId = rs.getString("ID");
			String rPasswd = rs.getString("PASSWD");
			if(id.equals(rId) && passwd.equals(rPasswd)) {
				sql = "UPDATE MEMBER SET NAME = ? WHERE ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				int result = pstmt.executeUpdate();
				if(result == 1 ) {
					str = id + ", update success";
				}
			}
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
				pstmt.close();
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
<title>Member name update</title>
</head>
<body>
<%= str %>

</body>
</html>