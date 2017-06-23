package com.neu.webtools.dao;

import java.util.ArrayList;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.RentalTransaction;
import com.neu.webtools.beans.Station;

@Repository("rentDao")
public class RentDao implements IRentDao
{
	@Autowired
	SessionFactory sessionFactory;

	/* (non-Javadoc)
	 * @see com.neu.webtools.dao.IRentDao#getStations(java.lang.String)
	 */
	@Override
	public ArrayList<Station> getStations(String stationReq) 
	{		
		Session session = sessionFactory.openSession();
		Criterion critAddress = Restrictions.ilike("address", stationReq, MatchMode.ANYWHERE);
		Criterion critCity = Restrictions.ilike("city", stationReq, MatchMode.ANYWHERE);
		Criteria crit = session.createCriteria(Station.class).add(Restrictions.or(critAddress,critCity)).setProjection(Projections.projectionList()
			      .add(Projections.property("stationId"), "stationId")
			      .add(Projections.property("address"), "address")
			      .add(Projections.property("city"), "city")
			      .add(Projections.property("latitude"), "latitude")
			      .add(Projections.property("longitude"), "longitude"))
			    .setResultTransformer(Transformers.aliasToBean(Station.class));
		ArrayList<Station> stationList = (ArrayList<Station>) crit.list();
		return stationList;
	}
	
	@Override
	public ArrayList<Car> getRentedCars(String startDateTime, String endDateTime, String station) 
	{
		Session session = sessionFactory.openSession();
		Query query = session.createSQLQuery("SELECT c.* " +
					  "FROM online_vehicle_tracking.car c " + 
					  "left join tempng t " + 
					  "on t.carId = c.carId " + 
					  "where (:startDateTime < startdatetime and :endDateTime <= startDatetime) " +
					  "or (:startDateTime >= endDatetime and :endDateTime > endDatetime) " +
					  "OR startdatetime IS null").addEntity(Car.class); 
		query.setParameter("startDateTime", startDateTime);
		query.setParameter("endDateTime", endDateTime);
		query.setParameter("startDateTime", startDateTime);
		query.setParameter("endDateTime", endDateTime);
		ArrayList<Car> carList = (ArrayList<Car>)query.list();
		return carList;
	}

	@Override
	public RentalTransaction saveTransaction(RentalTransaction rentalTransaction) 
	{
		System.out.println("Inside saveTransaction");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(rentalTransaction);
		session.flush();
		session.getTransaction().commit();
		return rentalTransaction;
	}
		
}
