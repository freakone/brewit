angular.module('brewit')
.controller 'RecipeController',
(recipe) ->

  @data = recipe.data[0]



  # getRecipe = =>
  #   Recipe.get(id)
  #     .success (response) =>
  #       @data = response
  #     .error ->
  #       console.log 'Error, dupa i kamieni kupa!'

  return false
