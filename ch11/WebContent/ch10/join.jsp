<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="index.css" />
<title>Create your account</title>
</head>
<body>
    <div class="join_box">
        <p>Create your account</p>
        <form action="createUser.jsp" method="get">
	        <input type="text" maxlength="50" placeholder="ID" name="id"/>
	        <input type="password" maxlength="16" placeholder="PASSWORD" name="pw"/>
	        <input type="text" maxlength="50" placeholder="E-MAIL" name="email"/>
	        <input type="submit" value="회원가입" />
        </form>
    </div>
</body>
</html>