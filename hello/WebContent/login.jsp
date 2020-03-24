<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginChecked.jsp" method="get">
		<div>
			<p>ID:</p> 
			<input type="text" name="inputid" class="inputid" />
		</div>
		<div>
			<p>password:</p>
			<input type="text" name="inputpasswd" class="inputpasswd" />
			<input type="submit" value="확인" />
		</div>
		<br />
		<div>
			<button type="button" onclick="location.href='insertMember.jsp'">회원가입</button>
		</div>
	</form>
	
</body>
</html>