<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User</title>
<link rel="shortcut icon" href="images/car-title.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="js/registerValidation.js">
</script>
</head>
<body>
	<form action="add.htm" method="post" name="registration" id="registrationForm">

		<table>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="fname" size="20" id="fname" maxlength="20"/></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lname" size="20" id="lname" maxlength="20"/></td>
			</tr>
			<tr>
				<td>Email Id:</td>
				<td><input type="email" name="emailId" size="30" id="emailId" maxlength="30"/></td>
			</tr>
			<tr>
				<td>Phone No:</td>
				<td><input type="number" name="phoneNo" size="10" id="phoneNo" maxlength="10"/></td>
			</tr>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="username" size="10" id="username" maxlength="10"/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" size="10" id="password" maxlength="10"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Register User" onclick="return submitForm(this);"/></td>
			</tr>
		</table>

	</form>

</body>
</html>