package com.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reservation")
public class Reservation {
	@Id
	@Column(name="reservationId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int reservationId;
	
	@Column(name="custid")
	private int custId;
	
	@Column(name="flightcode")
	private int flightCode;
	
	@Column(name="totalpassenger")
	private int totalPassenger;
	
	@Column(name="amountpaid")
	private double amountPaid;
	
	public Reservation() {
		
	}

	public Reservation(int custId, int flightCode, int totalPassenger, double amountPaid) {
		super();
		this.custId = custId;
		this.flightCode = flightCode;
		this.totalPassenger = totalPassenger;
		this.amountPaid = amountPaid;
	}

	public Reservation(int reservationId, int custId, int flightCode, int totalPassenger, double amountPaid) {
		super();
		this.reservationId = reservationId;
		this.custId = custId;
		this.flightCode = flightCode;
		this.totalPassenger = totalPassenger;
		this.amountPaid = amountPaid;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public int getFlightCode() {
		return flightCode;
	}

	public void setFlightCode(int flightCode) {
		this.flightCode = flightCode;
	}

	public int getTotalPassenger() {
		return totalPassenger;
	}

	public void setTotalPassenger(int totalPassenger) {
		this.totalPassenger = totalPassenger;
	}

	public double getAmountPaid() {
		return amountPaid;
	}

	public void setAmountPaid(double amountPaid) {
		this.amountPaid = amountPaid;
	}
	
}
