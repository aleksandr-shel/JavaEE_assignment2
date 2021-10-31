<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/account-page-style.css">
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
		<h4> Here will be reservation list of an account</h4>
		<a href="/booking-page"> Book a flight</a>
		<a href="/passenger/update?custId=${accountId }"> Account Information</a>
	</div>
</body>
</html>