package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.Flight;
import com.spring.repository.FlightRepository;

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
			model.addAttribute("signedIn", signedIn);
			model.addAttribute("accountId",accountId);
			return "account-page";
		}
		return "error-signin";
	}
	
	
	@RequestMapping("/booking-page")
	public String bookingpage(Model model) {
		if (signedIn) {
			List<Flight> list = flightRep.findAll();
			model.addAttribute("signedIn", signedIn);
			model.addAttribute("flights",list);
			
			return "booking_page";
		}

		return "error-signin";
	}
}
