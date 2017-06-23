package com.neu.webtools.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.webtools.beans.Images;

@Repository("imageDao")
public class ImageDao implements IImageDao
{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public int insertImages(ArrayList<Images> imageList) 
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		for (int i=0; i<imageList.size(); i++) 
		{
            session.save(imageList.get(i));
         	if( i % 10 == 0 ) 
         	{
               session.flush();
               session.clear();
            }
         }
        session.getTransaction().commit();
		return imageList.size();
	}

}
