angular.module('brewit').factory 'Recipe', ($http) ->

  get: (id) -> $http.get("/assets/app/sample_json/recipe_#{id}.json")

  create: (params) -> $http.post("")
