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
		<form action="/passenger/pay" method="POST">
			<div>
				<label for="cardholdername"> Cardholder name:  </label>
				<input type="text" id="cardholdername" name="cardholdername" required>
				<input type="number" placeholder="CVV" min="100" max="999"  required>
			</div>
			<div>
				<label for="ccn"> Credit Card Number: </label>
				<input id="ccn" type="tel" inputmode="numeric" pattern="[0-9\s]{13,19}" autocomplete="cc-number" maxlength="19" placeholder="xxxx xxxx xxxx xxxx" required>
			</div>
			<div>
				<Label>Expiration Date: </label>
				<select name='expireMM' id='expireMM'>
				    <option value=''>Month</option>
				    <option value='01'>January</option>
				    <option value='02'>February</option>
				    <option value='03'>March</option>
				    <option value='04'>April</option>
				    <option value='05'>May</option>
				    <option value='06'>June</option>
				    <option value='07'>July</option>
				    <option value='08'>August</option>
				    <option value='09'>September</option>
				    <option value='10'>October</option>
				    <option value='11'>November</option>
				    <option value='12'>December</option>
				</select> 
				<select name='expireYY' id='expireYY'>
				    <option value=''>Year</option>
				    <option value='21'>2021</option>
				    <option value='22'>2022</option>
				    <option value='23'>2023</option>
				    <option value='24'>2024</option>
				    <option value='25'>2025</option>
				    <option value='26'>2026</option>
				</select> 
				
			</div>
			<div>
				<label for=""> Address: </label>
				<input type="text" id="address" name="address" value="${account.address }" required>
			</div>
			<div>
				<label for="city"> City: </label>
				<input type="text" id="city" name="city" value="${account.city }" required>
			</div>
			<div>
				<label for="postalcode"> Postal Code: </label>
				<input type="text" id="postalcode" name="postalCode" value="${account.postalCode }" required>
			</div>
			<div>
				<labeL for="country"> Country: </labeL>
				<input type="text" id="country" name="country" value="${account.country }" required>
			</div>
			<input type="hidden" name="amountPaid" value="${reservation.amountPaid}">
			<input type="hidden" name="totalPassenger" value="${reservation.totalPassenger }">
			<input type="hidden" name="flightCode" value="${reservation.flightCode }">
			<input type="hidden" name="custId" value="${reservation.custId}">
			<div>
				<button type="submit">Confirm Payment</button>
				<button type="button" onclick="location.href = '/booking-page'">Cancel</button>
			</div>
		</form>
	</div>
	<script>
		document.getElementById('ccn').addEventListener('input', function (e) {
		  e.target.value = e.target.value.replace(/[^\dA-Z]/g, '').replace(/(.{4})/g, '$1 ').trim();
		});
	</script>
</body>
</html>