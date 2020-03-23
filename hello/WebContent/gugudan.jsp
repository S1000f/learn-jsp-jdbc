<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap {
		overflow: hidden; 
	}

	.dan {
		float: left;
		width: 8%;
		background-color: olive;
		
		margin: 10px 10px 10px 10px;
	}

</style>

</head>
<body>
<h1>구구단</h1>
<div class="wrap">
<%
	for(int i = 2; i <= 9; i++) {
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