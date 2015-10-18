angular.module('brewit')
.controller 'IngredientsController',
(Recipe, ingredients) ->

  @db = ingredients

  getCurrentRecipeIngredients = =>
    @recipeIngredients = Recipe.getIngredients()

  setCurrentRecipeIngredients = =>
    Recipe.setIngredients(@recipeIngredients)

  @nextStep = ->
    setCurrentRecipeIngredients()

  getCurrentRecipeIngredients()

  return false
