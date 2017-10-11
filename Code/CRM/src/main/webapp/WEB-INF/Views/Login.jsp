<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body class="container">
	<div><jsp:include page="Shared/Header.jsp" /></div>
	
	<div class="row col-md-4 col-md-offset-4"></div>
	<div class="row col-md-4 col-md-offset-4"></div>
	<div class="row col-md-4 col-md-offset-4">	
		<form name="LoginForm" action="<%=request.getContextPath()%>/AccountController/Login" method="post" class="form-group">
			<div class="form-group col-mid-4"><input type="text" class="form-control" name="userName" id="userName" placeholder="UserName"></div> 
			<div class="form-group col-mid-4"><input type="password" class="form-control" name="password" id="password" placeholder="Password"></div>
			<div class="form-group col-mid-4"> <input type="submit" name="submit" value="Login" class="btn btn-success btn-sm btn-block"> </div>
		</form>
	</div>
</body>
</html>