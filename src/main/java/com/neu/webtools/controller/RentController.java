package com.neu.webtools.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.RentalTransaction;
import com.neu.webtools.beans.Station;
import com.neu.webtools.beans.User;
import com.neu.webtools.dao.IRentDao;

@RestController
public class RentController 
{
	@Autowired
	public IRentDao rentDao;
	
	@Autowired
	IEmailService emailService;
	
	@RequestMapping(value="/rent-home-page.htm" , method=RequestMethod.GET)
	public ModelAndView getCarsForRents(HttpServletRequest request)
	{
		return new ModelAndView("car-rent");
	}
	
	@RequestMapping(value="/getStations.htm" , method=RequestMethod.GET)
	public String getStations(HttpServletRequest request)
	{
		String stationReq = request.getParameter("station");
		List<Station> stationList = rentDao.getStations(stationReq);
		request.getSession().setAttribute("stationList", stationList);
		Gson json = new Gson();
		return json.toJson(stationList).toString();
	}
	
	@RequestMapping(value="/get-rented-cars.htm", method=RequestMethod.POST)
	public ModelAndView getCarForRent(HttpServletRequest request) throws ParseException
	{
		String pickUpDate = request.getParameter("pickUpDate");
		String dropOffdate = request.getParameter("dropOffDate");
		String station = request.getParameter("station");
		String stationId = request.getParameter("stationId");
		DateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
		DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startDateTime = outputFormat.format(inputFormat.parse(pickUpDate.concat(":00")));
		String endDateTime = outputFormat.format(inputFormat.parse(dropOffdate.concat(":00")));
		ArrayList<Car> carList = rentDao.getRentedCars(startDateTime, endDateTime, station);
		request.getSession().setAttribute("rentCarList", carList);
		request.getSession().setAttribute("pickUpDate", pickUpDate);
		request.getSession().setAttribute("dropOffdate", dropOffdate);
		request.getSession().setAttribute("station", station);
		request.getSession().setAttribute("startDateTime", startDateTime);
		request.getSession().setAttribute("enddateTime", endDateTime);
		request.setAttribute("stationId", stationId);
		//request.getSession().setAttribute("rentCarJson", new Gson().toJson(carList));
		System.out.println(carList);
		return new ModelAndView("car-rent");
	}
	
	@RequestMapping(value="get-car-details.htm", method=RequestMethod.GET)
	public ModelAndView getCarDetails(HttpServletRequest request)
	{
		String stationId = request.getParameter("stationId");
		String carId = request.getParameter("carId");
		Station stationBean = null;
		ArrayList<Car>carList = (ArrayList<Car>)request.getSession().getAttribute("rentCarList");
		for(Car car: carList)
		{
			if(car.getCarId() == Integer.parseInt(carId))
			{
				request.getSession().setAttribute("carSelectedDetails", car);
				break;
			}
		}
		
		for(Station st : (ArrayList<Station>)request.getSession().getAttribute("stationList"))
		{
			if(st.getStationId() == Integer.parseInt(stationId))
			{
				stationBean = st;
				break;
			}
		}
		request.getSession().setAttribute("stationBean", stationBean);
		return new ModelAndView("car-details");
	}
	
	@RequestMapping(value="book-car.htm", method=RequestMethod.POST)
	public ModelAndView bookCar(HttpServletRequest request) throws EmailException
	{
		request.getSession().getAttribute("pickUpDate");
		request.getSession().getAttribute("dropOffdate");
		String station = (String)request.getSession().getAttribute("station");
		Car selectedCar = (Car)request.getSession().getAttribute("carSelectedDetails");
		String startdateTime = (String)request.getSession().getAttribute("startDateTime");
		String enddateTime = (String)request.getSession().getAttribute("enddateTime");
		Station stationBean = (Station)request.getSession().getAttribute("stationBean");
		//ArrayList<Station> stationList = (ArrayList<Station>)request.getSession().getAttribute("stationList");
		
		RentalTransaction rentalTransaction = setRentalTransactionDetails(stationBean,startdateTime, enddateTime, selectedCar, (User)request.getSession().getAttribute("userSession"));
		RentalTransaction savedTransaction = rentDao.saveTransaction(rentalTransaction);
		boolean emailed = emailService.sendEmail(savedTransaction, (User)request.getSession().getAttribute("userSession"));	
		return new ModelAndView("successful-booking", "bookinReferenceNumber", rentalTransaction.getBookingReferenceNumber());
	}

	private RentalTransaction setRentalTransactionDetails(Station stationBean, String startdateTime, String enddateTime,
			Car selectedCar, User userSession) 
	{
		RentalTransaction rentalTransaction = new RentalTransaction();
		rentalTransaction.setAvailability("true");
		rentalTransaction.setCar(selectedCar);
		rentalTransaction.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		rentalTransaction.setStartDateTime(Timestamp.valueOf(startdateTime) );
		rentalTransaction.setEndDateTime(Timestamp.valueOf(enddateTime));
		rentalTransaction.setDeleteFlag("F");
		rentalTransaction.setModifiedOn(new Timestamp(System.currentTimeMillis()));
		rentalTransaction.setPerHourRate(selectedCar.getPerHourrate());
		rentalTransaction.setStation(stationBean);
		rentalTransaction.setUser(userSession);	
		rentalTransaction.setBookingReferenceNumber(userSession.getFirstName().substring(0, 2).concat("_").concat(userSession.getLastName().substring(0, 2)).concat(System.currentTimeMillis()+""));
		return rentalTransaction;
	}
}
