package com.neu.webtools.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

import com.neu.webtools.beans.RentalTransaction;
import com.neu.webtools.beans.User;

@Service("emailService")
public class EmailService implements IEmailService
{
	@Override
	public boolean sendEmail(Object object, User user) throws EmailException 
	{
		RentalTransaction rt = null ;
		if(object instanceof RentalTransaction)
		{
			rt = (RentalTransaction) object;
		}
		try
		{
			Email email = new SimpleEmail();
	        email.setHostName("smtp.googlemail.com");//If a server is capable of sending email, then you don't need the authentication. In this case, an email server needs to be running on that machine. Since we are running this application on the localhost and we don't have a email server, we are simply asking gmail to relay this email.
	        email.setSmtpPort(465);
	        email.setAuthenticator(new DefaultAuthenticator("webtools001222126Oza@gmail.com", "webtools"));
	        email.setSSLOnConnect(true);
	        email.setFrom("oza.s@husky.neu.edu");//This email will appear in the from field of the sending email. It doesn't have to be a real email address.This could be used for phishing/spoofing!
	        email.setSubject("Car Booked Successfully | Booking Reference: " + rt.getBookingReferenceNumber());
	        email.setMsg("You have successfully booked a car! \n Your booking reference number is " + rt.getBookingReferenceNumber());
	        email.addTo(user.getEmailId());//Will come from the database
	        email.send();
		}
		catch(Exception e)
		{
			return false;
		}
		
		return true;
	}

}
