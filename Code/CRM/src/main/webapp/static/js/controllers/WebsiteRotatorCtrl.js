var app = angular.module("WebsiteRotatorApp", ['ngAnimate', 'ui.bootstrap']);
app.controller("WebsiteRotatorController", ['$scope', '$http', '$timeout', function($scope, $http, $timeout) {

	$scope.showSuccessAlert = false;
	$scope.showFailAlert = false;
	
	 $http.get("../../AdminController/Rotator/Details").success(function(data) {
		$scope.rotatorDetails = data;
	}).error(function() {
		alert("unexpected error in getting rotator details")
	})
	
	$http.get("../../AdminController/Business/Details").success(function(data) {
		$scope.businessDetails = data;
	}).error(function() {
		alert("unexpected error in getting businessDetails")
	})
	
	$scope.addNew = function(rotatorDetail) {
		 $scope.rotatorDetails.push({
			'rotatorId' : "",
			'business' : "",
			'header' : "",
		});
	};

	$scope.saverotators = function() {
		angular.forEach($scope.rotatorDetails, function(selected) {
			if (selected.business.businessId == null) {
				$scope.rotatorDetails.remove(selected);
			}
		});
    	
    	$http.post('../../AdminController/Rotator/Save', JSON.stringify($scope.rotatorDetails))
	    .success(function(data) {
	    	$scope.successTextAlert = "Website Rotator Saved Sucessfully";
	    	$scope.showSuccessAlert = true;
	    	$timeout(function () { $scope.showSuccessAlert = false; }, 3000);  
	    	
		}).error(function() {
			$scope.failMessage = "Due to some internal issues, Website Rotator couldn't be saved";
			$scope.failTextAlert = true;
			$timeout(function () { $scope.showFailAlert = false; }, 3000);
	    })
	};
	
	$scope.remove = function() {
		var newDataList = [];
		$scope.selectedAll = false;
		angular.forEach($scope.rotatorDetails, function(selected) {
			if (!selected.selected) {
				newDataList.push(selected);
			}
		});
		$scope.rotatorDetails = newDataList;
	};

	$scope.checkAll = function(rotatorDetail) {
		if ($scope.selectedAll) {
			$scope.selectedAll = true;
		} else {
			$scope.selectedAll = false;
		}
		angular.forEach($scope.rotatorDetails, function(rotatorDetail) {
			rotatorDetail.selected = $scope.selectedAll;
		});
	};
	
    
}]);


