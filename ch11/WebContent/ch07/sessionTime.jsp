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
	session.setAttribute("id", "testId");
	session.setAttribute("grade", "manager");
	
	Cookie ck = new Cookie("PathCookie", "Only'/CookiePath/'");
	ck.setPath("/ch07/ckTest/");
	response.addCookie(ck);
	
	Cookie[] cks = request.getCookies();
	if(cks != null && cks.length > 0) {
		for(int i = 0; i < cks.length; i++) {
			%>
			cookie: <%=cks[i].getName() %><br />
			value: <%= cks[i].getValue() %><br />
			<%
		}
	}
	
	%>
	
	
	

</body>
</html>