
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
table, th, td {
    border: 5px solid black;
}
border-collapse: collapse;
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recent Location map</title>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMiUDUP_Fn8Sa9FZ9fvwwzmZczA2MZBr8&callback=initMap">
    </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
/* //AIzaSyDMiUDUP_Fn8Sa9FZ9fvwwzmZczA2MZBr8 */
			function loadMap() 
			  {
			   	 var latitude = sessionStorage.getItem("latitude");
			   	 var longitude = sessionStorage.getItem("longitude");
			     var latlng = new google.maps.LatLng(latitude, longitude);
				 console.log(latlng);
				  
			      var myOptions = {
			      zoom: 18,
			      center: latlng,
			      mapTypeId: 'satellite'
			    };
			      
			    var map = new google.maps.Map(document.getElementById("map-canvas"),myOptions);
			    
				//var marker1Icon = '${pageContext.request.contextPath}/images/map.jpg';
				
			    var marker1 = new google.maps.Marker(
						{
							position : latlng,
							map : map,
							
						});
			    //marker1.setIcon(marker1Icon);
			    
			    
			 // show a line between the two points
				/* var line = new google.maps.Polyline({
					map: map, 
					path: [location1, location2],
					strokeWeight: 7,
					strokeOpacity: 0.8,
					strokeColor: "#FFAA00"
				}); */
			  }

</script>


</head>
<body onload="javascript:loadMap();">
	<div id="map-canvas" 
	style="height: 450px; width: 97%; border-color: lightgrey; margin-left:1%; border-width: thick;"></div>					
</body>
</html>