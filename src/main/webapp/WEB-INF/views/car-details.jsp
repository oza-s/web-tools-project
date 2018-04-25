<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rent a Car</title>
<link rel="shortcut icon" href="images/car-title.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css">
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet" />


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="css/design.css" rel="stylesheet" />
<!-- 	<script src="js/bootstrap-datetimepicker.min.js"></script>
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen"/> -->
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<form action="book-car.htm" id="crFormSearch" method="post">
		<div class="well well-lg text-primary" style="font-size: x-large; text-align: center;"><i class="fa fa-cog fa-spin fa-3x fa-fw"></i>Car details<i class="fa fa-cog fa-spin fa-3x fa-fw"></i></div>
			<div class="col-lg-6" style="background-color: white;">
				<div class="row" class="col-md-3">
					<div class="col-md-3">
						<div class="form-group">
							<label for="model" class="label label-primary"> Car Model: </label>
							<i class="fa fa-car"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.model }</div>
							
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="seater" class="label label-primary"> Car Company: </label> 
							<i class="fa fa-car"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.company}</div>
							
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="isAC" class="label label-primary">Color: </label>
							<i class="fa fa-tachometer"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.color }</div>
						</div>
					</div>
				</div>
				<div class="row" class="col-md-3">
					<div class="col-md-3">
						<div class="form-group">
							<label for="model" class="label label-primary">Mileage: </label> 
							<i class="fa fa-battery-half"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.mileage }</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="seater" class="label label-primary">Gear Type:</label> 
							<i class="fa fa-code-fork"></i>
							<div class="alert alert-success"><span class="glyphicon glyphicon-ok"></span>${sessionScope.carSelectedDetails.gearType }</div>
							
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="isAC" class="label label-primary">Fuel Type:</label> 
							<i class="fa fa-toggle-on"></i>
							<div class="alert alert-success"><span class="glyphicon glyphicon-ok"></span>${sessionScope.carSelectedDetails.fuelType } </div>
						</div>
					</div>
				</div>
				<div class="row" class="col-md-3">
					<div class="col-md-3">
						<div class="form-group">
							<label for="model" class="label label-primary">AC: </label> 
							<i class="fa fa-snowflake-o"></i>
							<div class="alert alert-success"><span class="glyphicon glyphicon-ok"></span>${sessionScope.carSelectedDetails.isAC }</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="seater" class="label label-primary">Number Plate:</label>
							<i class="fa fa-archive"></i> 
							<div class="alert alert-success">${sessionScope.carSelectedDetails.numberPlate }</div>
							
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="isAC" class="label label-primary">Seater:</label>
							<i class="fa fa-male"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.seater }</div>
						</div>
					</div>
				</div>
				<div class="row" class="col-md-3">
					<div class="col-md-3">
						<div class="form-group">
							<label for="model" class="label label-primary">Made In Year </label> 
								<i class="fa fa-calendar"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.madeInYear }</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="seater" class="label label-primary">Comments:</label> 
							<i class="fa fa-american-sign-language-interpreting"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.comments } </div>
							
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="isAC" class="label label-primary">Per hour rate:</label> 
							<i class="fa fa-dollar"></i>
							<div class="alert alert-success">${sessionScope.carSelectedDetails.perHourrate } </div>
						</div>
					</div>
				</div>
			</div>
			
				<div class="col-lg-6" style="background-color: white;">
				<c:forEach items="${sessionScope.carSelectedDetails.imageList }" varStatus="" var="image">
					<div class="row">
						<div class="form-group">
							<img alt="Car Images" src="${image.imagePath }" width="200px" height="200px">
						</div>
					</div>
				
				</c:forEach>
					
				</div>
				<div class="row text-center">
					<input type="submit" class="btn btn-lg btnSumbit" value="Book" />
		</div>
		</form>
		
			
	</div>
</body>
</html>