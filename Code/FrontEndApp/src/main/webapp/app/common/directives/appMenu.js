angular.module('frontEndApp')
	.directive('appMenu', ['$rootScope', '$location',  function ($rootScope, $location) {
            return {
                restrict: 'A',
                templateUrl: 'app/views/app-menu.html'
            };
        }
    ]);