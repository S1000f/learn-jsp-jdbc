<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="index.css" />
<title>Cat Hub Login</title>
</head>
<body>
    <div class="login_box">
        <p>LOGIN</p>
        <form action="loginCheck.jsp" method="get">
            <input type="text" maxlength="50" placeholder="ID" name="id"/>
            <input type="password" maxlength="16" placeholder="PASSWORD" name="pw"/>
            <input type="submit" value="로그인" />
        </form>
        <button type="button" onclick="location.href='join.jsp'">회원가입</button>
    </div>
</body>
</html>