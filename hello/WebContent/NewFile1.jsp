<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.while-test {
		background-color: olive;
	}

</style>
<body>
	<h1>테스트입니다.</h1>
	<div>
		<div>a</div>
		<div>b</div>
		<div>c</div>
<%
		int i = 0;
		while(i < 11) {
%>
		<div class="while-test"><%= i %></div>
<%
		i++;
		}
%>
		
		
	</div>
</body>
</html>