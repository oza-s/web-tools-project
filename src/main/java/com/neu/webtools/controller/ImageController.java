package com.neu.webtools.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.neu.webtools.beans.Car;
import com.neu.webtools.beans.Images;
import com.neu.webtools.dao.IImageDao;

@RestController
public class ImageController 
{
	@Autowired
	public IImageDao imageDao;
	
	@Autowired
	public ServletContext servletContext;
	
	@RequestMapping(value="/upload.htm" , method=RequestMethod.POST)
	public ModelAndView uploadImages(HttpServletRequest request, @RequestParam("images") MultipartFile[] files) throws IOException
	{
		int recordsInserted = 0;
		Car savedCar = (Car)request.getSession().getAttribute("savedCar");
		String contextPath = servletContext.getRealPath(File.separator);
		File carPhotosDirectory = new File(contextPath + "/car_photos" );//+ savedCar.getCarId());
		carPhotosDirectory.mkdir();
		File carDirectory = new File(carPhotosDirectory.toString() + "/car_" + savedCar.getCarId());
		ArrayList<Images> imageList = new ArrayList<Images>();
		
		if(!carDirectory.exists())
		{
			carDirectory.mkdir();
			System.out.println(carDirectory.mkdir() + "  " + carDirectory.getAbsolutePath());
		}
		for(MultipartFile file : files)
		{
			InputStream inputStream = file.getInputStream();		
			OutputStream outputStream = new FileOutputStream(carDirectory.toString().concat("/" + file.getOriginalFilename()));			
			FileCopyUtils.copy(inputStream, outputStream);
			Images image = setImageObject(carDirectory.toString().concat(File.separator + file.getOriginalFilename()).toString(), savedCar, 6);//savedCar.getCarId());
			System.out.println("File name: " + image.getImagePath());
			imageList.add(image);
		}
		recordsInserted = imageDao.insertImages(imageList);
		System.out.println(recordsInserted + "images submitted successfully");
		request.setAttribute("imageUpload", "true");
		request.setAttribute("recordsInserted", recordsInserted );
		request.setAttribute("imageList", imageList);
		return new ModelAndView("uploadCarImage");
	}

	private Images setImageObject(String imagePath, Car savedcar, int savedCarId) 
	{
		Images image = new Images();
		image.setImagePath(imagePath.substring(imagePath.indexOf("car_photos"), imagePath.length()));
		image.setDeleteFlag("F");
		image.setModifiedOn(new Timestamp(System.currentTimeMillis()));
		image.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		image.setCar(savedcar);
		return image;
	}
	
	
	
}
