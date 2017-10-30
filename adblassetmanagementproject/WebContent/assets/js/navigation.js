var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl :"dashboard.jsp"
    })
    .when("/registration", {
        templateUrl : "student/studentRegistration.jsp"
    });
    
});