//Aleksandr Shelukheev - 301137921
//Egor Shevchenko - 301084181

package com.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.model.Passenger;

public interface PassengerRepository extends JpaRepository<Passenger, Integer>{
	
	
	
}
