package com.neu.webtools.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.User;
import com.neu.webtools.dao.ITradeInDao;
import com.neu.webtools.validator.CarTradingValidator;

@RestController
public class TradeInController 
{
	@Autowired
	@Qualifier("carValidator")
	CarTradingValidator carValidator;
	
	@Autowired
	public ITradeInDao tradeIndao;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) 
	{
		binder.setValidator(carValidator);
		try
		{
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //yyyy-MM-dd'T'HH:mm:ssZ example
	        dateFormat.setLenient(true);
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); //true becauseit alows empty values
		}
		catch(Exception exp)
		{
			System.out.println("Dates cannot be empty");
		}
		
	}
	
	@RequestMapping(value="/trade-in.htm" , method=RequestMethod.GET)
	public ModelAndView getTradeInPage(HttpServletRequest request, @ModelAttribute("car") Car car, BindingResult result)
	{		
		return new ModelAndView("trade-in");
	}
	
	@RequestMapping(value="/trade-in-car.htm" , method=RequestMethod.POST)
	public ModelAndView submitTradingDetails(HttpServletRequest request, @ModelAttribute("car") Car car, BindingResult result) throws ParseException
	{	
		carValidator.validate(car, result);

		//System.out.println(imageFile.getSize());
		/*if(result.hasFieldErrors("madeInYear") || result.hasFieldErrors("purchaseYear"))
		{
			FieldError a = result.getFieldError("madeInYear");
			boolean isError = result.getFieldError("madeInYear").getDefaultMessage().contains("Unparseable date");
			result.reject("madeInYear");
			String madeInYearJugaad = request.getParameter("madeInYear");
			Date madeInYearPared = new SimpleDateFormat("yyyyMMdd").parse(madeInYearJugaad);
			String formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(madeInYearPared);
			//car.setMadeInYear();
			
			String purchaseYearJugaad = request.getParameter("purchaseYear");
			Date purchaseYearParsed = new SimpleDateFormat("yyyyMMdd").parse(purchaseYearJugaad);
			String formattedDateP = new SimpleDateFormat("yyyy-MM-dd").format(purchaseYearJugaad);
			car.setPurchaseYear(new Date(formattedDateP));
		}*/
		if (result.hasErrors()) 
		{
			//return new ModelAndView("uploadCarImage","car", car);
			return new ModelAndView("trade-in", "car", car);
		}
		
		else
		{
			Car savedCar = tradeIndao.saveCarDetails(car);
			if(savedCar.getCarId() != 0)
			{
				request.getSession().setAttribute("savedCar", savedCar);
				return new ModelAndView("uploadCarImage","car", car);
			}
			else
			{
				request.setAttribute("persistingError", "There was an error while saving car details!! Please try again");
				return new ModelAndView("trade-in","car", car);
			}
		}
		
	}
	
	@RequestMapping(value="/trade-confirm.htm" , method=RequestMethod.GET)
	public ModelAndView confirmTrade(HttpServletRequest request) throws EmailException
	{		
		Car savedCar = (Car)request.getSession().getAttribute("savedCar");
		//User user = (User)request.getSession().getAttribute("userSession");
		try
		{
			Email email = new SimpleEmail();
	        email.setHostName("smtp.googlemail.com");//If a server is capable of sending email, then you don't need the authentication. In this case, an email server needs to be running on that machine. Since we are running this application on the localhost and we don't have a email server, we are simply asking gmail to relay this email.
	        email.setSmtpPort(465);
	        email.setAuthenticator(new DefaultAuthenticator("webtools001222126Oza@gmail.com", "webtools"));
	        email.setSSLOnConnect(true);
	        email.setFrom("oza.s@husky.neu.edu");//This email will appear in the from field of the sending email. It doesn't have to be a real email address.This could be used for phishing/spoofing!
	        email.setSubject("Car Traded | Car details");
	        email.setMsg("You have successfully registered a car into the system! \n Your car number is " + savedCar.getNumberPlate());
	        email.addTo(((User)request.getSession().getAttribute("userSession")).getEmailId());//Will come from the database
	        email.send();
	        System.out.println("Email sent succesfully!!");
			return new ModelAndView("trade-success-page");
		}
		catch(Exception e)
		{
			System.out.println("There was error while sending email!!");
			return new ModelAndView("trade-success-page");
		}
		
	}
	
	@RequestMapping(value="/dashboard.htm" , method=RequestMethod.GET)
	public ModelAndView redirectdashboard(HttpServletRequest request)
	{	
		System.out.println("Inside dashboard");
		return new ModelAndView("dashboard");
	}

}
