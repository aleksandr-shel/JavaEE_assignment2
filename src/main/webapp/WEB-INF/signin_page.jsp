<!--
Aleksandr Shelukheev - 301137921
Egor Shevchenko - 301084181
--> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/sign-page-style.css">
</head>
<body>
	<div class="container-flex">
	
		<form id="signinForm" action="/passenger/signin" method="GET">
			<h1> Sign In</h1>
			<div>
				<label for="username">Username: </label>
				<input type="text" name="username" id ="username" required>
			</div>
			<div>
				<label for="password">Password: </label>
				<input type="password" name="password" id="password" required>
			</div>
			<div>
				<button type="submit"> Login</button>
				<button type="button" onclick="location.href = '/'">Cancel</button>
			</div>
		</form>
	</div>
	<script src="${pageContext.request.contextPath }/resources/script.js"></script>
</body>
</html>