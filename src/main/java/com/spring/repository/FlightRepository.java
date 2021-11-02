package com.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.model.Flight;

public interface FlightRepository extends JpaRepository<Flight,Integer> {
	
	//this query filters flights by their departure and arrival dates
	@Query(nativeQuery = true, value = "SELECT * FROM flight WHERE departuredate = :departuredate AND arrivaldate = :arrivaldate  ")
    public List<Flight> getFlightsByDate(@Param("departuredate") Date departuredate, Date arrivaldate);
}
