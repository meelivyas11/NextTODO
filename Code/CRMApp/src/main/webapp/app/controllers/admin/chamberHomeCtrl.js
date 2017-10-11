angular.module('CRMApp')
	.controller('chamberHomeCtrl', ['$scope', 'ContactRoles', 'session','chamberHomeRepository', function ($scope, ContactRoles, session,chamberHomeRepository) {
	
		$scope.ContactRoles = ContactRoles;
		$scope.homePageImgFile = null;
		
		chamberHomeRepository.getChamberHomeDetails().then(function(data) {
			if (data.success) {
				$scope.chamberHome = chamberHomeRepository.chamberHome;
			} else {
				console.log('Error : ' + data.message);
			}
		}, function(data) {
			console.log('Failure : ' + data.message);
		});
		
		$("#homePageImgFile").change(function() {
				var reader = new FileReader();
	            reader.onload = $scope.homePageImageIsLoaded; 
	            reader.readAsDataURL(this.files[0]);
			});
			
		$scope.homePageImageIsLoaded = function(e){
		        $scope.$apply(function() {
		        	var solution= e.target.result.split("base64,");
		        	$scope.chamberHome.homePageImg =solution[1];; 
		        })
		  };
		
		  
		  $scope.ChamberHomeSubmit = function () {
	    	chamberHomeRepository.saveChamberHomeDetails($scope.chamberHome)
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