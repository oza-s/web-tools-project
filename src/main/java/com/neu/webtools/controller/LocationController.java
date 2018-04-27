package com.neu.webtools.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.CarLocation;
import com.neu.webtools.dao.ILocationDao;

@RestController
public class LocationController 
{
	@Autowired
	ILocationDao locationDao;
	
	@RequestMapping(value="/location-dashboard.htm" , method=RequestMethod.GET)
	public ModelAndView getLocationDashboard(HttpServletRequest request)
	{
		ArrayList<Car> cars = locationDao.getListOfCars();
		request.getSession().setAttribute("cars", cars);
		return new ModelAndView("location-dashboard");
	}
	
	@RequestMapping(value="/getRecentCarLocation.htm" , method=RequestMethod.GET)
	public String getRecentCarLocation(HttpServletRequest request)
	{
		String carId = request.getParameter("carId");
		CarLocation carLocation = locationDao.getRecentCarLocation(carId);
		request.setAttribute("carLocation", carLocation);
		return new Gson().toJson(carLocation);
	}
	
	@RequestMapping(value="/map.htm" , method=RequestMethod.GET)
	public ModelAndView map(HttpServletRequest request)
	{
		return new ModelAndView("map");
	}
	
	@RequestMapping(value="/getAllLocations.htm" , method=RequestMethod.GET)
	public String getAllLocations(HttpServletRequest request)
	{
		String carId = request.getParameter("carId");
		ArrayList<CarLocation> carLocations = locationDao.getAllLocations(carId);
		request.setAttribute("carLocations", carLocations);
		return new Gson().toJson(carLocations);
	}
	
	@RequestMapping(value="/mapForAllLocation.htm" , method=RequestMethod.GET)
	public ModelAndView mapForAllLocation(HttpServletRequest request)
	{
		return new ModelAndView("mapForAllLocation");
	}
	
}
