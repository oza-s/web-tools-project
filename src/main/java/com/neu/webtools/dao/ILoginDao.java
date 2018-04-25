package com.neu.webtools.dao;

import com.neu.webtools.beans.User;

public interface ILoginDao 
{
	public boolean registerUser(User user);

	public User checkUser(String username, String password);
}
