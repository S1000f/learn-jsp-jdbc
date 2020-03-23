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
<title>First time</title>
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
<div class="wrap">
	<div class="title">
		<div>Employee ID</div>
		<div>Name</div>
		<div>Job</div>
	</div>
	<div class="emp">
<%
	try{
		DAObase dao = new DAObase();
		Connection conn = dao.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("SELECT EMPNO, ENAME, JOB FROM EMP WHERE DEPTNO between ? and ?");
		pstmt.setInt(1, 10);
		pstmt.setInt(2, 30);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			String deptno = String.valueOf(rs.getInt("EMPNO"));
			String name = rs.getString("ENAME");
			String loc = rs.getString("JOB");
%>
		<div>
			<%= deptno %>
		</div>
		<div>
			<%= name %>
		</div>
		<div>
			<%= loc %>
		</div>		
	
<%
		}
		
	}catch (Exception e){
		e.printStackTrace();
	}
%>
	</div>
</div>

<h1>database test</h1>	
</body>
</html>