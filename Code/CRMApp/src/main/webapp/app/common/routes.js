var app = angular.module("CRMApp", ["ngRoute", "ngCookies", 'ngAnimate', 'ui.bootstrap']);

app.config(['$routeProvider','ContactRoles' , function($routeProvider, ContactRoles) {
    $routeProvider
    .when("/", {
    	templateUrl: 'app/views/login.html',
        controller: 'loginCtrl',
        caseInsensitiveMatch: true
    })
    .when("/home", {
        templateUrl : "app/views/home.html",
        controller: 'homeCtrl',
        caseInsensitiveMatch: true,
    })
    .when("/logout", {
        templateUrl : "app/views/login.html",
        controller: 'logoutCtrl',
        caseInsensitiveMatch: true,
    })
    .when("/admin/adminHome", {
        templateUrl : "app/views/admin/adminHome.html",
        caseInsensitiveMatch: true,
        data: { authorizedRoles: [ContactRoles.chamberStaff] }
    })
    .when("/admin/globalWebsite", {
        templateUrl : "app/views/admin/globalWebsite.html",
        controller: 'globalWebsiteCtrl',
        caseInsensitiveMatch: true,
        data: { authorizedRoles: [ContactRoles.chamberStaff] }
    })
    .when("/admin/chamberHome", {
        templateUrl : "app/views/admin/chamberHome.html",
        controller: 'chamberHomeCtrl',
        caseInsensitiveMatch: true,
        data: { authorizedRoles: [ContactRoles.chamberStaff] }
    })
    .when("/admin/websiteRotator", {
        templateUrl : "app/views/admin/websiteRotator.html",
        controller: 'websiteRotatorCtrl',
        caseInsensitiveMatch: true,
        data: { authorizedRoles: [ContactRoles.chamberStaff] }
    })
    .when('/Error/NotAuthorized', {
        templateUrl: 'app/views/not-authorized.html',
        caseInsensitiveMatch: true
    })
    .when('/Error/NotFound', {
        templateUrl: 'app/views/not-found.html',
        caseInsensitiveMatch: true
    })
    .otherwise({
        redirectTo: '/Error/NotFound'
    });
}]);