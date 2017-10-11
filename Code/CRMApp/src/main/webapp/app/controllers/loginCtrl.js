angular.module('CRMApp')
	.controller('loginCtrl', ['$scope', '$http', 'loginRepository', '$location', 'session','AuthEvents','$rootScope', '$window', function ($scope, $http, loginRepository, $location, session, AuthEvents,$rootScope, $window) {
	
	// reset login status
	loginRepository.clearCredentials();
	$scope.currentUser = null;
	
	$scope.LoginSubmit = function () {
	     // $scope.dataLoading = true;
	      loginRepository.login($scope.userName, $scope.password)
		      .then(function(response){
		    	  if(loginRepository.isValidUser) {
		    		  session.setHeaders($scope.userName, $scope.password)
		    		  .then(function(response) {
		    			  loginRepository.getContactRoles(loginRepository.User.contactId)
			    		  	.then(function(response){
					    	    session.setUser(loginRepository.User, loginRepository.ContactRolesList);
					    	    $rootScope.showMenu = true;
					    	    $location.path('/home');
					    	  });
		    		  });
		    		  $location.path('/');
		    	  } else {
		    		  $scope.error = response.message;
		    		  $rootScope.$emit(AuthEvents.notAuthenticated);
		    	  }
		      });
	  }
}]);