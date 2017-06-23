package com.neu.webtools.beans;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.neu.webtools.beans.Car;

@Entity
@Table(name="car_status")
public class CarStatus 
{
	@Id
	@GeneratedValue
	@Column(name="carStatusId", unique = true, nullable = false)
	private int carStatusId;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="carId")
	private Car car;
	
	@Column(name="availability")
	private String availability;
	
	@Column(name="startDate")
	@Temporal(TemporalType.DATE)
	private Date startDate;
	
	@Column(name="endDate")
	@Temporal(TemporalType.DATE)
	private Date endDate;
	
	@Column(name="startTime")
	@Temporal(TemporalType.TIME)
	private Date startTime;
	
	@Column(name="endTime")
	@Temporal(TemporalType.TIME)
	private Date endtime;
	
	@Column(name="perHourRate")
	private int perHourRate;
	
	@Column(name="deleteFlag")
	private String deleteFlag;
	
	@Column(name="createdOn")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdOn;
	
	@Column(name="modifiedOn")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedOn;

	public int getCarStatusId() {
		return carStatusId;
	}

	public void setCarStatusId(int carStatusId) {
		this.carStatusId = carStatusId;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
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

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	@Override
	public String toString() {
		return "CarStatus [carStatusId=" + carStatusId + ", car=" + car + ", availability=" + availability
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", startTime=" + startTime + ", endtime="
				+ endtime + ", perHourRate=" + perHourRate + ", deleteFlag=" + deleteFlag + ", createdOn=" + createdOn
				+ ", modifiedOn=" + modifiedOn + "]";
	}
	
	
		
}
