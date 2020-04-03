<%@page import="java.io.IOException"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	ArrayList<String> list = null;
	
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		conn = ds.getConnection();
		
		String sql = "SELECT EMPNO FROM EMP";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		list = new ArrayList<>();
		
		while(rs.next()) {
			list.add(rs.getString("EMPNO"));
		}
		
	} catch (Exception e) {
		
	}
	
	for(String e: list) {
		out.println(e);
	}
	
	//list.stream().forEach(s-> System.out.println(s));
	
	%>
	
	
	
</body>
</html>