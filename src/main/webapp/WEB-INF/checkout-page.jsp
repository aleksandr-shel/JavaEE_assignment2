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
<title>Checkout page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/checkout-page-style.css">
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
		<h1> Checkout Information</h1>
		<form class="checkout-form" action="/passenger/book-flight" method="POST">
			<input type="hidden" name="custId" value="${accountId }">
			<input type="hidden" name="flightCode" value="${flightCode}">
			<input type="hidden" name="flightPrice" value="${priceFlight}" id="flightPrice">
			<div>
				<label for="totalPassenger"> Total passenger: </label>
				<input type="number" id="totalPassenger" name="totalPassenger" required min="1">
			</div>
			<div>
				<label for="amountpaid"> Amount to pay: $</label>
				<input type="number" id="amountpaid" disabled name="amountPaid">
			</div>
			<div>
				<button type="submit">Move to Payment Information</button>
				<button type="button" onclick="location.href = '/booking-page'">Cancel</button>
			</div>
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath }/resources/script.js"></script>
</body>
</html>