angular.module('CRMApp').factory('websiteRotatorRepository', ['$http','$q', 'utilRepository', function ($http, $q, utilRepository) {
    	
    	 var websiteRotatorRepository = {};
    	 websiteRotatorRepository.websiteRotator = null;
    	
    	 websiteRotatorRepository.getWebsiteRotatorDetails = function () {
             var deferred = $q.defer();
             $http.get(utilRepository.API_URL_WITHOUT_AUTH + 'rotators').then(
                 function (response) {
                     deferred.resolve({success: true, message: response.status});
                     websiteRotatorRepository.websiteRotator = response.data;
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred. : ' + response.status});
                 });

             return deferred.promise;
         };
         
    	 websiteRotatorRepository.saveWebsiteRotator = function (websiteRotatorLst) {
             var deferred = $q.defer();
             
             $http.delete(utilRepository.API_URL_WITH_AUTH + 'rotators').then(
                 function (response) {
                     $http.post(utilRepository.API_URL_WITH_AUTH + 'rotators', JSON.stringify(websiteRotatorLst)).then(
                             function (response) {
                                 deferred.resolve({success: true, message: response.status});
                                 deferred.resolve();
                             },
                             function (response) {
                                 deferred.reject({success: false, message: 'An error has occurred in posting rotators . : ' + response.status});
                    });
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred in deleting rotators : ' + response.status});
             });

             return deferred.promise;
         };
         
    	return websiteRotatorRepository;
    }]);