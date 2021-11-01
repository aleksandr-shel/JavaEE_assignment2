package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.model.Reservation;


public interface ReservationRepository extends JpaRepository<Reservation,Integer>{

	@Query("SELECT r FROM Reservation r WHERE r.custId = :custid")
	public List<Reservation> getReservationByCustId(@Param("custid")int custid);
}
