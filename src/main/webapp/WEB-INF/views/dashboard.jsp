<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false"%>
    <%@ page import="com.neu.webtools.beans.User" %>
    <%response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    User user = (User) session.getAttribute("userSession");
    System.out.println("User in jsp: " + user);
    if (null == user) {
       request.setAttribute("Error", "Session has ended.  Please login.");
       RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
       rd.forward(request, response);
    } %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<link href="style/design.css" rel="stylesheet"/>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="building" id="building">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="sectionHeading">${sessionScope.userSession.firstName} ${sessionScope.userSession.lastName} Dashboard | 
                    <c:if test="${sessionScope.userSession.role == 'ROLE_ADMIN'}">
                    	<b>This is ADMIN PORTAL</b>
                    </c:if>
                    </h2>
                </div>
            </div>
           
            <div class="row">
            <c:if test="${sessionScope.userSession.role == 'ROLE_ADMIN'}">
                <div class="col-md-4 col-sm-6 buildingItem">
                    <a href="trade-in.htm" class="buildingLink">
                       <div class="buildingHoverContent">
                               
                            </div>
                        <img src="http://blog.quizzle.com/wp-content/uploads/2014/06/get-the-most-money-when-selling-or-trading-in-your-car.jpg" class="img-responsive" alt="Hayden Hall">
                    </a>
                    <div class="buildingCaption">
                        <h4>Trade-In Car</h4>
                    </div>
                </div>
            </c:if>
            
                <div class="col-md-4 col-sm-6 buildingItem">
                    <a href="rent-home-page.htm" class="buildingLink">
                       
                        <img src="http://intercontinentalrentacar.com/wp-content/uploads/2012/04/Depositphotos_7734348_XS.png" class="img-responsive" alt="Dodge Hall">
                    </a>
                    <div class="buildingCaption">
                        <h4>Rent a CAR</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 buildingItem">
                    <a href="location-dashboard.htm" class="buildingLink">
                        <img src="images/locateacar.jpg" class="img-responsive" alt="Shillman Hall">
                    </a>
                    <div class="buildingCaption">
                        <h4>Locate CAR</h4>
                    </div>
                </div>
            </div>
        </div>
</section>
</body>
</html>