angular.module('CRMApp').factory('chamberHomeRepository', ['$http','$q', 'utilRepository', function ($http, $q, utilRepository) {
    	
    	 var chamberHomeRepository = {};
    	 chamberHomeRepository.chamberHome = null;
    	
    	 chamberHomeRepository.getChamberHomeDetails = function () {
             var deferred = $q.defer();
             $http.get(utilRepository.API_URL_WITHOUT_AUTH + 'chamberHomes').then(
                 function (response) {
                     deferred.resolve({success: true, message: response.status});
                     chamberHomeRepository.chamberHome = response.data;
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred. : ' + response.status});
                 });

             return deferred.promise;
         };
         
    	 chamberHomeRepository.saveChamberHomeDetails = function (chamberHome) {
    		 //console.log(chamberHome);
             var deferred = $q.defer();
             $http.put(utilRepository.API_URL_WITH_AUTH + 'chamberHomes/'+ chamberHome.chamberHomeId , JSON.stringify(chamberHome)).then(
                 function (response) {
                     deferred.resolve({success: true, message: response.status});
                     chamberHomeRepository.chamberHome = response.data;
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred. : ' + response.status});
                 });

             return deferred.promise;
         };
         
    	return chamberHomeRepository;
    }]);