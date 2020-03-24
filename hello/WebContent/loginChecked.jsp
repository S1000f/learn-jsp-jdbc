<%@page import="org.apache.catalina.connector.Request"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.wrap {
		display: absolute;
		width: 500px;
		margin: 0 auto;
	}
	
	.title {
		width: 400px;
	
	}

	.title > div {
		width:100px;
		display: inline-block;
		margin: 1px 2px 1px 2px;
		background-color: rgb(240, 128, 128);
	}
	
	.emp {
		width: 400px;
	}
	
	.emp > div {
		display: inline-block;
		width: 100px;
		margin: 1px 2px 1px 2px;
		background-color: orange;
	}

</style>

</head>
<body>
<%
	try{
		DAObase dao = new DAObase();
		Connection conn = dao.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement("SELECT num, id, passwd FROM login where id = ?");
		pstmt.setString(1, request.getParameter("inputid"));
		//pstmt.setInt(2, 30);
		ResultSet rs = pstmt.executeQuery();
		
		String inputId = request.getParameter("inputid");
		String inputpw = request.getParameter("inputpasswd");
			
		if(rs.next()) {
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
%>
	<div>
		<p><%= id %></p>
		<p><%= passwd %></p>
	</div>		
			
<%			
		}
%>
	<div>
		<p>입력한<%= inputId %></p>
		<p>입력한<%= inputpw %></p>
	</div>
	
<%		
					
	}catch (Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>