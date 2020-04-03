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
	String pageName = request.getParameter("pageName");
	pageName += ".jsp";
	
	String cat = "milly";
	%>
	includeTest.jsp
	<hr />
	<jsp:include page="<%=pageName %>" flush="false" >
		<jsp:param name="cat" value="<%=cat %>" />
	</jsp:include>
	
	
</body>
</html>