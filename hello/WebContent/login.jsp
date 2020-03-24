<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOG IN</title>

<style>
	.wrap {
		position: relative;
		width: 1024px;
		height: 500px;
	}

	.form-container {
		position: absolute;
		width: 400px;
		margin: 0 auto;
	
	}

</style>
</head>
<body>
	<div class="wrap">
		<div class="form-container">
			<form action="loginChecked.jsp" method="post">
				<div>
					<p>ID:</p> 
					<input type="text" name="inputid" class="inputid" />
				</div>
				<div>
					<p>password:</p>
					<input type="text" name="inputpasswd" class="inputpasswd" />
					<input type="submit" value="Log in" />
				</div>
				<br />
				<div>
					<button type="button" onclick="location.href='insertMember.jsp'">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>