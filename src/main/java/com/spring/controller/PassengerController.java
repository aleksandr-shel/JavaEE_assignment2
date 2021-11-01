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

import com.spring.model.Passenger;
import com.spring.repository.PassengerRepository;

@Controller
@RequestMapping("/passenger")
public class PassengerController extends BaseController{
	
	@Autowired
	private PassengerRepository pasRep;
	
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
	
	@RequestMapping("/sign-off")
	public RedirectView signoff() {
		signedIn = false;
		return new RedirectView("/");
	}
	
	@RequestMapping("/sign-in-error")
	public String signerror() {
		return "error-signin";
	}
	
	
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
}
