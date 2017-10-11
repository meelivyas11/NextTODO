angular.module('CRMApp').factory('chamberInfoRepository', ['$http','$q', 'utilRepository', function ($http, $q, utilRepository) {
    	
    	 var chamberInfoRepository = {};
    	 chamberInfoRepository.chamberInfo = null;
    	
    	 chamberInfoRepository.getChamberDetails = function (active, currentPage, results, sortBy, sortOrder) {
             var deferred = $q.defer();
             $http.get(utilRepository.API_URL_WITHOUT_AUTH + 'chambers', {
            	 params: {
                     active: active,
                     currentPage: currentPage,
                     maxResults: results,
                     sortBy: sortBy,
                     sortOrder: sortOrder
                 }
             }).then(
                 function (response) {
                     deferred.resolve({success: true, message: response.status});
                     chamberInfoRepository.chamberInfo = response.data;
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred. : ' + response.status});
                 });

             return deferred.promise;
         };
         
    	 chamberInfoRepository.saveChamberDetails = function (chamber) {
             var deferred = $q.defer();
             $http.put(utilRepository.API_URL_WITH_AUTH + 'chambers/'+ chamber.chamberInfoId , JSON.stringify(chamber)).then(
                 function (response) {
                     deferred.resolve({success: true, message: response.status});
                     chamberInfoRepository.chamberInfo = response.data;
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred. : ' + response.status});
                 });

             return deferred.promise;
         };
         
    	return chamberInfoRepository;
    }]);