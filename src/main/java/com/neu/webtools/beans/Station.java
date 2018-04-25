package com.neu.webtools.beans;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="station")
public class Station 
{
	@Id
	@GeneratedValue
	private int stationId;
	
	@Column(name="latitude")
	private String latitude;
	
	@Column(name="longitude")
	private String longitude;
	
	@Column(name="address")
	private String address;
	
	@Column(name="zipcode")
	private String zipcode;
	
	@Column(name="city")
	private String city;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "station")
	private List<RentalTransaction> rentalTransactionList;

	public int getStationId() {
		return stationId;
	}

	public void setStationId(int stationId) {
		this.stationId = stationId;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<RentalTransaction> getRentalTransactionList() {
		return rentalTransactionList;
	}

	public void setRentalTransactionList(List<RentalTransaction> rentalTransactionList) {
		this.rentalTransactionList = rentalTransactionList;
	}

	@Override
	public String toString() {
		return "Station [stationId=" + stationId + ", latitude=" + latitude + ", longitude=" + longitude + ", address="
				+ address + ", zipcode=" + zipcode + ", city=" + city + ", rentalTransactionList="
				+ rentalTransactionList + "]";
	}
	
}
