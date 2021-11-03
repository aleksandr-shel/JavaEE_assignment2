//Aleksandr Shelukheev - 301137921
//Egor Shevchenko - 301084181

package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.model.Flight;
import com.spring.model.Passenger;
import com.spring.model.Reservation;
import com.spring.repository.PassengerRepository;

@Controller
@RequestMapping("/passenger")
public class PassengerController extends BaseController{
	
	@Autowired
	private PassengerRepository pasRep;
	
	
	//verification process 
	@GetMapping("/signin")
	public RedirectView signin(@RequestParam("username") String username, @RequestParam("password") String password) {
		List<Passenger> list = pasRep.findAll();
		for (Passenger pas : list) {
			if (pas.getUsername().equals(username)) {
				if (pas.getPassword().equals(password)) {
					signedIn = true;
					accountId = pas.getCustId();
					return new RedirectView("/");
				}
			}
		}
		return new RedirectView("sign-in-error");
	}
	
	//sign off process 
	@RequestMapping("/sign-off")
	public RedirectView signoff() {
		signedIn = false;
		accountId = 0;
		return new RedirectView("/");
	}
	
	// verification error / error to login
	@RequestMapping("/sign-in-error")
	public String signerror() {
		return "error-signin";
	}
	
	// signup process / creating a new user
	@PostMapping("/create")
	public String signup(@RequestParam("username") String username, @RequestParam("password") String password, 
			@RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname) {
		
		
		List<Passenger> passengers = pasRep.findAll();
		
		
		
		boolean usernameExists = false;
		
		for (Passenger passenger : passengers) {
			if (passenger.getUsername().equals(username)) {
				usernameExists = true;
			}
		}
		
		if (!usernameExists) {
			Passenger pass = new Passenger(username, password, firstname, lastname);
			pasRep.save(pass);
			return "index";
		} else {
			return "error-signup";
		}
	}
	
	// account settings page where user can update account information
	@GetMapping("/update")
	public String getUpdate(@RequestParam("custId") int custId, Model model) {
		if (signedIn) {
			Passenger pass = pasRep.getById(custId);
			model.addAttribute("account", pass);
			model.addAttribute("signedIn",signedIn);
			return "account-settings-update-page";
		} else {
			return "error-signin";
		}
	}
	
	// update account information process
	@PostMapping("/update")
	public String postUpdate(@RequestParam("custId") int custId, @RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("address") String address, @RequestParam("city") String city, @RequestParam("postalCode") String postalCode,
			@RequestParam("country") String country, Model model) {
		
		Passenger pas = pasRep.getById(custId);
		pas.setFirstname(firstname);
		pas.setLastname(lastname);
		pas.setPhoneNumber(phoneNumber);
		pas.setAddress(address);
		pas.setCity(city);
		pas.setPostalCode(postalCode);
		pas.setCountry(country);
		pasRep.save(pas);
		
		model.addAttribute("account", pas);
		
		return "account-settings-update-page";
	}
	
	// process of booking a flight / inserting booking information
	@PostMapping("/book-flight")
	public String bookflight(@RequestParam("custId") int accountId, @RequestParam("flightCode") int flightCode, 
			@RequestParam("totalPassenger") int totalPassengers, @RequestParam("amountPaid") double amountPaid, Model model) {
		System.out.println(accountId);
		if (signedIn) {
			Passenger passenger = pasRep.getById(accountId);
			Reservation reservation = new Reservation(accountId, flightCode, totalPassengers, amountPaid);
			model.addAttribute("signedIn", signedIn);
			model.addAttribute("account", passenger);
			model.addAttribute("reservation", reservation);
			return "payment-page";
		} else {
			return "error-signin";
		}
	}
	
	
	// simulation of payment process
	@PostMapping("/pay")
	public String pay(@RequestParam("flightCode") int flightCode, @RequestParam("custId") int custId, @RequestParam("totalPassenger") int totalPassengers, @RequestParam("amountPaid") double amountPaid, Model model) {
		Flight flight = flightRep.getById(flightCode);
		if (signedIn) {
			resRep.save(new Reservation(custId, flightCode, totalPassengers, amountPaid));
			model.addAttribute("signedIn", signedIn);
			model.addAttribute("flightDestination",flight.getArrivalCity() + ", " + flight.getArrivalCountry());
			model.addAttribute("totalPassenger", totalPassengers);
			model.addAttribute("amountPaid", amountPaid);
			return "checkout-confirmation";
		}
		return "error-signin";
	}
}
