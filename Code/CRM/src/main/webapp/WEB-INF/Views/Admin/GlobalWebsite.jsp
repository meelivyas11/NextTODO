<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false" %>
</head>

<body class="container">
	<div><jsp:include page="../Shared/Header.jsp" /></div>
	
	 <div class="row">
	    <div class="col-md-6"><h1>Global Website</h1></div>
	    <div class="col-md-6 text-right"><h3><a href="<%=request.getContextPath()%>/ShowHome">Home</a></h3></div>
  	</div>
	<br><br>
  	
  	<div id="GlobalWebsite" class="container text-left">
		<div class="row">
			<c:set var="contextPath" value="<%=request.getContextPath() %>" /> 
			<form:form modelAttribute="ChamberInfo"  enctype="multipart/form-data" action='<%=request.getContextPath()+ "/AdminController/ChamberInfo/Update"%>' method="post" class="form-horizontal">
				<form:hidden path="chamberInfoId"/>
				<div class="form-group"> 
					<label class="control-label col-sm-2">Chamber Name</label>
					<div class="col-sm-8"><form:input path="name" type="text" class="form-control"/></div>  
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2">Address</label>
					<div class="col-sm-8"><form:input path="address" type="text" class="form-control"/></div>  
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2">City</label>
					<div class="col-sm-8"><form:input path="city" type="text" class="form-control"/></div>  
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2">State</label>
					<div class="col-sm-8"><form:input path="state" type="text" class="form-control"/></div>  
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2">Facebook URL</label>
					<div class="col-sm-8"><form:input path="facebookURL" type="text" class="form-control"/></div>  
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2">Twitter URL</label>
					<div class="col-sm-8"><form:input path="twitterURL"  type="text" class="form-control"/></div>  
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2">LinkedIn URL</label>
					<div class="col-sm-8"><form:input path="linkedInURL" type="text" class="form-control"/></div>  
				</div>
								
				<div class="form-group"> 
					<label class="control-label col-sm-2"><br><br>Logo</label>
					<div class="col-sm-2 align-middle"><img alt="img" src="data:image/png;base64,<c:out value="${logoBase64}"/>" width="150px"/></div>
					<div class="col-sm-6"><br><br><input id="logofile" name="logofile" type="file" class="form-control" /></div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2"><br><br>Home Page Image</label>
					<div class="col-sm-2"><img alt="img" src="data:image/png;base64,<c:out value="${homePageImgBase64}"/>" width="150px"/></div>
					<div class="col-sm-6"><br><br><input id="homePageImgfile" name="homePageImgfile" type="file" class="form-control"/></div>
				</div>
				
				<div class="row">
	 			   <div class="col-md-6 col-md-offset-2"> 
	 			   		<input type="submit" name="submit" value="Update" class="btn btn-primary btn-lg btn-block">
 			   		</div>
		   		</div>
			</form:form> 
		</div>
	</div>
</body>
</html>