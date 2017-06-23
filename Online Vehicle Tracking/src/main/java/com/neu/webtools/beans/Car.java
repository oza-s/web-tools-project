package com.neu.webtools.beans;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="car")
public class Car 
{
	@Id
	@GeneratedValue
	@Column(name="carId", unique = true, nullable = false)
	public int carId;
	
	@Column(name="model")
	public String model;
	
	@Column(name="company")
	public String company;
	
	@Column(name="seater")
	public int seater;
	
	@Column(name="color")
	public String color;
	
	@Column(name="mileage")
	public float mileage;
	
	@Column(name="purchaseYear")
	public Date purchaseYear;
	
	@Column(name="price")
	public float price;
	
	@Column(name="perHourRate")
	public int perHourrate;
	
	@Column(name="gearType")
	public String gearType;
	
	@Column(name="numberPlate")
	public String numberPlate;
	
	@Column(name="fuelType")
	public String fuelType;
	
	@Column(name="isAC")
	public String isAC;
	
	@Column(name="madeInYear")
	public Date madeInYear;
	
	@Column(name="comments")
	public String comments;
	
	@Column(name="tradeInType")
	public String tradeInType;

	@Column(name="deleteFlag")
	public String deleteFlag;
	
	@Column(name="status")
	public String status;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="car")
	public List<Images> imageList;

	@OneToMany(fetch = FetchType.LAZY, mappedBy="car")
	public List<RentalTransaction> reantalTransactionList;
	
	@OneToOne(mappedBy="car")
	public CarStatus carStatus;
	
	public CarStatus getCarStatus() {
		return carStatus;
	}

	public void setCarStatus(CarStatus carStatus) {
		this.carStatus = carStatus;
	}

	public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getSeater() {
		return seater;
	}

	public void setSeater(int seater) {
		this.seater = seater;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public float getMileage() {
		return mileage;
	}

	public void setMileage(float mileage) {
		this.mileage = mileage;
	}

	public Date getPurchaseYear() {
		return purchaseYear;
	}

	public void setPurchaseYear(Date purchaseYear) {
		this.purchaseYear = purchaseYear;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getGearType() {
		return gearType;
	}

	public void setGearType(String gearType) {
		this.gearType = gearType;
	}

	public String getNumberPlate() {
		return numberPlate;
	}

	public void setNumberPlate(String numberPlate) {
		this.numberPlate = numberPlate;
	}

	public String getFuelType() {
		return fuelType;
	}

	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}

	public String getIsAC() {
		return isAC;
	}

	public void setIsAC(String isAC) {
		this.isAC = isAC;
	}

	public Date getMadeInYear() {
		return madeInYear;
	}

	public void setMadeInYear(Date madeInYear) {
		this.madeInYear = madeInYear;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getTradeInType() {
		return tradeInType;
	}

	public void setTradeInType(String tradeInType) {
		this.tradeInType = tradeInType;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Images> getImageList() {
		return imageList;
	}

	public void setImageList(List<Images> imageList) {
		this.imageList = imageList;
	}

	public int getPerHourrate() {
		return perHourrate;
	}

	public void setPerHourrate(int perHourrate) {
		this.perHourrate = perHourrate;
	}

	public List<RentalTransaction> getReantalTransactionList() {
		return reantalTransactionList;
	}

	public void setReantalTransactionList(List<RentalTransaction> reantalTransactionList) {
		this.reantalTransactionList = reantalTransactionList;
	}

	@Override
	public String toString() {
		return "Car [carId=" + carId + ", model=" + model + ", company=" + company + ", seater=" + seater + ", color="
				+ color + ", mileage=" + mileage + ", purchaseYear=" + purchaseYear + ", price=" + price
				+ ", perHourrate=" + perHourrate + ", gearType=" + gearType + ", numberPlate=" + numberPlate
				+ ", fuelType=" + fuelType + ", isAC=" + isAC + ", madeInYear=" + madeInYear + ", comments=" + comments
				+ ", tradeInType=" + tradeInType + ", deleteFlag=" + deleteFlag + ", status=" + status  + ", carStatus=" + carStatus + "]";
	}

}
