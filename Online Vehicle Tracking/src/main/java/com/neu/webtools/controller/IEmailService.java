package com.neu.webtools.controller;

import org.apache.commons.mail.EmailException;

import com.neu.webtools.beans.User;

public interface IEmailService 
{
	public boolean sendEmail(Object object, User user) throws EmailException;
}
