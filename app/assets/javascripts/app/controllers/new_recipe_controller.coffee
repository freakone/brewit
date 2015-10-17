angular.module('brewit')
.controller 'NewRecipeController',
(Recipe, $state) ->

  class Step
    constructor: (@description, @duration, @requirements) ->

  @page = 1

  @stepForm =
    description: ''
    duration: ''
    requirements: ''

  @params =
    style: ''
    type: ''
    yeasts: ''
    malts: ''
    hops: ''
    add_ons: ''
    name: ''
    impression: ''
    taste: 0
    bitterness: 0
    aroma: 0
    foam: 0
    purity: 0
    recipe_by_step: []

  saveStep = =>
    @params.recipe_by_step.push new Step(@stepForm.description, @stepForm.duration, @stepForm.requirements)

  @addStep = =>
    saveStep()

  @saveRecipe = =>
    console.log 'lol'
    Recipe.create(@params)
      .success (response) ->
        $state.go('recipe', { recipeId: 1 })
      .error ->
        console.log 'Nie zapisano recepty. :('
        $state.go('recipe', { recipeId: 1 })

  return false
