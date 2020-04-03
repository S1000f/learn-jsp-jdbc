<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DAOBase"%>
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
	String idd = request.getParameter("id"); 
	String pwd = request.getParameter("pw");
	String error = "";
	try {
		DAOBase dao = DAOBase.getInstance();
		Connection conn = dao.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement("select * from" 
														+ " member "
														+ " where id = ? and pw = ?"
														);
		pstmt.setString(1, idd);
		pstmt.setString(2, pwd);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			if(idd.equals(id) && pwd.equals(pw)) {
				if(idd.equals("admin")) {
					session.setAttribute("id", idd);
					response.sendRedirect("admin.jsp");
				} else {
					session.setAttribute("id", idd);
					response.sendRedirect("user.jsp");
				}
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>