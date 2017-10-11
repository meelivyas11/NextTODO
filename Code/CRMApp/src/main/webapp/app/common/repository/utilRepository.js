angular.module('CRMApp').factory('utilRepository', ['$http','$q', function ($http, $q) {
    	
    	 var utilRepository = {};
    	 
    	 utilRepository.API_URL_WITHOUT_AUTH = "http://localhost:8081/DBaccess/webapi/";
    	 utilRepository.API_URL_WITH_AUTH = "http://localhost:8081/DBaccess/webapi/auth/";

    	 return utilRepository;
    }]);