package com.neu.webtools.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean;
import com.neu.webtools.beans.User;

@Repository("loginDao")
public class LoginDao implements ILoginDao
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean registerUser(User user) 
	{
		System.out.println("Inside dao");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(user);
		session.flush();
		session.getTransaction().commit();
		return true;
	}

	@Override
	public User checkUser(String username, String password) 
	{
		System.out.println("Inside checkUser");
		Session session = sessionFactory.openSession();
		String hqlQuery = "from User where username =:username and password =:password";
		Query query = session.createQuery(hqlQuery);
		query.setParameter("username", username);
		query.setParameter("password", password);
		session.beginTransaction();
		User user = (User)query.uniqueResult();
		session.flush();
		session.getTransaction().commit();
		return user;
	}

}
