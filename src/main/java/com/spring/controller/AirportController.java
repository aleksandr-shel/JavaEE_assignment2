package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Flight;
import com.spring.model.Passenger;
import com.spring.model.Reservation;

@Controller
public class AirportController extends BaseController {

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("signedIn", signedIn);
		return "index";
	}

	@RequestMapping("/signup-page")
	public String signup() {
		return "signup_page";
	}

	@RequestMapping("/signin-page")
	public String signin(Model model) {
		return "signin_page";
	}

	@RequestMapping("/account-page")
	public String accountpage(Model model) {
		if (signedIn) {
			List<Reservation> reservations = resRep.getReservationByCustId(accountId);
			//List<Reservation> reservations = resRep.findAll();
			model.addAttribute("reservations", reservations);
			model.addAttribute("signedIn", signedIn);
			model.addAttribute("accountId", accountId);
			return "account-page";
		}
		return "error-signin";
	}

	@RequestMapping("/booking-page")
	public String bookingpage(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		if (signedIn) {

			List<Flight> listFlights;

			String searchDepartureString = request.getParameter("searchDeparture");
			String searchArrivalString = request.getParameter("searchArrival");

			if (searchDepartureString != null && searchArrivalString != null) {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				Date searchDepartureDate = sdf.parse((searchDepartureString));
				Date searchArrivalDate = sdf.parse((searchArrivalString));

				listFlights = flightRep.getFlightsByDate(searchDepartureDate, searchArrivalDate);
			} else {
				listFlights = flightRep.findAll();
			}

			model.addAttribute("signedIn", signedIn);
			model.addAttribute("flights", listFlights);

			return "booking_page";
		}

		return "error-signin";
	}

	/*
	 * @RequestMapping("/booking-page") public String bookingpage(Model model) { if
	 * (signedIn) { List<Flight> list = flightRep.findAll();
	 * model.addAttribute("signedIn", signedIn); model.addAttribute("flights",
	 * list);
	 * 
	 * return "booking_page"; }
	 * 
	 * return "error-signin"; }
	 */


//	@RequestMapping("/search")
//	public String search(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//
//		if (signedIn) {
//			String searchDateString = request.getParameter("search");
//			Date searchDate = new SimpleDateFormat("yyyy-MM-dd").parse((searchDateString));
//
//			List<Flight> listFlights = flightRep.getFlightsByDate(searchDate, searchDate);
//
//			model.addAttribute("flights", listFlights);
//
//			return "booking_page";
//		}
//
//		return "error-signin";
//	}
	
	@RequestMapping("/checkout-flight")
	public String checkoutpage(@RequestParam("flightCode") int flightCode, Model model) {
		
		if (signedIn) {
			model.addAttribute("accountId",accountId);
			model.addAttribute("flightCode",flightCode);
			model.addAttribute("signedIn", signedIn);
			model.addAttribute("priceFlight", flightRep.getById(flightCode).getPrice());
			return "checkout-page";
		}else {
			return "error-signin";
		}
	}
	
}

