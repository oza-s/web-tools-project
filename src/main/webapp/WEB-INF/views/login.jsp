<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Online Vehicle Tracking</title>
<link rel="shortcut icon" href="images/car-title.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Ribbon Login Form Responsive Templates, Iphone Compatible Templates, Smartphone Compatible Templates, Ipad Compatible Templates, Flat Responsive Templates"/>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!--/webfonts-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css" rel="stylesheet"/>
<script type="text/javascript">
</script>
</head>
<body>
<c:if test="${not empty loginFailedMessage }">
<script type="text/javascript">
toastr["error"]("${loginFailedMessage}")
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

<!--start-main-->
<h1>Welcome!<span>Please login...</span></h1>
<div class="login-box">
		<form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
			<input type="text" class="text" name="j_username" value="" >
			<input type="password" name="j_password" value="">
			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
			
			<div class="btn" style="width: 50%;">
				<input type="submit" value="LOG IN" >
			</div>
		</form>
		<div class="remember">
			<h4>Forgot your password?<a href="#">Click here.</a></h4>
		</div>
		<div class="clear"> </div>
		<div style="width: 100%;">
			<div class="btn" style="width: 50%;">
			<form action="register.htm" action="GET">
				<input type="submit" value="JOIN US" >
			</form>
			
			</div>
			<!-- <div class="btn" style="width: 50%;">
				<input type="submit" value="LOG IN" >
			</div> -->
		</div>
		
		<div class="clear"> </div>
</div>	
</body>
</html>