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
<title>Account Information</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/account-settings-page-style.css">
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
		<h1> Account information</h1>
		<form action="/passenger/update" method="POST">
			<input type="hidden" name="custId" value="${account.custId }">
			<div>
				<label for="firstname"> Firstname: </label>
				<input type="text" id="firstname" name="firstname" value="${account.firstname }" required>
			</div>
			<div>
				<label for="lastname"> Lastname: </label>
				<input type="text" id="lastname" name="lastname" value="${account.lastname }" required>
			</div>
			<div>
				<label for="phonenumber"> Phone number: </label>
				<input type="text" id="phonenumber" name="phoneNumber" value="${account.phoneNumber }">
			</div>
			<div>
				<label for=""> Address: </label>
				<input type="text" id="address" name="address" value="${account.address }">
			</div>
			<div>
				<label for="city"> City: </label>
				<input type="text" id="city" name="city" value="${account.city }">
			</div>
			<div>
				<label for="postalcode"> Postal Code: </label>
				<input type="text" id="postalcode" name="postalCode" value="${account.postalCode }">
			</div>
			<div>
				<labeL for="country"> Country: </labeL>
				<input type="text" id="country" name="country" value="${account.country }">
			</div>
			
			
			
			<div>
				<button type="submit">Update</button>
				<button type="button" onclick="location.href = '/account-page'">Cancel</button>
			</div>
		</form>
	</div>
</body>
</html>