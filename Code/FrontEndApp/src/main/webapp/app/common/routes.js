var app = angular.module("frontEndApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
    	templateUrl: 'app/views/landingpage.html',
        controller: 'landingpageCtrl',
        caseInsensitiveMatch: true
    })
    .when("/red", {
        templateUrl : "red.htm"
    })
    .when("/green", {
        templateUrl : "green.htm"
    })
    .when("/blue", {
        templateUrl : "blue.htm"
    });
});