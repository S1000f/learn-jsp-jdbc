<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 확인</title>

<style>
	.wrap {
		overflow: hidden; 
	}

	.dan {
		float: left;
		width: 8%;
		background-color: #34a1eb;
		margin: 10px 10px 10px 10px;
	}

</style>

</head>
<body>
<%
	String dan = request.getParameter("dan");
	int intDan = 0;
	try {
		intDan = Integer.valueOf(dan);
	} catch(Exception e) {
		
	}
%>
<p><%=dan %>단을 확인합니다</p>
<div class="wrap">
<%
	for(int i = 2; i <= intDan; i++) {
%>
	<ul class="dan" id="<%=i %>">
	<li><h3><%= i %>단</h3></li>
<%
		for(int j = 1; j <= 9; j++) {
%>
		<li><%= i %> x <%= j %> = <%= i*j %></li>
<%
		}
%>
	</ul>
<%
	}
%>
</div>

</body>
</html>