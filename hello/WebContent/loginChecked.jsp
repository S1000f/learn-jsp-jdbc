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
<title>LOGIN CHECKING</title>
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
		
		// statement와 prestatement 의 차이는 후자는 쿼리문에 변수를 넣을 수 있음
		// 쿼리문을 따로 String 인스턴스로 만들어 두고 사용하는 경우
		String sql = "SELECT num, id, passwd FROM login where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("inputid"));
		ResultSet rs = pstmt.executeQuery();
		
		String inputId = request.getParameter("inputid");
		String inputpw = request.getParameter("inputpasswd");
		
		if(rs.next()) {
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			if(inputId.equals(id)) {
%>
	<div>
		<h3>동일한 ID 존재합니다.</h3>
	</div>			
<%
			}
		}
%>
	<div>
		<p>입력하신 ID : <%= inputId %></p>
	</div>
<%		
	}catch (Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>