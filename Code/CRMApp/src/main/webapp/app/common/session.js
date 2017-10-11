angular.module('CRMApp').factory('session', ['$rootScope', 'AuthEvents', '$window','Base64','$http', '$q', function ($rootScope, AuthEvents, $window, Base64,$http, $q) {
	
	 var session = {};
	 var UserKey = 'user';
	 var ChamberKey = 'chamber';
	 
	 
	 session.getUser = function () {
		 if ($window.localStorage[UserKey]) {
             return JSON.parse($window.localStorage[UserKey]);
         }
         return null;
     };

     // stores user in local storage
     session.setUser = function (ctUser, ctRoles) {
    	 ctUser.roles = ctRoles;
    	 if (ctUser) {
             $window.localStorage[UserKey] = JSON.stringify(ctUser);
         } else {
             session.destroy();
         }

        // $rootScope.$emit(SessionEvents.userUpdated);
     };
     
     
     session.setHeaders = function (username, password) {
    	 console.log("Setting up the Headers")
         var authdata = Base64.encode(username + ':' + password);
         $http.defaults.headers.common['Authorization'] = 'Basic ' + authdata;
         $http.defaults.headers.common['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8 ';
         
         var deferred = $q.defer();
         deferred.resolve({success: true, message: 200});
         return deferred.promise;
     };
     
     
     // remove session info from local storage
     session.destroy = function () {
         delete $window.localStorage[UserKey];
         return;
     };

     // destroy session when the user is not authenticated
     $rootScope.$on(AuthEvents.notAuthenticated, function () {
         session.destroy();
     });
     
     session.getChamber = function () {
		 if ($window.localStorage[ChamberKey]) {
             return JSON.parse($window.localStorage[ChamberKey]);
         }
         return null;
     };

     // stores user in local storage
     session.setChamber = function (chamber) {
    	 if (chamber) {
             $window.localStorage[ChamberKey] = JSON.stringify(chamber);
         } else {
             session.destroy();
         }

        // $rootScope.$emit(SessionEvents.userUpdated);
     };
     
     return session;
     
}]);