angular.module('brewit').factory 'Recipes', ($http) ->

  get: -> $http.get('/assets/app/sample_json/recipes.json')
