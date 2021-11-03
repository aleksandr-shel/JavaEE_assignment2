//Aleksandr Shelukheev - 301137921
//Egor Shevchenko - 301084181

package com.spring.controller;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.model.Reservation;

@Controller
@RequestMapping("/reservation")
public class ReservationController extends BaseController {
	
	//shows information about a reservation
	@RequestMapping("/update-page")
	public String updatePage(@RequestParam("id")int reservationId, Model model) {
		Reservation reservation = resRep.getById(reservationId);
		double price = resRep.getPriceOfFlight(reservationId);
		model.addAttribute("reservation", reservation);
		model.addAttribute("price", price);
		return "reservation-update";
	}
	
	//updates information about a reservation
	@PostMapping("/update")
	public RedirectView update(@RequestParam("reservationId")int reservationId, @RequestParam("totalPassenger")int totalPassenger,
			@RequestParam("amountPaid")double amountPaid) {
		Reservation reservation = resRep.getById(reservationId);
		reservation.setAmountPaid(amountPaid);
		reservation.setTotalPassenger(totalPassenger);
		resRep.save(reservation);
		return new RedirectView("/account-page");
	}
	
	//deletes a reservation if the flight's departure date is 14 or more days away
	@RequestMapping("/delete")
	public RedirectView delete(@RequestParam("id") int reservationId) throws Exception {
		
		Reservation reservation = resRep.getById(reservationId);
		
		Date departureDateOfFlight = resRep.getDateOfFlight(reservationId);
		Date todayDate = new Date();
		
		//checks the difference between dates in milliseconds and converts it into days
		long differenceInMillies = Math.abs(departureDateOfFlight.getTime() - todayDate.getTime());
	    long differenceInDays = TimeUnit.DAYS.convert(differenceInMillies, TimeUnit.MILLISECONDS);
	    
	    //check if the flight's departure date is 14 or more days away
	    if (differenceInDays >= 14)
			resRep.delete(reservation);
		
		return new RedirectView("/account-page");
	}
}
