<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="frontEndApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FrontEndApp</title>
<link rel="stylesheet" href="content/bootstrap.min.css">
<link rel="stylesheet" href="content/frontEndApp.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" rel="stylesheet">
 
<script src="scripts/jquery-3.2.0.min.js"></script>
<script src="scripts/tether.min.js"></script>
<script src="scripts/bootstrap.min.js"></script>
</head>

<body class="container" ng-controller="frontEndAppCtrl">

	 <header>
		<nav class="navbar navbar-light bg-faded">
			<div class="row">&nbsp;&nbsp;&nbsp;</div>
			<div class="row">
				<div class="col-lg-9"><h1>{{chamberInfo.name}}</h1></div>
				
				<div class="col-lg-3 text-right" >
					<div class="row" style="vertical-align: text-top;">
						<a ng-href="{{chamberInfo.facebookURL}}"><i class="fa fa-facebook-square color-facebook" style="font-size:36px"></i></a> &nbsp;&nbsp;
						<a ng-href="{{chamberInfo.twitterURL}}"><i class="fa fa-twitter-square color-twitter" style="font-size:36px"></i></a> &nbsp;&nbsp;
						<a ng-href="{{chamberInfo.linkedInURL}}"><i class="fa fa-linkedin-square color-linkedin" style="font-size:36px"></i></a> &nbsp;&nbsp;&nbsp;
						<a ng-href="#" class="dropdown-toggle" data-toggle="dropdown"><b class="color-blue">Login</b> <span class="caret"></span></a>
							<!-- Need to be worked on latter Start -->
							<ul class="dropdown-menu login-panel">
					            <li>
					                <div class="dropdown-header">
					                    <span class="login-header color-blue">Sign In</span>
					                    <span class="forgot-password color-blue"><a href="">Forgot password?</a></span>
					                </div>
					                <div class="clearfix"></div>
					                <div style="padding: 8px;">
					                    <form id="loginform" class="form-horizontal" role="form"  autocomplete="off">
					                        <div style="margin-bottom: 10px" class="input-group">
					                            <span class="input-group-addon"><i class="glyphicon glyphicon-user color-blue"></i></span>
					                            USERNAME OR EMAIL ADDRESS
					                            <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="username or email" pattern="[a-zA-Z0-9]{5,}" title="Minimum 5 letters or numbers." oninvalid="this.setCustomValidity('Enter User Name Here')" oninput="setCustomValidity('')" required>                                        
					                        </div>
					                        <div style="margin-bottom: 10px" class="input-group">
					                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
					                             PASSWORD 
					                            <input id="login-password" type="password" class="form-control" name="password" placeholder="password" pattern=".{5,}" title="Minmimum 5 letters or numbers." oninvalid="this.setCustomValidity('Enter a password')" oninput="setCustomValidity('')" required>
					                        </div>
					                        <div class="center-text">
					                            <label><input id="login-remember" type="checkbox" name="remember" value="1"> Remember me</label>
					                        </div>
					                        <div class="center-text">
					                            <span class="error-message color-red"><i class="glyphicon glyphicon-warning-sign"></i> Username & password don't match!</span>
					                        </div>
					                        <div style="margin-top:10px" class="form-group">
					                            Button
					                            <div class="col-sm-12 controls center-text">
					                              <a id="btn-login" href="#" class="btn btn-block btn-success">Login</a>
					                              <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a>
					                            </div>
					                        </div>  
					                    </form>
					                </div>                
					            </li>
					          </ul>
					          <!-- Need to be worked on latter End -->
					</div>
					<div class="row">
						<form id="search-form" class="form-inline" role="form" method="post" action="//www.google.com/search" target="_blank">
    						<div class="input-group">
       							 <input type="text" class="form-control search-form" placeholder="Search">
     							
  						  </div>
						</form>
					</div>
					
				
				</div>
			</div>
			<div class="row">&nbsp;&nbsp;&nbsp;</div>
		</nav>
	</header> 
	
	<br>
	<div app-menu></div>
	<br>
	<div id="content" class="content" ng-view autoscroll="true"></div>
	<br>
	
	 <footer>
		 <nav class="navbar navbar-light bg-faded">
			<div class="row">
				<div class ="col-lg-4">&nbsp;</div>
				<div class ="col-lg-4">
					<div  style="border-style: solid;" class="text-center" >
						<h6>{{chamberInfo.name}}</h6> 
						<h6>{{chamberInfo.address}}</h6> 
						<h6>{{chamberInfo.city}}, {{chamberInfo.state}} {{chamberInfo.zip}}</h6>
						<h6>Phone: {{chamberInfo.phone}}</h6>
						<h6>Fax: {{chamberInfo.fax}}</h6>
					</div>
				</div>
				<div class ="col-lg-4">
					<div class="text-center">Site Design and Layout By:</div> 
					<div class="text-right"><img alt="CGI Logo" src="images/CGI_logo.png" width="200px" height="100px"></div>		
				</div>
			</div>
			<div class="row">&nbsp;&nbsp;&nbsp;</div>
			<div class="row">&nbsp;&nbsp;&nbsp;</div>
			<div class="row text-center">
				<div class ="col-md-12">
					Site Content and Graphics <i class="fa fa-copyright" aria-hidden="true"></i> and maintained by {{chamberInfo.name}} unless otherwise noted. All Rights Reserved
				</div>
			</div>
		</nav>	 
	</footer> 


<script src="scripts/angular.js"></script>
<script src="scripts/angular-route.js"></script>


<!-- custom libraries -->
<script src="app/common/routes.js"></script>
<script src="app/common/directives/appMenu.js"></script>


<!-- application specific files -->
<script src="app/controllers/landingpageCtrl.js"></script>
<script src="app/controllers/frontEndAppCtrl.js"></script>

<!-- repositories -->
<script src="app/common/repository/utilRepository.js"></script>
<script src="app/common/repository/chamberInfoRepository.js"></script>
<script src="app/common/repository/chamberHomeRepository.js"></script>
</body>
</html>