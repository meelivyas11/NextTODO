<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRM</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:bundle basename="crm"> 
	<fmt:message var="bootstrapVersion" key="bootstrap.version" />
	<link rel='stylesheet' href='<%=request.getContextPath()%>/webjars/bootstrap/<fmt:message key='bootstrap.version'/>/css/bootstrap.min.css'>
</fmt:bundle>

</head>
<body class="container">
	<div class="jumbotron">
		<h1><%= session.getAttribute("chamberName") %></h1>
	</div>
</body>
</html>