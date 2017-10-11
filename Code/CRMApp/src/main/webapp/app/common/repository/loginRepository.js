angular.module('CRMApp').factory('loginRepository', ['$http', '$cookieStore', '$rootScope', 'utilRepository', '$q', 'ContactRoles',
	function ($http, $cookieStore, $rootScope, utilRepository, $q, ContactRoles) {
    	
    	 var loginRepository = {};
    	 loginRepository.isValidUser = false;
    	 loginRepository.User = null;
    	 loginRepository.ContactRolesList = [];
    	
    	 loginRepository.login = function (username, pass) {
             var deferred = $q.defer();

             //var inputData = $.param({userName: username, password: password });
             var inputData = JSON.stringify({'userName': username, 'password': pass });
             $http.post(utilRepository.API_URL_WITHOUT_AUTH + 'contacts/validate', inputData).then(
                 function (response) {
                     if(response.status == 200){
                    	 loginRepository.isValidUser = true;
                         loginRepository.User = response.data;
                     } else {
                    	 loginRepository.isValidUser = false;
                     }
                     deferred.resolve({success: true, message: response.status});
                     deferred.resolve();
                 },
                 function (response) {
                     deferred.reject({success: false, message: 'An error has occurred while login : ' + response.status});
                 });
             return deferred.promise;
         };
         
         loginRepository.clearCredentials = function () {
             $rootScope.globals = {};
             $cookieStore.remove('globals');
             $http.defaults.headers.common.Authorization = 'Basic ';
         }; 
         
         
         loginRepository.getContactRoles = function (contactId) {
             var deferred = $q.defer();
             
             $http.get(utilRepository.API_URL_WITH_AUTH + 'roles/' +contactId ).then(
	                 function (response) {
	                     deferred.resolve({success: true, message: response.status});
	                     if(response.data.isBusinessAdmin == '1') loginRepository.ContactRolesList.push(ContactRoles.businessAdmin);
	                     if(response.data.isChamberStaff == '1') loginRepository.ContactRolesList.push(ContactRoles.chamberStaff);
	                     if(response.data.isBusinessUserEventPosting == '1') loginRepository.ContactRolesList.push(ContactRoles.businessUserEventPosting);
	                     if(response.data.isBusinessUserJobPosting == '1') loginRepository.ContactRolesList.push(ContactRoles.businessUserJobPosting);
	                     if(response.data.isBusinessUserUpdateWebsite == '1') loginRepository.ContactRolesList.push(ContactRoles.businessUserUpdateWebsite);
	                     if(response.data.isBusinessUserMemberNews == '1') loginRepository.ContactRolesList.push(ContactRoles.businessUserMemberNews);
	                     if(response.data.isContact == '1') loginRepository.ContactRolesList.push(ContactRoles.contact);
	                     
	                     deferred.resolve();
	                 },
	                 function (response) {
	                     deferred.reject({success: false, message: 'An error has occurred while getting contact details. : ' + response.status});
              });
             
             return deferred.promise;
         };
         
        return loginRepository;
    }]);