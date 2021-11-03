<!--
Aleksandr Shelukheev - 301137921
Egor Shevchenko - 301084181
--> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
</head>
<body>
	<nav>
		<ul>
			<li>
				<a href="/">Home</a>
			</li>
			<c:if test="${!signedIn }">
				<li class="dropdown">
					<a>Customer Sign In</a>
					<div class="dropdown-content">
						<a href="/signin-page">Sign in</a>
						<a href="/signup-page">New customer? <span class="bluespan">Sign up now</span></a>
					</div>
				</li>
			</c:if>
			<c:if test="${signedIn }">
				<li>
					<a href="/account-page">Account</a>
				</li>
				<li>
					<a href="/booking-page">Book a flight</a>
				</li>
				<li>
					<a href="/passenger/sign-off">Sign Off</a>
				</li>
			</c:if>
			
		</ul>
	</nav>
	
	<div class="container">
		<h1 style="text-align:center">Welcome to Online Flight Reservation</h1>
	</div>
	
	<script src="${pageContext.request.contextPath }/resources/script.js"></script>
</body>
</html>