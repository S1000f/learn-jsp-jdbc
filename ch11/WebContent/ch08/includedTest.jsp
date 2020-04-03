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
	String name = request.getParameter("name");
	String cat = request.getParameter("cat");
	%>
	includedTest.jsp
	<hr/>
	<strong><%=name %>, welcome!</strong>
	<b><%=cat %>, you too</b>
</body>
</html>