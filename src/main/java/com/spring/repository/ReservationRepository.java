package com.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation,Integer>{

}
