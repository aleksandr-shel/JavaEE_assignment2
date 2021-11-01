package com.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.model.Flight;

public interface FlightRepository extends JpaRepository<Flight,Integer> {
	
	@Query(nativeQuery = true, value = "SELECT * FROM flight WHERE departuredate = :departuredate")
    public List<Flight> getFlightsByDate(@Param("departuredate") Date departuredate);
}
