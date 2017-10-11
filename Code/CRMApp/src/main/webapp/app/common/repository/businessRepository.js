angular.module('CRMApp').factory('businessRepository', ['$http','$q', 'utilRepository', function ($http, $q, utilRepository) {
    	
    	 var businessRepository = {};
    	 businessRepository.business = null;
    	
    	 businessRepository.getBusinessDetails = function () {
             var deferred = $q.defer();
             $http.get(utilRepository.API_URL_WITHOUT_AUTH + 'businesses').then(
                 function (response) {
                     deferred.resolve({success: true, message: response.status});
                     businessRepository.business = response.data;
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred. : ' + response.status});
                 });

             return deferred.promise;
         };
         
    	return businessRepository;
    }]);