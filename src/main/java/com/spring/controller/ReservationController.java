package com.spring.controller;

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
	
	
	@RequestMapping("/update-page")
	public String updatePage(@RequestParam("id")int reservationId, Model model) {
		Reservation reservation = resRep.getById(reservationId);
		double price = resRep.getPriceOfFlight(reservationId);
		model.addAttribute("reservation", reservation);
		model.addAttribute("price", price);
		return "reservation-update";
	}
	
	@PostMapping("/update")
	public RedirectView update(@RequestParam("reservationId")int reservationId, @RequestParam("totalPassenger")int totalPassenger,
			@RequestParam("amountPaid")double amountPaid) {
		Reservation reservation = resRep.getById(reservationId);
		reservation.setAmountPaid(amountPaid);
		reservation.setTotalPassenger(totalPassenger);
		resRep.save(reservation);
		return new RedirectView("/account-page");
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") int reservationId) {
		
		return "reservation-update";
	}
}
