<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ page import="com.neu.webtools.beans.User" %>
	<%response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    User user = (User) session.getAttribute("userSession");
    if (null == user) {
       request.setAttribute("Error", "Session has ended.  Please login.");
       RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
       rd.forward(request, response);
    } %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trade-In</title>
<link rel="shortcut icon" href="images/car-title.ico" />
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js"></script>
	<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/additional-methods.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
	<link href="css/design.css" rel="stylesheet"/>
	<script src="js/combodate.js">
	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
		<c:if test="${not empty persistingError }">
	<script type="text/javascript">
	toastr["error"]("${persistingError}")
	toastr.options = {
	    "closeButton": true,
	    "debug": false,
	    "newestOnTop": false,
	    "progressBar": false,
	    "positionClass": "toast-top-center",
	    "preventDuplicates": false,
	    "onclick": null,
	    "showDuration": "300",
	    "hideDuration": "1000",
	    "timeOut": "5000",
	    "extendedTimeOut": "1000",
	    "showEasing": "swing",
	    "hideEasing": "linear",
	    "showMethod": "fadeIn",
	    "hideMethod": "fadeOut"
	}
	</script>
	</c:if>
	
	<Section class="contactUs" id="contactUs">
	<div class="container" ng-controller="contactUsCtrl">
		<div class="col-lg-12">
			<h1 class="page-header text-center .navbar-brand" style="color: black;">Vehicle Info</h1>
		</div>
		<form:form id="car" action="trade-in-car.htm" method="POST" commandName="car" modelAttribute="car">
			<div class="row" class="col-md-3">
				<div class="col-md-3">
					<div class="form-group">					
						<label for="model" class="label label-primary">Model:</label> 
						<form:input type="text" path="model" class="form-control" name="model" id="model" placeholder="Enter model name" />
						<font color="red"><form:errors path="model" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="company" class="label label-primary">Company:</label> 
						<form:input type="text" path="company" class="form-control" name="company" id="company" placeholder="Enter company name" />
						<font color="red"><form:errors path="company" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="color" class="label label-primary">Color:</label> 
						<form:input type="text" path="color" class="form-control" name="color" id="color" placeholder="Enter color" />
						<font color="red"><form:errors path="color" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="seater" class="label label-primary">Seater:</label> 
						<form:input type="number" path="seater" class="form-control" min="1" max="8" name="seater" id="seater" placeholder="Enter seat number" />
						<font color="red"><form:errors path="seater" /></font></td>
					</div>
				</div>
			</div>
			
		<!--  2nd row start-->
			 <div class="row" class="col-md-3">
				<div class="col-md-3">
					<div class="form-group">					
						<label for="model" class="label label-primary">Mileage:</label> 
						<form:input type="number" path="mileage" class="form-control" min="1" max="50000" name="mileage" id="mileage" placeholder="Enter mileage" />
						<font color="red"><form:errors path="mileage" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="company" class="label label-primary">Purchase Year:</label> 
						<form:input type="date" path="purchaseYear" class="form-control" name="purchaseYear" min="1990-01-02" max="2017-04-25" /><br>
						<font color="red"><form:errors path="purchaseYear" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="color" class="label label-primary">Price:</label> 
						<span style="color: black;"> $ </span> <form:input type="number" path="price" class="form-control" min="1" max="100000" name="price" id="price" placeholder="Enter price" />
						<font color="red"><form:errors path="price" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="seater" class="label label-primary">Made in year:</label> 
						<!-- <input type="text" id="date" data-format="DD-MM-YYYY" data-template="D MMM YYYY" name="date" value="09-01-2013"> -->
						<form:input type="date" path="madeInYear" class="form-control" name="madeInYear" min="1990-01-02" max="2017-04-25" /><br>
						<font color="red"><form:errors path="madeInYear" /></font></td>
					</div>
				</div>
				
			</div>
		<!-- 2nd row end -->
		
		<!--  3rd row start-->
			 <div class="row" class="col-md-3">
				<div class="col-md-3">
					<div class="form-group">					
						<label for="model" class="label label-primary">Number Plate:</label> 
						<form:input type="text" path="numberPlate" class="form-control" name="numberPlate" id="numberPlate" placeholder="Enter number plate"/>
						<font color="red"><form:errors path="numberPlate" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="seater" class="label label-primary">Comments:</label> 
						<form:input type="text" path="comments" class="form-control" name="comments" id="comments" placeholder="Enter comments" />
						<font color="red"><form:errors path="comments" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="isAC" class="label label-primary">AC:</label> 
						<form:radiobutton path="isAC" name="isAC" value="true" style="color: black;" /><span style="color: black;"> Yes</span><br>
						<form:radiobutton path="isAC" name="isAC" value="false" style="margin-left: 35px; color: black;" /><span style="color: black;"> No</span><br>
						<font color="red"><form:errors path="isAC" /></font></td>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="seater" class="label label-primary">Gear type:</label> 
						<form:radiobutton path="gearType" name="gearType" value="Automatic" style="color: black;"/><span style="color: black;"> Automatic </span><br>
						<form:radiobutton path="gearType" name="gearType" value="Manual" style="margin-left: 68px; color: black;"/><span style="color: black;"> Manual</span><br>
						<font color="red"><form:errors path="gearType" /></font></td>
					</div>
				</div>
			</div>
		<!-- 3rd row end -->
			
			<!--  3rd row start-->
			 <div class="row" class="col-md-3">
				<div class="col-md-3">
					<div class="form-group">
						<label for="tradeInType" class="label label-primary">Trade-In Type:</label> 
						<form:select name="tradeInType" class="form-control" path="tradeInType">
						  <option value="rent">Rent</option>
						  <option value="sell" selected>Sell</option>
						</form:select>
						<font color="red"><form:errors path="tradeInType" /></font></td>
					</div>
				</div>
				<%-- <div class="col-md-3">
					<div class="form-group">
						<label for="status" class="label label-primary">Status:</label> 
						<form:input type="text" path="status" class="form-control" name="status" id="status" disabled="disabled"/>
					</div>
				</div> --%>
				<div class="col-md-3">
					<div class="form-group">
						<label for="company" class="label label-primary">Fuel Type:</label> 
						<form:radiobutton path="fuelType" name="fueltype" value="Gasoline" style="color: black;"/><span style="color: black;"> Gasoline</span><br>
						<form:radiobutton path="fuelType" name="fueltype" value="Diesel" style="margin-left: 68px; color: black;"/><span style="color: black;"> Diesel</span><br>
						<font color="red"><form:errors path="fuelType" /></font></td>
					</div>
				</div>
				
			</div>
		<!-- 3rd row end -->
		
			<div class="col-md-12"><hr></div>
			
			<div class="row text-center">
				<button class="btn btn-lg btnSumbit">Submit</button>
			</div>
		</form:form>
	</div>
	</section>

</body>
</html>