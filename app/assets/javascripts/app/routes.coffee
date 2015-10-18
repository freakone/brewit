angular.module('brewit')
.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/app/dashboard"

  $stateProvider
    .state 'dashboard',
      url: '/app/dashboard'
      controller: 'DashboardController as dashboard'
      templateUrl: 'dashboard.html'

    .state 'recipe',
      url: '/app/recipe/id/:recipeId'
      controller: 'RecipeController as recipe'
      templateUrl: 'recipe.html'
      resolve:
        recipe: ($stateParams, Recipe) ->
          Recipe.get($stateParams.recipeId)

    .state 'newRecipe',
      url: '/app/recipe/new'
      controller: 'NewRecipeController as newRecipe'
      templateUrl: 'new_recipe.html'
      resolve:
        ingredients: (Ingredients) ->
          Ingredients.fetch()
