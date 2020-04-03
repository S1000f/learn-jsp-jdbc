<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container {
		margin: 0 auto;
		width: 800px;
		text-align: center;
	}
	
	.no {
		text-align: center;
	}
	
		.row-no {
			display: inline-block;
			width: 100px;
			height: 25px;
			border-style: solid;
			margin: 1px 1px 1px 1px;
			text-align: left;
		}
	
	.top {
	
	}

		.top > .name {
			height: 40px;
		}

</style>

</head>
<body>
	<%
	String item = request.getParameter("item");
	int num = Integer.valueOf(item);
	%>
	<div class="container">
		<h2>입력한 숫자만큼 반복실행</h2>
		<div class="top no">
			<div class="row-no name">
				글번호
			</div>
			<div class="row-no name">
				글제목
			</div>
			<div class="row-no name">
				글내용
			</div>
		</div>
	<%
	for(int i = num; i >= 1; i--) {
	%>
		<div class="menu no">
			<div class="row-no">
				<% out.println(i); %>
			</div>
			<div class="row-no">
				title <% out.println(i); %>
			</div>
		
			<div class="row-no">
				content <% out.println(i); %>
			</div>
		</div>
	<%
	}
	%>
	</div>
	
	
</body>
</html>