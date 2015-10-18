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
      redirectTo: 'newRecipe.style'
      url: '/app/recipe/new'
      controller: 'NewRecipeController as newRecipe'
      templateUrl: 'new_recipe.html'

    .state 'newRecipe.style',
      url: '/style'
      name: 'style'
      templateUrl: 'new_recipe.style.html'
      controller: 'StylesController as styles'

    .state 'newRecipe.ingredients',
      url: '/ingredients'
      name: 'ingredients'
      templateUrl: 'new_recipe.ingredients.html'
      controller: 'IngredientsController as ingredients'
      resolve:
        ingredients: (Ingredients) ->
          Ingredients.fetch()

    .state 'newRecipe.process',
      url: '/process'
      name: 'process'
      templateUrl: 'new_recipe.process.html'
      controller: 'ProcessController as process'
