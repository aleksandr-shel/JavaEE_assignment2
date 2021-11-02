<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation update</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/reservation-update-style.css">
</head>
<body>
	<div class="container-flex">
		<form method="POST" action="/reservation/update" class="reservation-update-form">
	
			<input type="hidden" name="reservationId" value="${reservation.reservationId }">
			
			<div>
				<label for="totalPassenger">Total Passengers: </label>
				<input type="number" id="totalPassenger" name="totalPassenger" value="${reservation.totalPassenger }">
			</div>
			<div>
				<label for="amountPaid"> Amount Paid: </labeL>
				<input type="number" id="amountpaid" name="amountPaid" min="${price }" disabled value="${reservation.amountPaid }">
			</div>
			
			<div>
				<button type="submit"> Update</button>
				<button type="button" onclick="location.href = '/account-page'">Cancel</button>
			</div>
		</form>
	</div>
	
	<script>
	let totalPassenger = document.querySelector("#totalPassenger"), 
	amountPaid = document.querySelector("#amountpaid");
	
	const checkoutForm = document.querySelector('.reservation-update-form');
	
	checkoutForm.addEventListener('submit',()=>{
		amountPaid.disabled = false;
	})
	
	amountPaid.value = (amountPaid.min * totalPassenger.value).toFixed(2);
	
	totalPassenger.addEventListener("change",()=>{
		amountPaid.value = (amountPaid.min * totalPassenger.value).toFixed(2);
	});
	
	totalPassenger.addEventListener("keyup",()=>{
		amountPaid.value = (amountPaid.min * totalPassenger.value).toFixed(2);
	});
	</script>
</body>
</html>