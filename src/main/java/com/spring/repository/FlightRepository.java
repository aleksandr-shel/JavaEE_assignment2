package com.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.model.Flight;

public interface FlightRepository extends JpaRepository<Flight,Integer> {

}
