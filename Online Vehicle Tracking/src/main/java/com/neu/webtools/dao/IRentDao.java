package com.neu.webtools.dao;

import java.util.ArrayList;
import java.util.List;

import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.RentalTransaction;
import com.neu.webtools.beans.Station;

public interface IRentDao 
{
	public List<Station> getStations(String stationReq);
	
	public ArrayList<Car> getRentedCars(String startDateTime, String endDateTime, String station);

	public RentalTransaction saveTransaction(RentalTransaction rentalTransaction);
}
