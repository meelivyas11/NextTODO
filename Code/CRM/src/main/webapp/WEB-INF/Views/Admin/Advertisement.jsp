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
	    <div class="col-md-6"><h1>Advertising</h1></div>
	    <div class="col-md-6 text-right"><h3><a href="<%=request.getContextPath()%>/ShowHome">Home</a></h3></div>
  	</div>
	<br><br>
	
	<div class="row" id="Advertisement">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
			            <form:form modelAttribute="CollectionWrapper" enctype="multipart/form-data" action='<%=request.getContextPath()+ "/AdminController/ChamberInfo/Update"%>' method="post" class="form-horizontal">
			                <table class="table table-striped table-bordered">
			                    <thead>
			                        <tr>
			                            <th>Company Name</th>
			                            <th>Advertising URL</th>
			                            <th>Advertising Image</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                       	<c:forEach varStatus="status" var="advertisement" items="${CollectionWrapper.advertisements}" >
					                    <tr>
					                        <td><input  class="form-control" type="text" name="advertisement[${status.index}].business" value="${advertisement.business.companyName}"/></td>
					                        <td><input  class="form-control" type="text" name="advertisement[${status.index}].url" value="${advertisement.url}"/></td>
					                        <td><input  class="form-control" type="text" name="advertisement[${status.index}].image" value="${advertisement.image}"/></td> 
					                    </tr>
					                </c:forEach>
			                    </tbody>
			                </table>
			
			                <div class="form-group">
			                    <input  type="button" class="btn btn-danger pull-right" value="Delete" > 
			                    <input type="button" class="btn btn-primary addnew pull-right" value="Add New" style="margin-right: 10px;">
			                    <input type="submit" class="btn btn-success saverotators pull-right" value="Save" style="margin-right: 10px;">
			                </div>
			         </form:form>
        </div>
      </div></div>
    </div>
    
    <c:if test="${not empty lists}">
		<ul>
			<c:forEach var="listValue" items="${lists}">
				<li>${listValue}</li>
			</c:forEach>
		</ul>

	</c:if>

</body>
</html>