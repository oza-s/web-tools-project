
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
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMiUDUP_Fn8Sa9FZ9fvwwzmZczA2MZBr8&callback=initMap">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
			function loadMap() 
			  {
			   	 var locationArray = JSON.parse(sessionStorage.getItem("locationArray"));
			   	 var markerArray = new Array();
			   	 var googleLatLng = new Array();
			   	var myOptions = 
			   			{
					      zoom: 18,
					      center: new google.maps.LatLng(locationArray[0].latitude, locationArray[0].longitude),
					      mapTypeId: 'roadmap'
					    };
			   	var map = new google.maps.Map(document.getElementById("map-canvas"),myOptions);
			   	
			   	  for(var i=0; i<locationArray.length; i++)
			   		 {
			   		 	var latitude = locationArray[i].latitude;
			   		 	var longitude = locationArray[i].longitude;
			   		 	var latlng = new google.maps.LatLng(latitude, longitude);
			   		 	googleLatLng.push(latlng);
			   		 	
			   		 	var marker = new google.maps.Marker(
						{
							position : latlng,
							map : map ,
							animation: google.maps.Animation.DROP,
							icon : 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
							title : locationArray[i].createdOn,
							visible : true
						});
			   		 	marker.setMap(map)
			   		 	markerArray.push(marker);
			   		 	google.maps.event.addListener(marker,'click',function() {
						  map.setZoom(33);
						  map.setCenter(this.getPosition());
						  map.panTo(this.position);
						  });
			   		 	
			   		 }
			   	var mcOptions = {
			        	//imagePath: 'https://googlemaps.github.io/js-marker-clusterer/images/m',
			          styles:[{
			          
			          url: "https://googlemaps.github.io/js-marker-clusterer/images/m1.png",
			                width: 53,
			                height:53,
			                fontFamily:"comic sans ms",
			                textSize:15,
			                textColor:"red",
			                //color: #00FF00,
			          }]
			          
			        };
			      var markerCluster = new MarkerClusterer(map, markerArray,mcOptions); 
			  }

</script>


</head>
<body onload="javascript:loadMap();">
	<div id="map-canvas" 
	style="height: 450px; width: 97%; border-color: lightgrey; margin-left:1%; border-width: thick;"></div>					
</body>
</html>