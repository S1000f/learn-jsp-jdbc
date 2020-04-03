<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.*"%>
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
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	
	String v1 = Optional.ofNullable(request.getParameter("vehicle1"))
						.orElse("");
	String v2 = Optional.ofNullable(request.getParameter("vehicle2"))
						.orElse("");
	String v3 = Optional.ofNullable(request.getParameter("vehicle3"))
						.orElse("");
	
	List<String> lec = new ArrayList<>(Arrays.asList(request.getParameterValues("ch_lec")));
	//lec = lec.stream().filter(s-> s != null).collect(Collectors.toList());
	out.println(lec);
	
	
	out.println(num);
	out.println(name);
	out.println(grade);
		
	out.println(v1);
	out.println(v2);
	out.println(v3);
	%>
</body>
</html>