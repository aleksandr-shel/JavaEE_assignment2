<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Signing up</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/signin-error-page-style.css">
</head>
<body>
	<div class="container">
		<h1 style="color:red;">Account with this username already exists</h1>
		
		<ul class="signin-error-list">
			<li>
				<a href="/signup-page">Try again</a>
			</li>
			<li>
				<a href="/">Home page</a>
			</li>
		</ul>
		
	</div>
</body>
</html>