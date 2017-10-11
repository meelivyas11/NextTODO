angular.module('frontEndApp')
	.controller('landingpageCtrl', ['$scope', '$http','chamberHomeRepository', function ($scope, $http, chamberHomeRepository) {
	
	$scope.chamberHome = null;
		
	chamberHomeRepository.getChamberHomeDetails().then(function(data) {
		if (data.success) {
			$scope.chamberHome = chamberHomeRepository.chamberHome;
		} else {
			console.log('Error : ' + data.message);
		}
	}, function(data) {
		console.log('Failure : ' + data.message);
	});
	
}]);