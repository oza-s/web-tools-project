package com.neu.webtools.dao;

import java.util.ArrayList;

import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.CarLocation;

public interface ILocationDao 
{
	public ArrayList<Car> getListOfCars();

	public CarLocation getRecentCarLocation(String carId);

	public ArrayList<CarLocation> getAllLocations(String carId);
}
