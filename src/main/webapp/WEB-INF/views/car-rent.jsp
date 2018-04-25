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
		<form action="get-rented-cars.htm" id="crFormSearch" method="post">
		
			<div class="row">
				<div class='col-sm-3'>
					<div class="form-group">
						Pick-up Date/Time
						<div class='input-group date' id='datetimepicker1'>
							<input type='text' class="form-control" name="pickUpDate"
								id="pickUpDate" value="${fn:escapeXml(sessionScope.pickUpDate)}" readonly="readonly" />
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class='col-sm-3'>
					<div class="form-group">
						Drop-Off Date/Time ${fn:escapeXml(sessionScope.dropOffdate)}
						<div class='input-group date' id='datetimepicker2'>
							<input type='text' class="form-control" name="dropOffDate"
								id="dropOffDate"
								value="${fn:escapeXml(sessionScope.dropOffdate)}" readonly="readonly"/> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"
								></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						Station <input type="text" class="form-control" name="station"
							id="station" placeholder="Enter Station"
							value="${fn:escapeXml(sessionScope.station)}"
							onkeyup="getStations()" 
							/>
					</div>
				</div>

				<div class="row text-center">
					<input type="submit" class="btn btn-lg btnSumbit"
						onclick="return validateForm();" value="Get Cars" />
						<input type="hidden" name="stationId" id="stationId" value="${requestScope.stationId }"/>
				</div>
			</div>
		</form>

		<c:if test="${!empty sessionScope.rentCarList}">

			<c:forEach items="${sessionScope.rentCarList}" var="rentedCars"
				varStatus="index">
				<div class="row">
						<div class="col-md-4">
							<div class="thumbnail">

								<div class="caption">
									<p>
										Company: ${rentedCars.company } <br> Model:
										${rentedCars.model } <br> Color: ${rentedCars.color } <br>
										Per Hour rate : ${rentedCars.perHourrate }
									</p>
								</div>
							</div>
						</div>
					<div class="col-md-4">
						<a href='' id="s${rentedCars.carId }" onclick="return getCarDetails(${rentedCars.carId });" >
							<button id="s${rentedCars.carId }" class="btn btn-lg btnSumbit" onclick="getCarDetails(${rentedCars.carId });">Details>></button>
						</a>
					</div>
				</div>
				</a>
			</c:forEach>
		</c:if>
	</div>

	<script type="text/javascript">
	
		function getCarDetails(carId)
		{
			console.log(carId);
			//console.log(item);
			var stationid = $('#stationId').val();
			var url = 'get-car-details.htm?carId=' + carId + '&stationId=' + document.getElementById('stationId').value;
			document.querySelector("a#s"+carId).href = url;
			return true;
		}
		
		function validateForm() {
			console.log($('#pickUpDate').val());
			var pickUpDate = new Date($('#pickUpDate').val());
			var dropOffDate = new Date($('#dropOffDate').val());

			if (dropOffDate < pickUpDate) {
				toastr["error"]
						("Pickup date cannot be greater than drop off date!!")
				toastr.options = {
					"closeButton" : true,
					"debug" : false,
					"newestOnTop" : false,
					"progressBar" : false,
					"positionClass" : "toast-top-center",
					"preventDuplicates" : false,
					"onclick" : null,
					"showDuration" : "300",
					"hideDuration" : "1000",
					"timeOut" : "5000",
					"extendedTimeOut" : "1000",
					"showEasing" : "swing",
					"hideEasing" : "linear",
					"showMethod" : "fadeIn",
					"hideMethod" : "fadeOut"
				}
				return false;
			} else if ($('#station').val() == '') {
				toastr["error"]("Please select a station!!")
				toastr.options = {
					"closeButton" : true,
					"debug" : false,
					"newestOnTop" : false,
					"progressBar" : false,
					"positionClass" : "toast-top-center",
					"preventDuplicates" : false,
					"onclick" : null,
					"showDuration" : "300",
					"hideDuration" : "1000",
					"timeOut" : "5000",
					"extendedTimeOut" : "1000",
					"showEasing" : "swing",
					"hideEasing" : "linear",
					"showMethod" : "fadeIn",
					"hideMethod" : "fadeOut"
				}
				return false;
			} else {
				return true;
			}

		}

		$(document).ready(function() {
			$('#datetimepicker1').datetimepicker({ignoreReadonly: true});
			$('#datetimepicker2').datetimepicker({ignoreReadonly: true});
			$(function() {
				$('.datepicker').datepicker({
					buttonImage : "calendar.gif",
					buttonImageOnly : true,
					showOn : "button",
					showSecond : true,
					dateFormat : "dd-mm-yy",
					timeFormat : "HH:mm:ss",
					clearBtn : true
				});
			});
		});

		function getStations() {
			$('#station').autocomplete(
					{
						// This shows the min length of charcters that must be typed before the autocomplete looks for a match.
						minLength : 1,
						source : function(request, response) {
							$.ajax({
								type : "GET",
								url : 'getStations.htm',
								dataType : 'json',
								data : {
									station : $('#station').val()
								},
								success : function(data) {
									response($.map(data, function(st) {
										return {
											label : st.address,
											value : st.stationId,
											latitude : st.latitude,
											longitude : st.longitude,
											city : st.city
										};
									}));
								},
								error : function(XMLHttpRequest, textStatus,
										errorThrown) {
									alert(textStatus);
								}

							});

						},
						focus : function(event, ui) {
							console.log(ui);
							$('#station').val(ui.item.label);
							return false;
						},
						// Once a value in the drop down list is selected, do the following:
						select : function(event, ui) {
							//event.preventDefault();
							console.log(ui);
							// place the station.address value into the textfield called 'select_origin'...
							$('#station').val(ui.item.label);
							// and place the person.id into the hidden textfield called 'link_origin_id'. 
							$('#stationId').val(ui.item.value);
							console.log($('#stationId'));
							
							return false;
						}
					});
		}
	</script>

</body>
</html>