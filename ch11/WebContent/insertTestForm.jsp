<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>member 테이블 레코드 추가</h2>
	<form action="insertTestPro.jsp" method="post">
		id: <input type="text" name="id" id="id" maxlength="50"><br />
		password: <input type="password" name="password" id="password" maxlength="16"><br />
		name : <input type="text" name="name" id="name" maxlength="10"><br />
		<input type="submit" value="sign up" />
	</form>
</body>
</html>