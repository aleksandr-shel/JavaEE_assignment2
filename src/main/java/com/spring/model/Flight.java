package com.spring.model;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="flight")
public class Flight {
	
	@Id
	@Column(name="flightcode")
	private int flightCode;
	
	@Column(name="airlinename")
	private String airlineName;
	
	@Column(name="departuredate")
	private Date departureDate;
	
	@Column(name="departuretime")
	private Timestamp departureTime;
	
	@Column(name="departurecity")
	private String departureCity;
	
	@Column(name="departurecountry")
	private String departureCountry;
	
	@Column(name="arrivaldate")
	private Date arrivalDate;
	
	@Column(name="arrivaltime")
	private Timestamp arrivalTime;
	
	@Column(name="arrivalcity")
	private String arrivalCity;
	
	@Column(name="arrivalcountry")
	private String arrivalCountry;
	
	private String fare;
	
	private double price;
	
	public Flight() {
		
	}

	public int getFlightCode() {
		return flightCode;
	}




	public void setFlightCode(int flightCode) {
		this.flightCode = flightCode;
	}




	public String getAirlineName() {
		return airlineName;
	}




	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}




	public String getDepartureDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		return dateFormat.format(departureDate);
	}




	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}




	public String getDepartureTime() {
		DateFormat dateFormat = new SimpleDateFormat("HH:mm");  
		return dateFormat.format(departureTime);
	}




	public void setDepartureTime(Timestamp departureTime) {
		this.departureTime = departureTime;
	}




	public String getDepartureCity() {
		return departureCity;
	}




	public void setDepartureCity(String departureCity) {
		this.departureCity = departureCity;
	}




	public String getDepartureCountry() {
		return departureCountry;
	}




	public void setDepartureCountry(String departureCountry) {
		this.departureCountry = departureCountry;
	}




	public String getArrivalDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		return dateFormat.format(arrivalDate);
	}




	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}




	public String getArrivalTime() {
		DateFormat dateFormat = new SimpleDateFormat("HH:mm");
		return dateFormat.format(arrivalTime);
	}




	public void setArrivalTime(Timestamp arrivalTime) {
		this.arrivalTime = arrivalTime;
	}




	public String getArrivalCity() {
		return arrivalCity;
	}




	public void setArrivalCity(String arrivalCity) {
		this.arrivalCity = arrivalCity;
	}




	public String getArrivalCountry() {
		return arrivalCountry;
	}




	public void setArrivalCountry(String arrivalCountry) {
		this.arrivalCountry = arrivalCountry;
	}




	public String getFare() {
		return fare;
	}




	public void setFare(String fare) {
		this.fare = fare;
	}




	public double getPrice() {
		return price;
	}




	public void setPrice(double price) {
		this.price = price;
	}
	
	
	
	
}
