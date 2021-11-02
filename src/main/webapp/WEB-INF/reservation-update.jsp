<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation update</title>
</head>
<body>
	<form method="POST" action="/reservation/update" class="reservation-update-form">
	
		<input type="hidden" name="reservationId" value="${reservation.reservationId }">
		
		<input type="number" id="totalPassenger" name="totalPassenger" value="${reservation.totalPassenger }">
		
		<input type="number" id="amountpaid" name="amountPaid" min="${price }" disabled value="${reservation.amountPaid }">
		
		<button type="submit"> Update</button>
		<button type="button" onclick="location.href = '/booking-page'">Cancel</button>
	</form>
	
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