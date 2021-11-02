package com.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.model.Reservation;


public interface ReservationRepository extends JpaRepository<Reservation,Integer>{
	
	// this query gets all information about a reserved flight
	@Query(nativeQuery = true, value ="select totalPassenger, amountPaid, airlineName, \r\n"
			+ "	departureDate, departureTime, departureCity, departureCountry, arrivalDate, arrivalTime,\r\n"
			+ " arrivalCity, arrivalCountry, reservationId from reservation r inner join flight f on r.flightCode = f.flightCode where r.custId = :custid")
	public	List<String[]> getReservationInfo(int custid);
	
	//this query gets a price of a resesrved flight
	@Query(nativeQuery = true, value="select price from reservation r inner join flight f on r.flightCode = f.flightCode where r.reservationId = :reservationid")
	public double getPriceOfFlight(int reservationid);
	
	// this query gets a date of a reserved flight
	@Query(nativeQuery = true, value="select departureDate from reservation r inner join flight f on r.flightCode = f.flightCode where r.reservationId = :reservationid")
	public Date getDateOfFlight(int reservationid);
}
