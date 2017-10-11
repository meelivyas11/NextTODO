angular.module('CRMApp')
	.controller('homeCtrl', ['$scope', '$http', 'ContactRoles', '$location', 'session', function ($scope, $http, ContactRoles, $location, session) {
	
		//console.log(" $scope.currentUser from home controller : " + JSON.stringify($scope.currentUser) );
		$scope.ContactRoles = ContactRoles;
	}]);