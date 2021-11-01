<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/checkout-page-style.css">
<title>Payment page</title>
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
	<div class="container-flex">
		<h1> Payment information</h1>
		<form action="/book-flight" method="POST">
			<div>
				<label for="cardholdername"> Cardholder name:  </label>
				<input type="text" id="cardholdername" name="cardholdername">
			</div>
			<div>
				<label for="ccn"> Credit Card Number: </label>
				<input id="ccn" type="tel" inputmode="numeric" pattern="[0-9\s]{13,19}" autocomplete="cc-number" maxlength="19" placeholder="xxxx xxxx xxxx xxxx">
			</div>
			<div>
				<button type="submit">Move to Payment Information</button>
				<button type="button" onclick="location.href = '/booking-page'">Cancel</button>
			</div>
		</form>
	</div>
</body>
</html>