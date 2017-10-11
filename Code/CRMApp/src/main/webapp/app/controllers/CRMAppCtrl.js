angular.module('CRMApp')
	.controller('CRMAppCtrl', ['$scope', '$http','chamberInfoRepository','session','auth','$window','$rootScope', function ($scope, $http, chamberInfoRepository, session, auth, $window, $rootScope) {
		
		$scope.currentUser = session.getUser();
		if($scope.currentUser) {
			$rootScope.showMenu = true;
			session.setHeaders($scope.currentUser.userName, $scope.currentUser.password);
		}
		else {
			$rootScope.showMenu = false;
		}
		
		//console.log($scope.currentUser);
		
		chamberInfoRepository.getChamberDetails($scope.searchActive, $scope.currentPage,$scope.itemsPerPage, $scope.sortProperty,$scope.sortOrder)
		.then(function(data) {
			if (data.success) {
				$scope.chamberInfo = chamberInfoRepository.chamberInfo;
				session.setChamber($scope.chamberInfo);
			} else {
				console.log('Error : ' + data.message);
			}
		}, function(data) {
			console.log('Failure : ' + data.message);
		});
	
	}]);