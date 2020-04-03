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
	String email = request.getParameter("email");
	String str = "";
	
	try {
		DAOBase dao = DAOBase.getInstance();
		Connection conn = dao.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement("insert into member VALUES((select nvl(max(num),0)+1 from member), ?, ?, ?)");
		pstmt.setString(1, idd);
		pstmt.setString(2, pwd);
		pstmt.setString(3, email);
		int result = pstmt.executeUpdate();
		
		if(result == 1) {
%>
			<script>
			alert("회원가입이 완료되었습니다.");
			document.location.href='login.jsp';
			</script>
<%
		} else {
			str = idd + "님 멤버로 등록이 실패하였습니다. 다시 가입해주세요.";
		}
		
		} catch (Exception e) {
			e.printStackTrace();
			str = "member 테이블에 새로운 레코드 추가를 실패했습니다.";
		}
%>
<%= str %>
</body>
</html>