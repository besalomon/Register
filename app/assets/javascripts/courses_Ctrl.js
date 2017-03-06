(function() {
  "use strict";

  angular.module("app").controller("coursesCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/courses.json").then(function(response) {
        $scope.courses = response.data;
      });
    }   

})();