<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/booking-page-style.css">
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
	
	<br>
	
	<div>
		<form action="/booking-page" method="POST">

		<section>
			<label for="searchDeparture">Departure Date: </label>
			<input id="searchDeparture" name="searchDeparture" placeholder="yyyy-mm-dd" maxlength="10"
														pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" required>
														
			<br><br>
			
			<label for="searchArrival">Arrival Date: </label>
			<input id="searchArrival" name="searchArrival" placeholder="yyyy-mm-dd" maxlength="10"
														pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" required>
														
			<br><br>
			
			<label for="numberPassengers">Number of Passengers: </label>
			<input type="number" id="numberPassengers" name="numberPassengers" min="1" step="1" required>
		</section>
		
		<br>
		
		<section>
			<input type="submit" id="searchButton" name="searchButton" value="Search" />
		</section>
		
		</form>
	</div>
	
	<div class="container">
		<table>
			<tr>
				<th>
					Airline Name
				</th>
				<th>
					Departure Date
				</th>
				<th>
					Departure Time
				</th>
				<th>
					Departure City
				</th>
				<th>
					Departure Country
				</th>
				<th>
					Arrival Date
				</th>
				<th>
					Arrival Time
				</th>
				<th>
					Arrival City
				</th>
				<th>
					Arrival Country
				</th>
				<th>
					Fare
				</th>
				<th>
					Price
				</th>
				<th>
				</th>
			</tr>
			<c:forEach var="flight" items="${flights }">
				<tr>
					<td>
						${flight.airlineName }
					</td>
					<td>
						${flight.departureDate}
					</td>
					<td>
						${flight.departureTime }
					</td>
					<td>
						${flight.departureCity }
					</td>
					<td>
						${flight.departureCountry }
					</td>
					<td>
						${flight.arrivalDate }
					</td>
					<td>
						${flight.arrivalTime }
					</td>
					<td>
						${flight.arrivalCity }
					</td>
					<td>
						${flight.arrivalCountry }
					</td>
					<td>
						${flight.fare }
					</td>
					<td>
						${flight.price}
					</td>
					<td>
						<a href="/checkout-flight?flightCode=${flight.flightCode }"> Book a flight </a>
					</td>
				</tr>
			</c:forEach>
	
		</table>
	</div>
</body>
</html>