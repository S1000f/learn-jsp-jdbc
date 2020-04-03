<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update</title>

<style>
	#inputs {
		border-style: none;
	
	}

	.test {
		background-color: blue;
		width: 200px;
		height: 50px;
		border-radius: 5px;
	}

</style>
</head>
<body>
<h2>member 테이블 레코드 수정</h2>
	<form action="updateTestPro.jsp" method="post">
		id: <input type="text" name="id" id="id" maxlength="50"><br />
		password: <input type="password" name="password" id="password" maxlength="16"><br />
		name: <input id="inputs" type="text" name="name" id="name" maxlength="10"><br />
		<div>
			<input id="inputs" class="test" type="submit" value="update" />
		</div>
	</form>
</body>
</html>