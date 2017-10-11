angular.module('frontEndApp').factory('chamberInfoRepository', ['$http','$q', 'utilRepository','$window', function ($http, $q, utilRepository,$window) {
    	
    	 var chamberInfoRepository = {};
    	 chamberInfoRepository.chamberInfo = null;
    	 var ChamberKey = 'chamber';
    	
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
                     $window.localStorage[ChamberKey] = JSON.stringify(chamberInfoRepository.chamberInfo);
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred. : ' + response.status});
                 });

             return deferred.promise;
         };
         
         chamberInfoRepository.getChamberInfo = function () {
        	 if ($window.localStorage[ChamberKey]) {
                 return JSON.parse($window.localStorage[ChamberKey]);
             }
             return null;
         };
         
    	return chamberInfoRepository;
    }]);