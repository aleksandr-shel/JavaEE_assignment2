<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/sign-page-style.css">
</head>
<body>
	
	<div class="container-flex">
	
		<form id="signupForm" action="/passenger/create" method="POST">
			<h1> Sign Up</h1>
			<div>
				<label for="username">Username: </label>
				<input type="text" name="username" id ="username" required>
			</div>
			<div>
				<label for="password">Password: </label>
				<input type="password" name="password" id="password" required>
			</div>
			<div>
				<label for="firstname">Firstname:</label>
				<input type="text" name="firstname"  id="firstname" required>
			</div>
			<div>
				<label for="lastname">Lastname:</label>
				<input type="text" name="lastname" id="lastname" required>
			</div>
			<div>
				<button type="submit"> Register</button>
				<button type="button" onclick="location.href = '/'">Cancel</button>
			</div>
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath }/resources/script.js"></script>
</body>
</html>