<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Location Dashboard</title>
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
	<link href="${pageContext.request.contextPath}/css/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/css/colorbox/jquery.colorbox.js" defer="defer" language="javascript" type="text/javascript"></script>
	<link href="css/design.css" rel="stylesheet"/>


</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br>
<br>
<br>
	<div class="container">
	<div class="col-lg-12">
			<h1 class="page-header text-center .navbar-brand" style="color: black;">Locate a Car</h1>
		</div>
	<c:if test="${!empty sessionScope.cars}">

			<c:forEach items="${sessionScope.cars}" var="car"
				varStatus="index">
				<div class="row">
						<div class="col-md-4">
							<div class="thumbnail">

								<div class="caption">
									<p>
										Company: ${car.company } <br> Model:
										${car.model } <br> Color: ${rentedCars.color } <br>
										Per Hour rate : ${car.perHourrate }
									</p>
								</div>
							</div>
						</div>
					<div class="col-md-4">
						
							<button id="s${car.carId }" class="btn btn-lg btnSumbit" onclick="getRecentLocation(${car.carId });">Get Recent Location</button>
						
					</div>
					
					<div class="col-md-4">
						
							<button id="s${car.carId }" class="btn btn-lg btnSumbit" onclick="getAllLocations(${car.carId });">Get All locations</button>
						
					</div>
				</div>
				</a>
			</c:forEach>
		</c:if>
	</div>
</body>
<script type="text/javascript">
function getRecentLocation(carId)
{
	 $.ajax({
		type : "GET",
		url : 'getRecentCarLocation.htm?carId=' + carId,
		dataType : 'json',
		data : {
			station : carId
		},
		success : function(data) {
			
			showColorBox(data);
		},
		error : function(XMLHttpRequest, textStatus,
				errorThrown) {
			alert(textStatus);
		}

	}); 
	//dummyFunction(r_lat,r_long,i_lat,i_long,distance);
	
}


function getAllLocations(carId)
{
	$.ajax({
		type : "GET",
		url : 'getAllLocations.htm?carId=' + carId,
		dataType : 'json',
		data : {
			station : carId
		},
		success : function(data) {
			
			showAllLocationColorBox(data);
		},
		error : function(XMLHttpRequest, textStatus,
				errorThrown) {
			alert(textStatus);
		}

	}); 
}

function showAllLocationColorBox(data)
{
	sessionStorage.setItem("locationArray", JSON.stringify(data));
	$.colorbox({
        width:"90%",
        height:"90%",
        iframe:true,
        slideshow:false,
        escKey:true,
        overlayClose : true,
        opacity: 0.50,
        href:"mapForAllLocation.htm"
       /*  onClosed:function(){  location.reload(true); } */
        });
}

function showColorBox(data)
{
	//alert(data);
	sessionStorage.setItem("latitude", data.latitude);
	sessionStorage.setItem("longitude", data.longitude);
	$.colorbox({
        width:"90%",
        height:"90%",
        iframe:true,
        slideshow:false,
        escKey:true,
        overlayClose : true,
        opacity: 0.50,
        href:"map.htm"
       /*  onClosed:function(){  location.reload(true); } */
        });	
}
</script>
</html>