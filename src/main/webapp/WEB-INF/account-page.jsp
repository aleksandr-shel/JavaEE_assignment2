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
	<div class="container-flex">
		<div>
			<c:if test="${!(empty infos)}">
			<table>
				<tr>
					<th>Total Passengers</th>
					<th>Amount Paid</th>
					<th>Airline</th>
					<th>Departure Date</th>
					<th>Departure Time</th>
					<th>Departure City</th>
					<th>Departure Country</th>
					<th>Arrival Date</th>
					<th>Arrival Time</th>
					<th>Arrival City</th>
					<th>Arrival Country</th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach var="info" items="${infos}">
				<tr>
					<td>
						${info[0] }
					</td>
					<td>
						$ ${info[1]} 
					</td>
					<td>
						${info[2]} 
					</td>
					<td>
						${info[3]} 
					</td>
						
					<td>
						${info[4]} 
					</td>
					<td>
						${info[5]} 
					</td>
					<td>
						${info[6]} 
					</td>
					<td>
						${info[7]} 
					</td>
					<td>
						${info[8]} 
					</td>
					<td>
						${info[9]} 
					</td>
					<td>
						${info[10]} 
					</td>
					<td>
						<a href="/reservation/update-page?id=${info[11] }">Edit</a>
					</td>
					<td>
						<a href="/">Delete</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
		</div>
		<div>
			<ul class="account-page-list">
				<li><a href="/booking-page"> Book a flight</a></li>
				<li><a href="/passenger/update?custId=${accountId }"> Account Information</a></li>
			</ul>
		</div>
	</div>
</body>
</html>