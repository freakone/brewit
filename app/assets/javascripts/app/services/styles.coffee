angular.module('brewit').factory 'Styles', ($http) ->

  get: -> $http.get("/assets/app/sample_json/styles.json")
