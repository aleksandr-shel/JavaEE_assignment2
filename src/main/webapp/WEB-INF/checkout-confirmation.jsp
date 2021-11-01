<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/checkout-confirmation-style.css">
<title>Checkout Successful</title>
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
		<p>Congratulations! You've booked a flight to ${flightDestination }</p>
		<p>You've paid ${amountPaid } for ${totalPassenger } <c:choose> <c:when test="${totalPassenger ==1 }"><span>person</span></c:when><c:when test="${totalPassenger >1 }"><span>people</span></c:when></c:choose></p>
		
		<ul class="confirm-page">
			<li>
				<a href="/">Home Page</a>
			</li>
			<li>
				<a href="/account-page">Check Reservations</a>
			</li>
		</ul>
	</div>
</body>
</html>