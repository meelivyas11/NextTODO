angular.module('CRMApp')
	.controller('websiteRotatorCtrl', ['$scope', 'ContactRoles', 'websiteRotatorRepository','businessRepository', function ($scope, ContactRoles, websiteRotatorRepository, businessRepository) {
	
		$scope.ContactRoles = ContactRoles;
			
		websiteRotatorRepository.getWebsiteRotatorDetails().then(function(data) {
			if (data.success) {
				$scope.rotatorDetails = websiteRotatorRepository.websiteRotator;
			} else {
				console.log('Error : ' + data.message);
			}
		}, function(data) {
			console.log('Failure : ' + data.message);
		});
		
		businessRepository.getBusinessDetails().then(function(data) {
			if (data.success) {
				$scope.businessDetails = businessRepository.business;
			} else {
				console.log('Error : ' + data.message);
			}
		}, function(data) {
			console.log('Failure : ' + data.message);
		});
		
		$scope.addNew = function(rotatorDetail) {
			 $scope.rotatorDetails.push({
				'rotatorId' : "",
				'business' : "",
				'header' : "",
			});
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
		
		
		$scope.saverotators = function() {
			angular.forEach($scope.rotatorDetails, function(selected) {
				if (selected.business.businessId == null || selected.business.companyName == null || !selected.header) {
					$scope.rotatorDetails.remove(selected);
				}
			});
	    	
			websiteRotatorRepository.saveWebsiteRotator($scope.rotatorDetails)
				.then(function(data) {
					if (data.success) {
						// do nothing
					} else {
						console.log('Error : ' + data.message);
					}
				}, function(data) {
					console.log('Failure : ' + data.message);
				});
			
	    	/*$http.post('../../AdminController/Rotator/Save', JSON.stringify($scope.rotatorDetails))
		    .success(function(data) {
		    	$scope.successTextAlert = "Website Rotator Saved Sucessfully";
		    	$scope.showSuccessAlert = true;
		    	$timeout(function () { $scope.showSuccessAlert = false; }, 3000);  
		    	
			}).error(function() {
				$scope.failMessage = "Due to some internal issues, Website Rotator couldn't be saved";
				$scope.failTextAlert = true;
				$timeout(function () { $scope.showFailAlert = false; }, 3000);
		    })*/
		};
		
}]);