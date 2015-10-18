angular.module('brewit').factory 'Ingredients', ($q, $http) ->
  fetch: ->
    d = $q.defer()
    $http.get("/api/internal/ingredients").then (response) ->
      d.resolve(response.data)
    d.promise
