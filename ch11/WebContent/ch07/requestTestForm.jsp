<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="requestTestPro.jsp">
		<input type="text" name="num" placeholder="input num"/><br />
		<input type="text" name="name" placeholder="input name"/><br />
		<input type="radio" name="grade" value="1" checked /> grade 1 &nbsp;
		<input type="radio" name="grade" value="2" /> grade 2 &nbsp;
		<input type="radio" name="grade" value="3"  /> grade 3 &nbsp;
		<input type="radio" name="grade" value="4" /> grade 4 <hr />
		
		<input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
	  	<label for="vehicle1"> I have a bike</label><br>
		<input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
		<label for="vehicle2"> I have a car</label><br>
		<input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
		<label for="vehicle3"> I have a boat</label><hr />
		
		<input type="checkbox" id="lec1" name="ch_lec" value="java">
		<label for="lec1"> Java</label><br>
		<input type="checkbox" id="lec2" name="ch_lec" value="html">
		<label for="lec2"> HTML</label><br>
		<input type="checkbox" id="lec3" name="ch_lec" value="cs">
		<label for="lec3"> Cs</label><br>
		<input type="submit" value="submit"><br />
		
		<input type="button" value="js button" onclick="test()">
	</form>
	
<script>
	function test() {
		var flag = false;
		var values = document.getElementsByName('ch_lec');
		for(var i = 0; i < values.length; i++) {
			if(values[i].checked) {
				document.write(values[i].value)
			}
		}
		
		return flag;
	}

</script>
</body>
</html>