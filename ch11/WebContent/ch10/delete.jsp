<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
	a {
		text-decoration: none;
		color: black;
	}

	body {
		margin: 0;
	}

	.wrap {
		width: 1024px;
		margin: 0 auto;
	}
	
	.container {
		width: 800px;
		margin: 0 auto;
	}
	
	.button-container {
		width: 400px;
		margin: 0 auto;
	}
	
		.button-container > .btn > h2 {
			margin: 5px 0 5px 0;
		}
	
		.button-container > .btn {
			border-radius: 8px;
			text-align: center;
			font-size: 20px;
			width: 200px;
			margin: 20px auto;
			padding: 2px 5px 2px 5px;
		}
	
		.button-container > .btn-change {
			background-color: #e6746e;
		}
		
		.button-container > .btn-delete {
			background-color: #e6746e;
		}
		
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<form class="button-container" action="delete.jsp" method="get" >
				<h2>회원 탈퇴</h2>
				<input type="text" name="pw" id="pw" maxlength="50" placeholder="비밀번호 입력"><br />
				<button id="inputs" class="btn btn-change" type="submit">탈퇴하기</button>
			</form>
			<form class="button-container" action="user.jsp" method="get" >
				<button id="inputs" class="btn btn-delete" type="submit">돌아가기</button>
			</form>
		</div>
	</div>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	
	try
	{
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(db_url, "scott", "tiger");
		
		String id = String.valueOf(session.getAttribute("id"));
		String pw = request.getParameter("pw");
		
		String sql = "SELECT PW FROM MEMBER WHERE ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String dbPw = rs.getString("PW");
			if(pw.equals(dbPw)) {
				out.println("정말 회원정보를 삭제하시겠습니까? 이 과정은 되돌릴 수 없습니다.");
			}
		}
		
	} catch(Exception e) {
		e.printStackTrace();
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
	
</body>
</html>