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
	<link rel="stylesheet" href="http://www.formmail-maker.com/var/demo/jquery-popup-form/colorbox.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script src="http://www.formmail-maker.com/var/demo/jquery-popup-form/jquery.colorbox-min.js"></script>
	<link href="css/design.css" rel="stylesheet"/>
	<link href="css/drag-drop.css" rel="stylesheet"/>
	<script src="js/combodate.js">
	</script>
	
	<script type="text/javascript">
	
	$('img').click(function() {
	    $(this).colorbox({href: $(this).attr('src')});
	});
	
	
	function submitImages(event)
	{
		var selected = document.getElementById("images").files.length > 0;
		if(!selected)
			{
			toastr["error"]("Please select atleast one image")
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
			return false;
			}
		else
			{
				//document.getElementById("js-upload-form").submit();
				return true;
			}
	}

	
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
	
	<c:if test="${true eq imageUpload }">
	<script type="text/javascript">
	toastr["success"]("Image uploaded successfully")
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
	
	<br>
	<br>
	<br>
	<br>

<div class="container">
      <div class="panel panel-default">
        <div class="panel-heading"><strong>Upload Images</strong></div>
        <div class="panel-body">

          <!-- Standar Form -->
          <h4>Select files from your computer</h4>
          <form action="upload.htm" method="post" enctype="multipart/form-data" id="js-upload-form">
            <div class="form-inline">
              <div class="form-group">
                <input type="file" name="images" id="images" multiple>
              </div>
              <input type="submit" class="btn btn-sm btn-primary" id="js-upload-submit" onclick="return submitImages(event);" value="Upload">
            </div>
          </form>

          <!-- Drop Zone -->
          <h4>Or drag and drop files below</h4>
          <div class="upload-drop-zone" id="drop-zone">
            Just drag and drop files here
          </div>

          <!-- Upload Finished -->
          <!-- <div class="js-upload-finished">
            <h3>Processed files</h3>
            <div class="list-group">
              <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">Success</span>image-01.jpg</a>
              <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">Success</span>image-02.jpg</a>
            </div>
          </div> -->
          <%-- ${requestScope.imageList}  --%>
          <c:if test="${!empty requestScope.imageList}">
	          <c:forEach items="${requestScope.imageList}" var="image">
	          ${image.imagePath}
	          		<img src="${image.imagePath }" width="150px" height="150px" />
	          </c:forEach>
	          
	          <button type="button" class="btn"><a href="trade-confirm.htm">Confirm Trade</a></button>
	          
          </c:if>
        </div>
      </div>
    </div> <!-- /container -->
					
</body>
</html>