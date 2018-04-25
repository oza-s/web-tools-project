package com.neu.webtools.beans;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="images")
public class Images 
{
	@Id
	@GeneratedValue
	@Column(name="imageId")
	public int imageId;
	
	@Column(name="imagePath")
	public String imagePath;
	
	@Column(name="createdOn")
	public Timestamp createdOn;
	
	@Column(name="modifiedOn")
	public Timestamp modifiedOn;
	
	@Column(name="deleteFlag")
	public String deleteFlag;

	@ManyToOne
	@JoinColumn(name="carId", nullable = true)
	public Car car;
	

	public int getImageId() {
		return imageId;
	}



	public void setImageId(int imageId) {
		this.imageId = imageId;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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



	public String getDeleteFlag() {
		return deleteFlag;
	}



	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}



	public Car getCar() {
		return car;
	}



	public void setCar(Car car) {
		this.car = car;
	}



	/*@Override
	public String toString() {
		return "Images [imageId=" + imageId + ", imagePath=" + imagePath + ", createdOn=" + createdOn + ", modifiedOn="
				+ modifiedOn + ", deleteFlag=" + deleteFlag + "]";
	}*/

}
