

(function(){
	let totalPassenger = document.querySelector("#totalPassenger"), 
		amountPaid = document.querySelector("#amountpaid"),
		flightPrice=document.querySelector('#flightPrice').value;
		
	const checkoutForm = document.querySelector('.checkout-form');
	
	checkoutForm.addEventListener('submit',()=>{
		amountPaid.disabled = false;
	})
	
	amountPaid.value = (flightPrice * totalPassenger.value).toFixed(2);
	
	totalPassenger.addEventListener("change",()=>{
		amountPaid.value = (flightPrice * totalPassenger.value).toFixed(2);
	});
	
	totalPassenger.addEventListener("keyup",()=>{
		amountPaid.value = (flightPrice * totalPassenger.value).toFixed(2);
	});
	
	
})()