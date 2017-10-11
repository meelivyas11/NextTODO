<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="CRMApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRM</title>
 <link rel="stylesheet" href="content/bootstrap.min.css">
 <link rel="stylesheet" href="content/frontEndApp.css">
 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" rel="stylesheet">
</head>

<body class="container" ng-controller="CRMAppCtrl">
	
	<header>
	 	<nav class="navbar navbar-light bg-faded">
	 		<div class="row">&nbsp;&nbsp;&nbsp;</div>
			<div class="row">
				<div class="col-lg-12 text-center"><h1>CRM: {{chamberInfo.name}}</h1></div>
			</div>
			<div class="row">&nbsp;&nbsp;&nbsp;</div>
		</nav>
	</header> 
	<br>
	<div class="navbar navbar-light bg-faded" ng-if="showMenu == true">
		<div class="row" >
			<div class="col-lg-11">
				<span ng-bind="'Welcome ' + currentUser.firstName + ' ' + currentUser.lastName + ','" ></span>
			</div>
			<div class="col-lg-1">
				<a ng-href="#!/logout" class="text-right">Logout</a>
			</div>
		</div>
	</div>
	<br>
	
	<div id="content" class="content" ng-view autoscroll="true"></div>

<script src="scripts/angular.js"></script>
<script src="scripts/angular-route.js"></script>
<script src="scripts/angular-cookies.js"></script>
<script src="scripts/angular-animate.js"></script>
<script src="scripts/jquery-3.2.0.min.js"></script>
<script src="scripts/tether.min.js"></script>
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/ui-bootstrap-tpls-1.3.2.js"></script>

<!-- custom libraries -->
<script src="app/common/routes.js"></script>
<script src="app/common/Base64.js"></script>
<script src="app/common/session.js"></script>
<script src="app/common/auth.js"></script>


<!-- application specific files -->
<script src="app/controllers/CRMAppCtrl.js"></script>
<script src="app/controllers/loginCtrl.js"></script>
<script src="app/controllers/homeCtrl.js"></script>
<script src="app/controllers/logoutCtrl.js"></script>
<script src="app/controllers/admin/globalWebsiteCtrl.js"></script>
<script src="app/controllers/admin/chamberHomeCtrl.js"></script>
<script src="app/controllers/admin/websiteRotatorCtrl.js"></script>


<!-- repositories -->
<script src="app/common/repository/utilRepository.js"></script>
<script src="app/common/repository/chamberInfoRepository.js"></script>
<script src="app/common/repository/loginRepository.js"></script>
<script src="app/common/repository/chamberHomeRepository.js"></script>
<script src="app/common/repository/websiteRotatorRepository.js"></script>
<script src="app/common/repository/businessRepository.js"></script>

</body>
</html>