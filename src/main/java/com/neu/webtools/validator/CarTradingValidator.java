package com.neu.webtools.validator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.webtools.beans.Car;

@Component
public class CarTradingValidator implements Validator
{

	@Override
	public boolean supports(Class<?> clazz) 
	{
		return Car.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) 
	{
		Car car = (Car) obj;
		/*if(car.getImageList().size() == 0)
		{
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "model", "error.invalid.files", "Model Required");
		}*/
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "model", "error.invalid.model", "Model Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "company", "error.invalid.company", "Company Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "seater", "error.invalid.seater", "Seat Number Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "color", "error.invalid.color", "Color Required");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mileage", "error.invalid.mileage", "Mileage Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "purchaseYear", "error.invalid.purchaseYear", "Purchase Year Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "error.invalid.price", "Price Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gearType", "error.invalid.gearType", "Gear type Required");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "numberPlate", "error.invalid.numberPlate", "Number Plate Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fuelType", "error.invalid.fuelType", "Fuel type Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isAC", "error.invalid.isAC", "AC Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "madeInYear", "error.invalid.madeInYear", "Made in year Required");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "comments", "error.invalid.comments", "Comments Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tradeInType", "error.invalid.tradeInType", "Trade In type Required");
		
	}

}
