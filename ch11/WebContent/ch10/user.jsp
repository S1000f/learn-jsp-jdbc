<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>메인화면</title>

<style>
	a {
		text-decoration: none;
		color: black;
	}

	body {
		margin: 0;
	}

	.wrap {
		width: 1024px;
		margin: 0 auto;
	}
	
	.container {
		width: 800px;
		margin: 0 auto;
	}
	
	.button-container {
		width: 400px;
		margin: 0 auto;
	}
	
		.button-container > .btn > h2 {
			margin: 5px 0 5px 0;
		}
	
		.button-container > .btn {
			border-radius: 8px;
			text-align: center;
			font-size: 20px;
			width: 200px;
			margin: 20px auto;
			padding: 2px 5px 2px 5px;
		}
	
		.button-container > .btn-change {
			background-color: #58c1f5;
		}
		
		.button-container > .btn-delete {
			background-color: #e6746e;
		}
		
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<form class="button-container" action="update.jsp" method="get" >
				<h1>Main page</h1>
				<button id="inputs" class="btn btn-change" type="submit" name="update">회원정보 변경</button>
			</form>
			<form class="button-container" action="delete.jsp" method="get" >
				<button id="inputs" class="btn btn-delete" type="submit" name="delete">회원 탈퇴하기</button>
			</form>
		</div>
	</div>
	
	<%
	String id = String.valueOf(session.getAttribute("id"));
	session.setAttribute("id", id);
	%>
	
	
	<!-- <a href="update.jsp?num=&pw=aaa">move</a> -->
</body>
</html>


