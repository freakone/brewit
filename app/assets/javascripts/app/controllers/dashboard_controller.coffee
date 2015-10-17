angular.module('brewit')
.controller 'DashboardController', (Recipes) ->

  @searchQuery = ''
  @searchHop = ''
  @searchMalt = ''
  @searchOrigin = ''
  @recipes = []

  getRecipes = =>
    Recipes.get()
      .success (response) =>
        @recipes = response
      .error ->
        console.log 'No recipes found or something.'

  getRecipes()

  return false
