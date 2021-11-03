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
<title>Failed to Login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/signin-error-page-style.css">
</head>
<body>
	<div class="container">
		<h1 style="color:red;">Failed to login</h1>
		
		<ul class="signin-error-list">
			<li>
				<a href="/signin-page">Try again</a>
			</li>
			<li>
				<a href="/signup-page">Register</a>
			</li>
			<li>
				<a href="/">Home page</a>
			</li>
		</ul>
		
	</div>
</body>
</html>