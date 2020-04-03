<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="index.css" />
<title>관리자 페이지</title>
</head>
<body>
    <div class="id_text">
        <p>환영합니다 <%= session.getAttribute("id") %> 님</p>
    </div>
    <div class="admin_box">
        <p>내가 관리자다</p>
        <table>
            <tr>
                <th>NO</th>
                <th>ID</th>
                <th>E-MAIL</th>
            </tr>
            <tr>
                <td>1</td>
                <td>kimgwangmin</td>
                <td>kgm@naver.com</td>
            </tr>
            <tr>
                <td>2</td>
                <td>kay</td>
                <td>kimayun@naver.com</td>
            </tr>
            <tr>
                <td>3</td>
                <td>kwd</td>
                <td>kimwoody@naver.com</td>
            </tr>
        </table>
    </div>
</body>
</html>