<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body class="container">
	<div><jsp:include page="../Shared/Header.jsp" /></div>
	
	 <div class="row">
	    <div class="col-md-6"><h1>Administration</h1></div>
	    <div class="col-md-6 text-right"><h3><a href="<%=request.getContextPath()%>/ShowHome">Home</a></h3></div> 
  	</div>
	<br><br>
	<div class="row">
	    <div class="col-md-6"><input type="submit" name="submit" value="Add/Edit Marketing Letters" class="btn btn-primary btn-lg btn-block"></div>
	    <div class="col-md-6 text-right"><input type="submit" name="submit" value="Update Home Page" class="btn btn-primary btn-lg btn-block"></div> 
  	</div><br>
  	<div class="row">
	    <div class="col-md-6"><input type="submit" name="submit" value="Add/Edit Business Categories" class="btn btn-primary btn-lg btn-block"></div>
	    <div class="col-md-6 text-right"><form action="<%=request.getContextPath()%>/AdminController/Rotator/Show" method="get"><input type="submit" name="submit" value="Add/Edit/Modify Website Rotator" class="btn btn-primary btn-lg btn-block"></form></div> 
  	</div><br>
  	<div class="row">
	    <div class="col-md-6"><input type="submit" name="submit" value="Add/Edit/Modify Users" class="btn btn-primary btn-lg btn-block"></div>
	    <div class="col-md-6 text-right"><form action="<%=request.getContextPath()%>/AdminController/Advertisement/Show" method="get"><input type="submit" name="submit" value="Add/Edit/Modify Advertising" class="btn btn-primary btn-lg btn-block"></form></div>
  	</div><br>
  	<div class="row">
	    <div class="col-md-6"><input type="submit" name="submit" value="Add/Edit/Modify Event Series" class="btn btn-primary btn-lg btn-block"></div>
	    <div class="col-md-6 text-right"><a href="WebsiteRotator.jsp"><input type="submit" name="submit" value="Add/Edit/Modify Staff/Board" class="btn btn-primary btn-lg btn-block"></a></div> 
  	</div><br>
  	<div class="row">
	    <div class="col-md-6"></div>
	    <div class="col-md-6 text-right"><input type="submit" name="submit" value="Add Newletters" class="btn btn-primary btn-lg btn-block"></div> 
  	</div>
  	<br><br>
  	<div class="row">
	    <div class="col-md-6"><form action="<%=request.getContextPath()%>/AdminController/ChamberInfo/Show" method="get"><input type="submit" name="submit" value="Add/Edit/Modify Global Website" class="btn btn-primary btn-lg btn-block"></form></div>
	    <div class="col-md-6"><h4>Chamber Name, Address, Image, Social Media Links</h4></div> 
  	</div>

</body>
</html>