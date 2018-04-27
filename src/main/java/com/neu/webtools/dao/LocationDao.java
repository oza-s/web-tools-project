package com.neu.webtools.dao;

import java.util.ArrayList;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.CarLocation;

@Repository("locationDao")
public class LocationDao implements ILocationDao
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public ArrayList<Car> getListOfCars() 
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Car where deleteFlag=:deleteFlag");
		query.setParameter("deleteFlag", "F");
		ArrayList<Car> cars = (ArrayList<Car>) query.list();
		session.getTransaction().commit();
		return cars;
	}

	@Override
	public CarLocation getRecentCarLocation(String carId) 
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(CarLocation.class);
		criteria.addOrder(Order.desc("id"));
		criteria.setMaxResults(1);
		ArrayList<CarLocation> carLocation = (ArrayList<CarLocation>)criteria.list();
		session.getTransaction().commit();
		return carLocation.get(0);
	}

	@Override
	public ArrayList<CarLocation> getAllLocations(String carId) 
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(CarLocation.class);
		criteria.addOrder(Order.desc("createdOn"));
		ArrayList<CarLocation> carLocations = (ArrayList<CarLocation>)criteria.list();
		session.getTransaction().commit();
		return carLocations;
	}

}
