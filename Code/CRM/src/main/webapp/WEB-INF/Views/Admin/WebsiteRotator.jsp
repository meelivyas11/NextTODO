<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false" %>

<fmt:bundle basename="crm"> 
	<fmt:message var="jqueryVersion" key="jquery.version" />
	<script type="text/javascript" src='<%=request.getContextPath()%>/webjars/jquery/<fmt:message key='jquery.version'/>/jquery.min.js'> </script>
	
	<fmt:message var="datatablesVersion" key="datatables.version" />
	<link rel='stylesheet' href='<%=request.getContextPath()%>/webjars/datatables/<fmt:message key='datatables.version'/>/css/jquery.dataTables.min.css'>
	<script type="text/javascript" src='<%=request.getContextPath()%>/webjars/datatables/<fmt:message key='datatables.version'/>/js/jquery.dataTables.min.js'> </script>
	
	<fmt:message var="angularjsVersion" key="angularjs.version" />
	<script src='<%=request.getContextPath()%>/webjars/angularjs/<fmt:message key='angularjs.version'/>/angular.min.js'></script>
	
	<fmt:message var="bootstrapVersion" key="bootstrap.version" />
	<script  src='<%=request.getContextPath()%>/webjars/bootstrap/<fmt:message key='bootstrap.version'/>/js/bootstrap.min.js'></script>
</fmt:bundle>

<script src="<c:url value='/static/js/controllers/WebsiteRotatorCtrl.js'  />"></script>
<script src="<c:url value='/static/js/common/angular-animate.js'  />"></script>
<script src="<c:url value='/static/js/common/ui-bootstrap-tpls-1.3.2.js'  />"></script>

</head>

<body class="container">
	<div><jsp:include page="../Shared/Header.jsp" /></div>
	
	 <div class="row">
	    <div class="col-md-6"><h1>Website Rotator</h1></div>
	    <div class="col-md-6 text-right"><h3><a href="<%=request.getContextPath()%>/ShowHome">Home</a></h3></div>
  	</div>
	<br><br>
	
	<div  ng-app="WebsiteRotatorApp" ng-controller="WebsiteRotatorController">
		<div class="row">
			<div class="alert alert-success" ng-show="showSuccessAlert"><strong>Done!</strong> {{successTextAlert}}</div>
		    <div class="alert alert-danger" ng-show="showFailAlert"><strong>Issues!</strong> {{failTextAlert}}</div> 
		</div>
		
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form ng-submit="addNew(WebsiteRotatorForm.$valid);" name="WebsiteRotatorForm">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" ng-model="selectedAll" ng-click="checkAll()" /></th>
                                        <th>Company Name</th>
                                        <th>Header</th>
                                       </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="rotator in rotatorDetails">
                                        <td><input type="checkbox" ng-model="rotator.selected" /></td>
                                        <td ng-form="CompanyForm" >
										    <input placeholder="Search" ng-required="true" name="companyNameInput" type="text"  ng-model="rotator.business" 
										     uib-typeahead="business as business.companyName for business in businessDetails | filter:{companyName:$viewValue} | limitTo:5 "  
										     typeahead-min-length="1" typeahead-show-hint="true" class="form-control" >
										     
										     <span class="text-danger pull-right" ng-show="!CompanyForm.companyNameInput.$modelValue.businessId && !CompanyForm.companyNameInput.$error.required">Please enter valid Company Name</span> 
									 
           								</td>
           								<td><input type="text" class="form-control" ng-model="rotator.header" required/></td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="form-group">
                                <input ng-hide="!rotatorDetails.length" type="button" class="btn btn-danger pull-right" ng-click="remove()" value="Delete">
                                <input type="submit" class="btn btn-primary addnew pull-right" value="Add New" style="margin-right: 10px;">
                                 <input type="submit" class="btn btn-success saverotators pull-right" value="Save" style="margin-right: 10px;" ng-click="saverotators()">
                            </div>
                     </form>
                    </div>
                </div>
            </div>
        </div>
   </div>

</body>
</html>