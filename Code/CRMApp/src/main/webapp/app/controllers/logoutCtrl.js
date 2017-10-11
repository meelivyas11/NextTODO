angular.module('CRMApp')
	.controller('logoutCtrl', ['$location', 'session','$rootScope', function ($location, session, $rootScope) {
		
		session.destroy();
		$location.path('/');
		$rootScope.showMenu = false;
		// $window.sessionStorage.setItem('showMenu', false);
}]);