angular.module('CRMApp')
	.controller('globalWebsiteCtrl', ['$scope', 'ContactRoles', 'session','chamberInfoRepository', function ($scope, ContactRoles, session,chamberInfoRepository) {
	
		$scope.ContactRoles = ContactRoles;
		$scope.chamberInfo = session.getChamber();
		$scope.logoFile = null;
		
		
		
		$("#logoFile").change(function() {
			var reader = new FileReader();
            reader.onload = $scope.logoIsLoaded; 
            reader.readAsDataURL(this.files[0]);
		});
		
		  $scope.logoIsLoaded = function(e){
		        $scope.$apply(function() {
		        	var solution= e.target.result.split("base64,");
					$scope.chamberInfo.logo = solution[1];
		        })
		  };
		  
		$scope.GlobalWebsiteSubmit = function () {
			chamberInfoRepository.saveChamberDetails($scope.chamberInfo)
			.then(function(data) {
				if (data.success) {
					session.setChamber($scope.chamberInfo);
				} else {
					console.log('Error : ' + data.message);
				}
			}, function(data) {
				console.log('Failure : ' + data.message);
			});
		  }
		
}]);