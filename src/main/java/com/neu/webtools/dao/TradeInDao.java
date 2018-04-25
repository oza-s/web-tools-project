package com.neu.webtools.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.webtools.beans.Car;

@Repository("tradeInDao")
public class TradeInDao implements ITradeInDao
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Car saveCarDetails(Car car) 
	{
		car.setDeleteFlag("F");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(car);
		session.getTransaction().commit();
		session.close();
		return car;
	}

}
