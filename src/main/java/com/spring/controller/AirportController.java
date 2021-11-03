//Aleksandr Shelukheev - 301137921
//Egor Shevchenko - 301084181

package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Flight;
import com.spring.model.Reservation;

@Controller
public class AirportController extends BaseController {

	//home page
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("signedIn", signedIn);
		return "index";
	}

	//signup page
	@RequestMapping("/signup-page")
	public String signup() {
		return "signup_page";
	}

	//signin page
	@RequestMapping("/signin-page")
	public String signin(Model model) {
		return "signin_page";
	}

	//shows account page with information about reservations 
	@RequestMapping("/account-page")
	public String accountpage(Model model) {
		if (signedIn) {
			
			List<String[]> info = resRep.getReservationInfo(accountId);
			
			model.addAttribute("infos", info);
			model.addAttribute("signedIn", signedIn);
			model.addAttribute("accountId", accountId);
			return "account-page";
		}
		return "error-signin";
	}

	//shows booking page with information of flights
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

	//shows checkout page 
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

