<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body class="container">
	<button type="button" class="btn btn-primary btn-lg btn-block">Search Businesses</button> <br>
 	<button type="button" class="btn btn-primary btn-lg btn-block">Search Contacts</button> <br>
 	<button type="button" class="btn btn-primary btn-lg btn-block">Committees</button> <br>
 	<button type="button" class="btn btn-primary btn-lg btn-block">Events</button> <br>
 	<button type="button" class="btn btn-primary btn-lg btn-block">Gift Certificates</button> <br>
 	<button type="button" class="btn btn-primary btn-lg btn-block">Reports</button> <br>
 	
 	<form name="AdminHome" action="<%=request.getContextPath()%>/AdminController/ShowAdminHome" method="get">
 		<input type="submit" name="submit" value="Admin" class="btn btn-primary btn-lg btn-block">
 	</form>
</body>
</html>