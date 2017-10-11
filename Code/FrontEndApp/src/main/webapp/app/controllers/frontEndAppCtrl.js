angular.module('frontEndApp')
	.controller('frontEndAppCtrl', ['$scope', '$http', 'chamberInfoRepository', function ($scope, $http, chamberInfoRepository) {
		
	chamberInfoRepository.getChamberDetails($scope.searchActive, $scope.currentPage,$scope.itemsPerPage, $scope.sortProperty,$scope.sortOrder)
	.then(function(data) {
		if (data.success) {
			$scope.chamberInfo = chamberInfoRepository.chamberInfo;
		} else {
			alert('Error : ' + data.message);
		}
	}, function(data) {
		alert('Failure : ' + data.message);
	});
	
}]);