<%@page import="model.TestBean"%>
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
TestBean tb = new TestBean();
tb.setName(request.getParameter("name"));

out.println(tb.getName());
%>

	<jsp:useBean id="testBean" class="model.TestBean">
		<jsp:setProperty name="testBean" property="*" />
	</jsp:useBean>
	
	<h2>your name is <jsp:getProperty property="name" name="testBean"/></h2>
	<h2>your email is <jsp:getProperty property="email" name="testBean"/></h2>
	<h2>your password is <jsp:getProperty property="password" name="testBean"/></h2>
</body>
</html>