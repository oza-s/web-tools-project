package com.neu.webtools.beans;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="rental_transaction")
public class RentalTransaction 
{
	@Id
	@GeneratedValue
	@Column(name="rentalTransactionId", unique = true, nullable = false)
	private int rentalTransctionId;
	
	@ManyToOne
	@JoinColumn(name="carId", nullable = true)
	private Car car;
	
	@Column(name="bookingReferenceNumber")
	private String bookingReferenceNumber;
	
	@Column(name="availability")
	private String availability;
	
	@Column(name="startDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDateTime;
	
	@Column(name="endDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endDateTime;
	
	@Column(name="perHourRate")
	private int perHourRate;
	
	@Column(name="deleteFlag")
	private String deleteFlag;
	
	@Column(name="pickUpTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date pickUpTime;
	
	@Column(name="returnTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date returnTime;
	
	@Column(name="createdOn")
	//@Temporal(TemporalType.TIMESTAMP)
	private Timestamp createdOn;
	
	@Column(name="modifiedOn")
	//@Temporal(TemporalType.TIMESTAMP)
	private Timestamp modifiedOn;

	@ManyToOne(fetch = FetchType.LAZY,optional=false)
	@JoinColumn(name="userId", nullable = true)
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY,optional=false)
	@JoinColumn(name="stationId", nullable = true)
	private Station station;

	public int getRentalTransctionId() {
		return rentalTransctionId;
	}

	public void setRentalTransctionId(int rentalTransctionId) {
		this.rentalTransctionId = rentalTransctionId;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public Date getStartDateTime() {
		return startDateTime;
	}

	public void setStartDateTime(Date startDateTime) {
		this.startDateTime = startDateTime;
	}

	public Date getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(Date endDateTime) {
		this.endDateTime = endDateTime;
	}

	public int getPerHourRate() {
		return perHourRate;
	}

	public void setPerHourRate(int perHourRate) {
		this.perHourRate = perHourRate;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Date getPickUpTime() {
		return pickUpTime;
	}

	public void setPickUpTime(Date pickUpTime) {
		this.pickUpTime = pickUpTime;
	}

	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Timestamp getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Timestamp modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Station getStation() {
		return station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public String getBookingReferenceNumber() {
		return bookingReferenceNumber;
	}

	public void setBookingReferenceNumber(String bookingReferenceNumber) {
		this.bookingReferenceNumber = bookingReferenceNumber;
	}
	
}
