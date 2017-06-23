<%@ page import="com.neu.webtools.beans.User" %>
	<%response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    User user = (User) session.getAttribute("userSession");
     %>
     <!-- if (null == user) {
       request.setAttribute("Error", "Session has ended.  Please login.");
       RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
       rd.forward(request, response);
    } -->
<div>
<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#rsCollapse">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="dashboard.htm">Online Car Tracking</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="rsCollapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden active">
					
                        <a href="#pageTop"></a>
                    </li>
                    <!-- <li class="">
                        <a class="page-scroll" href="#aboutUsSection">About</a>
                    </li>
                    <li class="">
                        <a class="page-scroll" href="#team">Team</a>
                    </li>
                    <li class="">
                        <a class="page-scroll" href="#contactUs">Contact</a>
                    </li> -->
                    <c:if test="${sessionScope.userSession != null }">
	                    <a href="logout.htm" class="btn btn-info btn-lg">
				          <span class="glyphicon glyphicon-log-out"></span> Log out
				        </a>
                    </c:if>
                    <!-- <c:if test="">
	                    <li class="">
	                        <a class="page-scroll" data-toggle="modal" href="#myModal">Sign In</a>
	                    </li>
                    </c:if> -->
					
                </ul>
            </div>
          </div>
    </nav>
    </div>