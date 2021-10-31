package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.repository.FlightRepository;

public class BaseController {
	protected static boolean signedIn = false;
	
	protected static int accountId = 0;
	
	@Autowired
	protected FlightRepository flightRep;
}
