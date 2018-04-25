package com.neu.webtools.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.neu.webtools.beans.User;
import com.neu.webtools.constants.Constants;
import com.neu.webtools.dao.ILoginDao;

@RestController
public class LoginController 
{
	@Autowired
	ILoginDao loginDao;
	
	@RequestMapping(value="/")
	public String goLogin(){
		return "login";
	} 
	
	@RequestMapping(value="/login.htm" , method=RequestMethod.GET)
	public ModelAndView redirectLogin(HttpServletRequest request)
	{	
		System.out.println("Inside login.htm");
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/register.htm" , method=RequestMethod.GET)
	public ModelAndView registerGet(HttpServletRequest request)
	{	
		System.out.println("Inside register");
		return new ModelAndView("register");
	}
	
	@RequestMapping(value="/add.htm" , method=RequestMethod.POST)
	public ModelAndView registerUser(HttpServletRequest request)
	{	
		System.out.println("Inside register Post");
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String emailId = request.getParameter("emailId");
		String phoneNo = request.getParameter("phoneNo");
		
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmailId(emailId);
		user.setPhoneNo(phoneNo);
		user.setRole(Constants.NORMAL_USER);
		
		boolean isUser = loginDao.registerUser(user);
		return new ModelAndView("login");
	}

	@RequestMapping(value="/login.htm" , method=RequestMethod.POST)
	public ModelAndView checkUser(HttpServletRequest request)
	{	
		
		System.out.println("Inside login Post");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = loginDao.checkUser(username, password);
		System.out.println("User: " + user);
		if(user == null)
		{
			System.out.println("in user null");
			request.setAttribute("loginFailedMessage", "Username or password is incorrect!!");
		}
		HttpSession session = request.getSession();
		session.setAttribute("userSession", user);
		return new ModelAndView("dashboard");
	}
	
	@RequestMapping(value="/logout.htm" , method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request)
	{	
		HttpSession session = request.getSession(false);
		session.invalidate();
		return new ModelAndView("login");
	}

}
