package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.repository.FlightRepository;
import com.spring.repository.ReservationRepository;

public class BaseController {
	
	// simulation of sign in process with boolean
	protected static boolean signedIn = false;
	protected static int accountId = 0;
	
	@Autowired
	protected FlightRepository flightRep;
	
	@Autowired
	protected ReservationRepository resRep;
}
